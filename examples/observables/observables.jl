#=
# Making an SVG using Observables

This app mimics [this JSServe app](https://simondanisch.github.io/JSServe.jl/stable/animation.html) 
but with interactivity provided by Julia code compiled to WebAssembly.

=#

using WebAssemblyCompiler     # prep some input #hideall
using WebAssemblyCompiler.JS: h
const W = WebAssemblyCompiler
W.setdebug(:offline)
W.unsetdebug(:inline)

using Observables

const names = []
const os = []

function numform(description; jl = description, step = 1, value = 1, args...)
    push!(names, jl)
    push!(os, Observable(value))
    h.div."field"(
        h.label."label"(
          description
        ),
        h.div."control"(
            h.input."input"(;type = "number", step, value, onchange = "document.wasm.$jl(this.value)", args...)
        ),
    )
end

html = h.div(
    h.div."columns is-vcentered"(
        h.div."column is-2"(
            h.form(
                numform("nsamples", step = 5, value = Int32(100), min = 5, max = 1000),
                numform("steps", jl = "sample_step", step = 0.02, value = 0.1, min = 0.02, max = 1.0),
                numform("phase", step = 0.25, value = 0.0, min = 0.0, max = 3.0),
                numform("radii", step = 5.0, value = 10.0, min = 1.0, max = 40.0),
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
    ["<circle cx='", cx, "' cy='", cy, "' r='", r, "' fill='", colors[icol % length(colors) + 1], "'></circle>"]
end

function set_svg(nsamples, sample_step, phase, radii)
    width, height = 900.0, 300.0
    cxs_unscaled = [i*sample_step + phase for i in 1:nsamples]
    cys = [sin(cxs_unscaled[i]) * height/3 + height/2 for i in 1:nsamples]
    cxs = [cxs_unscaled[i] * width/4pi for i in 1:nsamples]
    rr = radii
    ## make an array of strings and numbers to join in JavaScript
    geom = Any["<svg width=", width, " height=", height, " ><g>"]
    for i in 1:nsamples
        append!(geom, circ(cxs[i], cys[i], rr, i))
    end
    push!(geom, "</g></svg>")
    obj = JS.object(geom)
    geom = JS.join(obj)
    JS.sethtml("plot", geom)
end
nothing #hide

#=
The method `set_svg` is what we'll ultimately want to compile.

To get there, we need the code that'll compile the Observables. 
The `fix!` methods take a set of Observables, walk their connections, and return a set of methods that will update the Observables provided.
These methods unroll calls to the listeners of each Observable to make it easier to statically compile.
=#

using Observables

fix!(os::AbstractObservable...) = fix!(Set{AbstractObservable}(), os...)

function fix!(ctx::Set{AbstractObservable}, x...)
end

function fix!(ctx::Set{AbstractObservable}, observables::Observable...)
    setfuns = []
    notifies = []
    for observable in observables
        observable in ctx && continue
        push!(ctx, observable)
        push!(setfuns, (makeset(ctx, observable), typeof(observable.val)))
    end
    return setfuns
end
function makeset(ctx::Set{AbstractObservable}, o::Observable)
    listeners = tuple((fix!(ctx, l[2]) for l in o.listeners)...)
    return val -> begin
        o.val = Observables.to_value(val)
        nnotify(o, listeners...)
    end
end
function fix!(ctx::Set{AbstractObservable}, oa::Observables.OnAny)
    return OnAnyHolder(oa.f, tuple(oa.args...))
    return val -> begin
        f(valargs(args...)...)
        return Consume(false)
    end
end
mutable struct OnAnyHolder{F,A}
    f::F
    args::A
end
function (x::OnAnyHolder)(val)
    x.f(valargs(x.args...)...)
    return Consume(false)
end

function fix!(ctx::Set{AbstractObservable}, mc::Observables.MapCallback)
    set! = makeset(ctx, mc.result)
    result = mc.result
    resultlisteners = tuple((fix!(ctx, l[2]) for l in result.listeners)...)
    return MapCallbackHolder(mc.result, mc.f, tuple(mc.args...), resultlisteners)
end

mutable struct MapCallbackHolder{O,F,A,L}
    result::O
    f::F
    args::A
    listeners::L
end
function (x::MapCallbackHolder)(val)
    x.result.val = x.f(valargs(x.args...)...)
    nnotify(x.result, x.listeners...)
    return Consume(false)
end

@inline valargs() = ()
@inline valargs(x) = (Observables.to_value(x),)
@inline valargs(x, xs...) = (Observables.to_value(x), valargs(xs...)...)

@inline nnotify(o::Observable) = nothing
@inline nnotify(::Nothing) = nothing
@inline function nnotify(o::Observable, f)
    result = f(o.val)
    result.x && return true
    return false
end
@inline function nnotify(o::Observable, f, fs...)
    nnotify(o, f)
    nnotify(o, fs...)
    return false
end
nothing #hide


#=
We also need to patch up some internals in WebAssemblyCompiler.
WebAssembly doesn't handle circular references.
As a kludge, we assign defaults to circular references.
We're okay with that here because these circular references are never used.
=#
W.default(o::Observable{T}) where T = Observable(o.val)
nothing #hide

#=
The last part is pretty simple.
We'll call `onany` to connect our set of input Observables `os` to the `set_svg` method.
`fix!` returns a named tuple with a `setfuns` component that can be passed to `compile`.
Each `setfuns` method is passed a value appropriate for that Observable.
This triggers propagation of updates to the listeners.
=#

onany(set_svg, os...)
setfuns! = fix!(os...)
compile(setfuns!...; names = names, filepath = "observables/observables.wasm")
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
setTimeout(function() {
  var x = document.getElementById("plot")
  if (x.innerHTML === "") {
      x.innerHTML = "<strong>Unsupported browser.</strong> Chrome v119 or Firefox v120 or better should work."
  }
}, 1000)
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


