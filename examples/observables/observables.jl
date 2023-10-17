#=
# Lorenz model using OrdinaryDiffEq

=#

using WebAssemblyCompiler     # prep some input #hideall
using WebAssemblyCompiler.JS: h
const W = WebAssemblyCompiler
const WebAssemblyCompiler._DEBUG_ = true

using Observables

const names = []
const os = []

function numform(description; jl = description, step = 1, value = 1)
    push!(names, jl)
    push!(os, Observable(value))
    h.div."field has-addons"(
        h.p."control"(
            h.a."button is-static"(
              description
            )
        ),
        h.p."control"(
            h.input."input"(;type = "number", step, value, onchange = "x => wasm.$jl(this.value)")
        ),
    )
end

html = h.div(
    h.div."columns is-vcentered"(
        h.div."column"(
            h.form(
                numform("nsamples", step = 1.0, value = 100),
                numform("sample_step", step = 0.01, value = 0.1),
                numform("phase", step = 0.1, value = 0.0),
                numform("radii", step = 0.1, value = 10.0),
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

nothing #hide

#=
=#


fix!(os::AbstractObservable...) = fix!(Set{AbstractObservable}(), os...)

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
function fix!(ctx::Set{AbstractObservable}, observables::Observable...)
    setfuns = []
    notifies = []
    @show "here"
    @show observables
    @show "here2"
    for observable in observables
        @show observable
        observable in ctx && continue
        push!(ctx, observable)
        mn = makenotify(ctx, observable)
        push!(setfuns,  mn.set!)
        push!(notifies, mn.notify)
    end
    @show ctx
    return (; setfuns, notifies)
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

onany(set_svg, os...)
## onany((a,b,c,d) -> display(d), values(os)...)
fos = fix!(os...)
compile(fos.setfuns...; names = names, filepath = "observables/observables.wasm", validate = true)



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


