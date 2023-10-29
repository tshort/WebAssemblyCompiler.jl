#=
# Makie, maybe

* It seems like we're compiling way too many broadcast operations.
* The wasm/wat file grows with the size of the array. We must be storing something we don't want.
=#

using WebAssemblyCompiler     # prep some input #hideall
using WebAssemblyCompiler.JS: h
const W = WebAssemblyCompiler
W.setdebug(:offline)
W.setdebug(:inline)

using Observables
using Makie
using Colors

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
                numform("k1", step = 0.2, value = 1.0),
                numform("k2", step = 0.2, value = 1.0),
                numform("k3", step = 0.2, value = 1.0),
                numform("k4", step = 0.2, value = 1.0),
                numform("k5", step = 0.2, value = 1.0),
                numform("k6", step = 0.2, value = 1.0),
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

const x = 0:0.1:8π
# obs = [Observable(x) for x in (1.0, 0.0, 0.0, 1.0, 0.0, 0.0)]
sine(x, a, ω, ϕ) = a * cos((ω * x + ϕ) * π) 

const y1 = lift((a, ω, ϕ) -> [sine(x, a, ω, ϕ) for x in x], os[1], os[2], os[3])
const y2 = lift((a, ω, ϕ) -> [sine(x, a, ω, ϕ) for x in x], os[4], os[5], os[6])
# const  y3 = lift((y1, y2) -> Float64[x for x in y1], y1, y2)
const y3 = lift((y1, y2) -> Float64[y1[i] + y2[i] for i in eachindex(y1)], y1, y2)

# x = 0..8π
# sine(x, a, ω, ϕ) = a[] * cos((ω[] * x + ϕ[]) * π) 
# y1 = x -> sine(x, os[1], os[2], os[3])
# y2 = x -> sine(x, os[4], os[5], os[6])
# y3 = x -> y1(x) + y2(x)

# const x = 0:0.1:8π
# sine(x, a, ω, ϕ) = a * cos((ω * x + ϕ) * π) 
# const y1 = zeros(length(x))
# const y2 = zeros(length(x))
# const y3 = zeros(length(x))
# onany(os...) do a1, ω1, ϕ1, a2, ω2, ϕ2
#     y1[] .= [sine(x, a1, ω1, ϕ1) for x in x]
#     y2[] .= [sine(x, a2, ω2, ϕ2) for x in x]
#     y3[] .= [y1[i] + y2[i] for i in eachindex(y1)]
# end

fig = Figure()
color1 = :steelblue3
color1a = :midnightblue
color2 = :orange
color2a = :firebrick4

ax1 = Axis(fig[1, 1], title = "Independent sine waves", xlabel = "t", ylabel = "y",
            # xticks = (xtickvals, xtickformat))
)
l1 = lines!(x, y1, label = L"f_1", color = color1)
l2 = lines!(x, y2, label = L"f_2", color = color2)
ylims!(-3.1, 3.1)
# # axislegend(ax1)

ax2 = Axis(fig[2, 1], title = "Sum of sines", xlabel = "t", ylabel = L"f_1 + f_2",
            # xticks = (xtickvals, xtickformat))
)
# # lines!(x, y2, label = L"f_2", color = color2)
# lines!(x, y3, color = :indigo)
lines!(x, y3, color = :orange)
ylims!(-5.2, 5.2)

nothing #hide

#=
## A super basic Makie backend
=#

function project_position(transform_func::T, space, point, model::Makie.Mat4, res, projectionview) where T
    # use transform func
    point = Makie.apply_transform(transform_func, point, space)
    yflip = true
    p4d = Makie.to_ndim(Vec4f, Makie.to_ndim(Vec3f, point, 0f0), 1f0)
    clip = projectionview * model * p4d
    # @show point p4d clip model space camera
    @inbounds begin
        # between -1 and 1
        p = (clip ./ clip[4])[Vec(1, 2)]
        # flip y to match cairo
        p_yflip = Vec2f(p[1], (1f0 - 2f0 * yflip) * p[2])
        # normalize to between 0 and 1
        p_0_to_1 = (p_yflip .+ 1f0) ./ 2f0
    end
    # multiply with scene resolution for final position
    # if point[1] == 1.0
    #     @show point p4d clip model space projectionview p_0_to_1 res (p_0_to_1 .* res)
    # end
    return p_0_to_1 .* res
end

_allplots = Makie.collect_atomic_plots(fig.scene)
zvals = Makie.zvalue2d.(_allplots)
permute!(_allplots, sortperm(zvals))
# const allplots = tuple(filter(x -> x isa Lines || x isa LineSegments, _allplots)...)
const allplots = tuple(filter(x -> x isa Lines, _allplots)...)

