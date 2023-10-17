#=
# Making an SVG using Observables

This app mimics [this JSServe app](https://simondanisch.github.io/JSServe.jl/stable/animation.html) but with interactivity provided by Julia code compiled to WebAssembly.

=#

using WebAssemblyCompiler     # prep some input #hideall
using WebAssemblyCompiler.JS: h
const W = WebAssemblyCompiler
## const WebAssemblyCompiler._DEBUG_ = true

using Observables

const names = []
const os = []

function numform(description; jl = description, step = 1, value = 1)
    push!(names, jl)
    push!(os, Observable(value))
    h.div."field"(
        h.label."label"(
          description
        ),
        h.div."control"(
            h.input."input"(;type = "number", step, value, onchange = "document.wasm.$jl(this.value)")
        ),
    )
end

html = h.div(
    h.div."columns is-vcentered"(
        h.div."column is-2"(
            h.form(
                numform("nsamples", step = 5.0, value = 100),
                numform("steps", jl = "sample_step", step = 0.05, value = 0.1),
                numform("phase", step = 0.25, value = 0.0),
                numform("radii", step = 5.0, value = 10.0),
            )
        ),
        h.div."column"(
            h.div(id = "plot")
        )
    ),
)
 

#=
## Making the app

[Observables](https://github.com/JuliaGizmos/Observables.jl) are used widely by Julia packages to provide interactivity.
For static compilation, they are problematic, though.
The `Observable` type is not strongly typed, and it's challenging to compile statically.

What we can do is define some Observables and some interactivity and compile the results.

First, we'll create the basics for the updating SVG.
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
    JS.sethtml("plot", string(h.svg(h.g(geom); height, width)))
end
nothing #hide

#=
The `set_svg` is what we'll ultimately want to compile.

To get there, we need the code that'll compile the Observables. 
The `fix!` methods take a set of Observables, walk their connections, and return a set of methods that will update the Observables provided.
These methods unroll calls to the listeners of each Observable to make it easier to statically compile.
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

function fix!(ctx::Set{AbstractObservable}, observables::Observable...)
    setfuns = []
    notifies = []
    for observable in observables
        observable in ctx && continue
        push!(ctx, observable)
        mn = makenotify(ctx, observable)
        push!(setfuns,  mn.set!)
        push!(notifies, mn.notify)
    end
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
nothing #hide


#=
We also need to patch up some internals in WebAssemblyCompiler.
WebAssembly doesn't handle circular references.
As a kludge, we assign defaults to circular references.
We're okay with that here because these circular references are never used.
=#
W.default(o::Observable{T}) where T = Observable(W.default(T))
nothing #hide

#=
The last part is pretty simple.
We'll call `onany` to connect our set of input Observables `os` to the `set_svg` method.
`fix!` returns a named tuple with a `setfuns` component that can be passed to `compile`.
Each `setfuns` method is passed a value appropriate for that Observable.
This triggers propagation of updates to the listeners.
=#

onany(set_svg, os...)
fos = fix!(os...)
compile(fos.setfuns...; names = names, filepath = "observables/observables.wasm", validate = true)
nothing #hide

#=
With this interactivity provided by Observables, we've eliminated almost all of the JavaScript.
`JS.h` methods are used to define the inputs, including an `onupdate` trigger that calls the appropriate WebAssembly function. 
These also define Observables and collect names for the WebAssembly functions.
See 
[`examples/observables.jl`](https://github.com/tshort/WebAssemblyCompiler.jl/blob/main/examples/observables/observables.jl)
for the complete source for this example.
=#

#=

```@raw html
<script src="observables.wasm.js"></script> 
<script type="module">
export async function load_wasm() {
  const response = await fetch('observables.wasm');
  const bytes = await response.arrayBuffer();
  const { instance } = await WebAssembly.instantiate(bytes, jsexports);
  const { basics } = instance.exports;
  return instance.exports;
}
document.wasm = await load_wasm();
document.wasm.radii(10.);
</script>
```
=#


