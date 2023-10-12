#=
# Lorenz model using OrdinaryDiffEq

=#

using WebAssemblyCompiler     # prep some input #hideall
using WebAssemblyCompiler.JS: h
const W = WebAssemblyCompiler
const WebAssemblyCompiler._DEBUG_ = true
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

function create_svg(nsamples, sample_step, phase, radii)
    width, height = 900.0, 300.0
    cxs_unscaled = [i*sample_step + phase for i in 1:nsamples]
    cys = [sin(cxs_unscaled[i]) * height/3 + height/2 for i in 1:nsamples]
    cxs = [cxs_unscaled[i] * width/4pi for i in 1:nsamples]
    rr = radii
    # geom = ntuple(i -> h.circle(cx=cxs[i], cy=cys[i], r=rr, fill=colors[i%length(colors)+1]), nsamples)
    # geom = Any[h.circle(cx=cxs[i], cy=cys[i], r=rr) for i in 1:nsamples]
    geom = Any[]
    for i in 1:nsamples
        # push!(geom, string(h.circle(cx=cxs[i], cy=cys[i], r=rr)))
        push!(geom, circ(cxs[i], cys[i], rr, i))
    end
    geom = JS.array_to_string(geom)
    # return h.svg(h.g(geom...); width, height)
    return string(h.svg(h.g(geom); height))
end
nothing #hide

#=
=#

function update()
    # p = update_params()
    plot = create_svg(mdpadint("nsamples"), mdpadnum("sample_step"), mdpadnum("phase"), mdpadnum("radii"))
    JS.sethtml("plot", plot)
    nothing
end
nothing #hide

# These utilities update the page inputs.

mdpadint(x) = @jscall("x => mdpad[x]", Int32, Tuple{String}, x)
mdpadnum(x) = @jscall("x => mdpad[x]", Float64, Tuple{String}, x)
nothing #hide

# Before compiling, we need to override some error checks that caused failures.

# Compile `update` to WebAssembly:

compile((update,); filepath = "svg/svg.wasm", validate = true)
nothing #hide

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