function make_svg_function(nargs)
    # color = to_color(primitive.calculated_colors[])
    dummyargs = gensym.(string.(1:nargs))
    e = quote 
            function $(gensym())($(dummyargs...)) 
                svg = Any["<svg width=800 height=600>"]
            end
        end
    ea = e.args[end].args[end].args
    for i in eachindex(allplots)
        push!(ea, primitive_svg_expr(allplots[i], i))
    end
    push!(ea, :(push!(svg, "</svg>")))
    push!(ea, :(display(svg)))
    # push!(ea, :(display(join(svg, ""))))
    # push!(ea, :(display(JS.array_to_string(svg))))
    # push!(ea, :(JS.sethtml("plot", JS.array_to_string(svg))))
    # return e
    # @show e
    return eval(e)
end

function primitive_svg_expr(primitive::Union{Lines, LineSegments}, i)
    scene = Makie.parent_scene(primitive)
    if primitive isa Lines 
        scene = primitive.parent
    end
    root_area = Makie.root(scene).px_area[]
    root_area_height = widths(root_area)[2]
    scene_area = pixelarea(scene)[]
    scene_height = widths(scene_area)[2]
    scene_x_origin, scene_y_origin = scene_area.origin
    top_offset = root_area_height - scene_height - scene_y_origin
    transform_expr = " transform='translate($scene_x_origin,$top_offset)'"
    model = primitive[:model][]
    positions = primitive[1]
    length(to_value(positions)) < 1 && return nothing
    @get_attribute(primitive, (color, linewidth, linestyle))
    transform = Makie.transform_func(primitive)
    space = QuoteNode(to_value(get(primitive, :space, :data)))
    res = scene.camera.resolution[]
    camera = scene.camera
    # @show scene positions transform space model res camera
    projectionview = camera.projectionview[]
    hexcolor = hex(RGB(color isa Vector ? color[1] : color)) 
    opacity = alpha(color isa Vector ? color[1] : color)
    draw_expr = primitive isa Lines ? draw_lines(hexcolor, opacity, transform_expr) : draw_linesegments(hexcolor, opacity, transform_expr)
    return quote
        primitive = allplots[$i]        
        positions = primitive[1]
        # model = primitive[:model][]
        projected_positions = [project_position($transform, $space, p, $model, $res, $projectionview) for p in to_value(positions)]
        $draw_expr
        push!(svg, "'/>")
    end
end
function draw_lines(hexcolor, alpha, transform)
    return quote
        push!(svg, "<polyline fill='none' stroke='#")
        push!(svg, $hexcolor)
        push!(svg, "' stroke-opacity=")
        push!(svg, $alpha)
        push!(svg, $transform)
        push!(svg, " points='")
        for pt in projected_positions
            push!(svg, pt[1])
            push!(svg, ",")
            push!(svg, pt[2])
            push!(svg, " ")
        end
    end
end
function draw_linesegments(hexcolor, alpha, transform)
    return quote
        push!(svg, "<path fill='none' stroke='#")
        push!(svg, $hexcolor)
        push!(svg, "' stroke-opacity=")
        push!(svg, $alpha)
        push!(svg, $transform)
        push!(svg, " d='")
        @inbounds for i in 1:2:length(projected_positions)-1
            p1 = projected_positions[i]
            p2 = projected_positions[i+1]
            push!(svg, " M ")
            push!(svg, p1[1])
            push!(svg, ",")
            push!(svg, p1[2])
            push!(svg, " L ")
            push!(svg, p2[1])
            push!(svg, ",")
            push!(svg, p2[2])
        end
    end
end
 
function primitive_svg_expr(x, i)
end
using CairoMakie
save("ss.png", fig)
fsvg = make_svg_function(6)
onany(fsvg, os...)
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
setfuns = fix!(os...)

#=
Kludge Makie some to try to make it amenable to compilation.

=#

W.default(o::Observable) = Observable(o[])

# Fix up a type issue in Base
using Base.Experimental: @overlay
@overlay W.MT Base.merge(::NamedTuple{(), Tuple{}}, ::Tuple{}) = NamedTuple()

# Don't store the abstract parts of Observables
W.fieldskept(::Type{T}) where T <: Observable = (:ignore_equal_values, :val)
W.fieldskept(::Type{T}) where T <: Observables.MapCallback = ()
W.fieldskept(::Type{T}) where T <: OnAnyHolder = (:f, :args)
W.fieldskept(::Type{T}) where T <: MapCallbackHolder = (:args, :result, :listeners, :f)
W.fieldskept(::Type{T}) where T <: LineSegments = (:converted,)
W.fieldskept(::Type{T}) where T <: Lines = (:converted,)
W.fieldskept(::Type{T}) where T <: Makie.Text = (:converted,)
W.fieldskept(::Type{T}) where T <: Mesh = (:converted,)

setfuns[1][1](1.0)
compile(setfuns...; names = names, filepath = "makie/makie.wasm", validate = true)
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


