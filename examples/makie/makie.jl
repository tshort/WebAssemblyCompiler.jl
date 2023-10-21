#=
# Makie, maybe


=#

using WebAssemblyCompiler     # prep some input #hideall
using WebAssemblyCompiler.JS: h
const W = WebAssemblyCompiler
const WebAssemblyCompiler._DEBUG_ = true

using Observables
using Makie

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
                numform("k", step = 2.0, value = 10.0),
            )
        ),
        h.div."column"(
            h.div(id = "plot")
        )
    ),
)
nothing #hide
 
#=
## A basic Makie plot
=#

x = Observable([1:0.1:10;])
k = Observable(1.0)
# v = map(x -> 2x, k)
y = map((x, k) -> [k .* z.^2 for z in x], x, k)
f = Figure()
ax = Axis(f[1, 1])
# hidedecorations!(ax)
# hidespines!(ax)
l = lines!(x, y; label = "Parabola")
nothing #hide

#=
## A super basic Makie backend
=#
# points = map(x -> x * 2, l.converted[1])  # just to try some change
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

include("observable-utils.jl")
fos = fix!(k)

#=
Kludge Makie some to try to make it amenable to compilation.

=#

using Base.Experimental: @overlay
const M = Makie
@overlay W.MT function plot!(scene::Union{Combined, SceneLike}, P::M.PlotFunc, attributes::Attributes, args...; kw_attributes...)
    attributes = merge!(Attributes(kw_attributes), attributes)
    argvalues = to_value.(args)
    pre_type_no_args = plottype(P, argvalues...)
    # plottype will lose the argument types, so we just extract the plot func
    # type and recreate the type with the argument type
    PreType = Combined{plotfunc(pre_type_no_args), typeof(argvalues)}
    used_attrs = used_attributes(PreType, argvalues...)
    convert_keys = intersect(used_attrs, keys(attributes))
    kw_signal = if isempty(convert_keys)
        # lift(f) isn't supported so we need to catch the empty case
        Observable(())
    else
        # Remove used attributes from `attributes` and collect them in a `Tuple` to pass them more easily
        lift((args...) -> Pair.(convert_keys, args), scene, pop!.(attributes, convert_keys)...)
    end
    # call convert_arguments for a first time to get things started
    converted = convert_arguments(PreType, argvalues...; kw_signal[]...)
    # convert_arguments can return different things depending on the recipe type
    # apply_conversion deals with that!

    FinalType, argsconverted = apply_convert!(PreType, attributes, converted)
    converted_node = Observable(argsconverted)
    input_nodes = convert.(Observable, args)
    # introduce a function barrier here
    converted_node = _convert(kw_signal, input_nodes, FinalType)
    # obs_funcs = onany(kw_signal, input_nodes...) do kwargs, args...
    #     # do the argument conversion inside a lift
    #     result = convert_arguments(FinalType, args...; kwargs...)
    #     finaltype, argsconverted_ = apply_convert!(FinalType, attributes, result) # avoid a Core.Box (https://docs.julialang.org/en/v1/manual/performance-tips/#man-performance-captured)
    #     if finaltype != FinalType
    #         error("Plot type changed from $FinalType to $finaltype after conversion.
    #             Changing the plot type based on values in convert_arguments is not allowed"
    #         )
    #     end
    #     converted_node[] = argsconverted_
    # end
    plot_object = plot!(scene, FinalType, attributes, input_nodes, converted_node)
    # bind observable clean up to plot object:
    # append!(plot_object.deregister_callbacks, obs_funcs)
    return plot_object
end
@noinline function _convert(kw_signal, input_nodes, ::Type{FinalType}) where FinalType
    return map(kw_signal, input_nodes...) do kwargs, args...
        convert_arguments(FinalType, args...; kwargs...)
    end
end

W.default(o::Observable) = Observable(o[])

# Fix up a type issue in Base
@overlay W.MT Base.merge(::NamedTuple{(), Tuple{}}, ::Tuple{}) = NamedTuple()

compile(fos.setfuns...; names = names, filepath = "makie/makie.wasm", validate = true)
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


