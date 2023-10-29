#=
# Lorenz model using OrdinaryDiffEq

=#

using WebAssemblyCompiler     # prep some input #hideall
using WebAssemblyCompiler.JS: h
const W = WebAssemblyCompiler
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
 h.div(
     h.div."columns is-vcentered"(
         h.div."column"(
             h.form(
                 numform("σ", mdpad = "p1", step = 0.2, value = 10.0),
                 numform("ρ", mdpad = "p2", step = 1.0, value = 28.0),
                 numform("β", mdpad = "p3", step = 0.1, value = 8 / 3),
             )
         ),
         h.div."column"(
             h.div(id = "xyplot")
         )
     ),
     h.div(id = "timeplot")
 )
 
#=
## Making the app

Here is the model that we'll compile.
=#

using OrdinaryDiffEq
using WebAssemblyCompiler

function lorenz!(du,u,p,t)
    σ,ρ,β = p
    du[1] = σ*(u[2]-u[1])
    du[2] = u[1]*(ρ-u[3]) - u[2]
    du[3] = u[1]*u[2] - β*u[3]
end

u0 = [1.0,0.0,0.0]
tspan = (0.0,100.0)
p = (10.0,28.0,8/3)
prob = ODEProblem{true, SciMLBase.FullSpecialize}(lorenz!,u0,tspan,p)  # try to avoid FunctionWrappers with FullSpecialize

const integ = init(prob, Tsit5(), dense = true)
nothing #hide

#=
Here's a simple solver function.
It references `integ`, a predefined integrator.
WebAssembly stores that as a global variable.
=#

function update()
    OrdinaryDiffEq.reinit!(integ)
    integ.p = update_params()
    sol = solve!(integ)
    t = collect(0:0.001:100)
    u1 = Float64[sol(tt)[1] for tt in t]
    u2 = Float64[sol(tt)[2] for tt in t]
    u3 = Float64[sol(tt)[3] for tt in t]
    update_output(t, u1, u2, u3)
    nothing
end
nothing #hide

# These utilities update the page inputs.

mdpadnum(x) = @jscall("x => mdpad[x]", Float64, Tuple{Externref}, JS.object(x))
update_params() = (mdpadnum("p1"), mdpadnum("p2"), mdpadnum("p3"))
nothing #hide

# This function plots the results.

@inline function update_output(t, u1, u2, u3)
    xydata = ((x = u1, y = u2, type = "line", name = "x"),) 
    xylayout = (width = 400.0, height = 400.0, margin = (t = 20., b = 20., l = 20., r = 20.))
    config = (responsive = true,)
    plotly("xyplot", xydata, xylayout, config)
    tdata = ((x = t, y = u1, type = "line", name = "x"), 
             (x = t, y = u2, type = "line", name = "y"), 
             (x = t, y = u3, type = "line", name = "z")) 
    tlayout = (width = 900.0, height = 300.0, margin = (t = 20., b = 20.))
    plotly("timeplot", tdata, tlayout, config)
    nothing
end
plotly(id, data, layout, config) = 
    @jscall("(id, data, layout, config) => Plotly.newPlot(id, data, layout, config)",
        Nothing, Tuple{Externref, Externref, Externref, Externref},
        JS.object(id), data, layout, config)
nothing #hide

# Before compiling, we need to override some error checks that caused failures.

using Base.Experimental: @overlay
@overlay WebAssemblyCompiler.MT @inline SciMLBase.check_error(integrator::SciMLBase.DEIntegrator) = SciMLBase.ReturnCode.Success
## The following function includes a try/catch, so bypass it.
@overlay WebAssemblyCompiler.MT @inline OrdinaryDiffEq.ode_determine_initdt(args...; kw...) = 0.001
nothing #hide

# Compile `update` to WebAssembly:

compile((update,); filepath = "lorenz/lorenz.wasm", validate = true)
nothing #hide

#=
`update()` runs automatically whenever inputs are changed.

[`examples/lorenz.jl`](https://github.com/tshort/WebAssemblyCompiler.jl/blob/main/examples/lorenz/lorenz.jl)
also includes some raw HTML to load Plotly and mdpad and to load the WebAssembly file. 

```@raw html
<script>
    // Weird hack to load Plotly: https://stackoverflow.com/a/3363588
    // https://github.com/JuliaDocs/Documenter.jl/issues/12471
    window.__define = window.define;
    window.__require = window.require;
    window.define = undefined;
    window.require = undefined;
</script>
<script src="https://cdn.plot.ly/plotly-2.26.0.min.js" charset="utf-8"></script>
<script>
    window.define = window.__define;
    window.require = window.__require;
    window.__define = undefined;
    window.__require = undefined;
</script>
<script src="../../js/mdpad.js" ></script>
<script src="lorenz.wasm.js"></script>
<script>
async function mdpad_init() {
    const fetchPromise = fetch('lorenz.wasm');
    const { instance } = await WebAssembly.instantiateStreaming(fetchPromise, jsexports);
    wasm = instance.exports;
}
function mdpad_update() {
    wasm.update()
}
</script>
```
=#
