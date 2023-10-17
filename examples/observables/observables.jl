#=
# Lorenz model using OrdinaryDiffEq

=#

using WebAssemblyCompiler     # prep some input #hideall
using WebAssemblyCompiler.JS: h
const W = WebAssemblyCompiler
const WebAssemblyCompiler._DEBUG_ = true

using Observables

numform(name; mdpad = "name", step = 1, value = 1) =
     h.div."field has-addons"(
       h.p."control"(
         h.a."button is-static"(
           name
         )
       ),
       h.p."control"(
         h.input."input"(;type = "number", mdpad, step, value)
       ),
     )
 html = h.div(
     h.div."columns is-vcentered"(
         h.div."column"(
             h.form(
                 numform("nsamples", mdpad = "nsamples", step = 1.0, value = 100.0),
                 numform("sample_step", mdpad = "sample_step", step = 0.01, value = 0.1),
                 numform("phase", mdpad = "phase", step = 0.1, value = 0.0),
                 numform("radii", mdpad = "radii", step = 0.1, value = 10.0),
             )
         ),
         h.div."column"(
             h.div(id = "plot")
         )
     ),
 )
 

#=
## Making the app

Here is the model that we'll compile.
=#

const colors = ["black", "gray", "silver", "maroon", "red", "olive", "yellow", "green", "lime", "teal", "aqua", "navy", "blue", "purple", "fuchsia"]

function circ(cx, cy, r, icol)
    string("<circle cx='", cx, "' cy='", cy, "' r='", r, "' fill='", colors[icol % length(colors) + 1], "'></circle>")
end

function set_svg(nsamples, sample_step, phase, radii)
    width, height = 900.0, 300.0
    cxs_unscaled = [i*sample_step + phase for i in 1:nsamples]
    cys = [sin(cxs_unscaled[i]) * height/3 + height/2 for i in 1:nsamples]
    cxs = [cxs_unscaled[i] * width/4pi for i in 1:nsamples]
    rr = radii
    geom = Any[]
    for i in 1:nsamples
        push!(geom, circ(cxs[i], cys[i], rr, i))
    end
    geom = JS.array_to_string(geom)
    JS.sethtml("plot", string(h.svg(h.g(geom); height)))
end
os = (nsamples = Observable(100), sample_step = Observable(0.1), phase = Observable(0.0), radii = Observable(10.0))

nothing #hide

#=
=#


fix!(os::AbstractObservable...) = fix!(Set{AbstractObservable}(), os...)
fix!(os::NamedTuple) = fix!(Set{AbstractObservable}(), os)

function fix!(ctx::Set{AbstractObservable}, mc::Observables.MapCallback, val)
    set! = makenotify(ctx, mc.result).set![1]
    newargs = [:(Observables.to_value($a)) for a in mc.args]
    e = quote
        _ -> begin
            $set!($(mc.f)($(newargs...)))
            return Consume(false)
        end
    end
    return eval(e)
end
function fix!(ctx::Set{AbstractObservable}, oa::Observables.OnAny, val)
    newargs = [:(Observables.to_value($a)) for a in oa.args]
    e = quote
        _ -> begin
            $(oa.f)($(newargs...))
            return Consume(false)
        end
    end
    return eval(e)
end
function fix!(ctx::Set{AbstractObservable}, f::Function, val::T) where T
    rettype = code_typed(f, Tuple{T})[1][1].rettype
    if rettype != Consume
        f = x -> (f(x); Consume(false))
    end
    return f
end

function fix!(ctx::Set{AbstractObservable}, x...)
end

#=
Use a function to generate a function.
=#
function fix!(ctx::Set{AbstractObservable}, observables::NamedTuple)
    setfuns = []
    notifies = []
    names = []
    @show "here"
    @show observables
    @show "here2"
    for (name, observable) in pairs(observables)
        observable in ctx && continue
        push!(ctx, observable)
        mn = makenotify(ctx, observable)
        push!(setfuns,  mn.set!)
        push!(notifies, mn.notify)
        push!(names, name)
    end
    return (; setfuns, notifies, names)
end

function makenotify(ctx::Set{AbstractObservable}, observable::Observable{T}) where T
    listeners = Observables.listeners(observable)
    invocations = Any[]
    for (_, f) in listeners
        newf = fix!(ctx, f, observable.val)
        push!(invocations, :(result = $newf(val)))
        push!(invocations, :(result.x && return true))
    end
    e = quote
        () -> begin
            val = $observable[]
            $(invocations...)
            return false
        end
    end
    nnotify = eval(e)
    set! = (val) -> begin
        if observable.ignore_equal_values
            isequal(observable.val, val) && return false
        end
        observable.val = val
        return nnotify()
    end
    return (notify = (nnotify,), set! = (set!, T))
end

W.arraydefault(o::Observable{T}) where T = Observable(W.arraydefault(T))

onany(set_svg, values(os)...)
# onany((a,b,c,d) -> display(d), values(os)...)
# z = map((a,b,c,d) -> b+c, values(os)...)
# nt = (;os..., z)
fobs = fix!(os)
compile(fobs.setfuns...; names = fobs.names, filepath = "observables/observables.wasm", validate = true)
# z = map((a,b,c,d) -> (println("b:", b)), values(os)...)



#=

```@raw html
<script src="../../js/mdpad.js" ></script>
<script src="svg.wasm.js"></script>
<script>
async function mdpad_init() {
    const fetchPromise = fetch('svg.wasm');
    const { instance } = await WebAssembly.instantiateStreaming(fetchPromise, jsexports);
    wasm = instance.exports;
}
function mdpad_update() {
    wasm.update()
}
</script>
```
=#

#=

## Plan to handle circular types:

* If a struct is mutable, create a version with default values. 
* Will need to come up with ways to define defaults for everything.
* Then, fill in the real values. How to do this?
* It should descend down and keep filling in arrays and structs from there.

=#
