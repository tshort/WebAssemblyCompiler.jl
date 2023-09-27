#=
# Lorentz model using OrdinaryDiffEq

---

```@raw html
<div id="inputform"></div>
```
---

=#

using WebAssemblyCompiler #hide
using WebAssemblyCompiler.JS: h            #hide
h.form(
    h.div.field(
        h.label.label("Num"),
        h.div.control(
            h.input.input(type = "numeric", mdpad = "num")
        )
    )
) #hide

# Here is the function we'll compile.


using OrdinaryDiffEq
using WebAssemblyCompiler
# const WebAssemblyCompiler._DEBUG_ = true
# const WebAssemblyCompiler._DEBUG_ = false

function lorenz!(du,u,p,t)
    σ,ρ,β = p
    du[1] = σ*(u[2]-u[1])
    du[2] = u[1]*(ρ-u[3]) - u[2]
    du[3] = u[1]*u[2] - β*u[3]
end

u0 = [1.0,0.0,0.0]
tspan = (0.0,100.0)
p = (10,28,8/3)
prob = ODEProblem{true, SciMLBase.FullSpecialize}(lorenz!,u0,tspan,p)  # try to avoid FunctionWrappers with FullSpecialize

const integ = init(prob, Tsit5())
integ.opts.adaptive = false

# We need to override some error checks that caused failures.

using Base.Experimental: @overlay
@overlay WebAssemblyCompiler.MT @inline SciMLBase.check_error(integrator::SciMLBase.DEIntegrator) = SciMLBase.ReturnCode.Success

# For some reason, the version of `OrdinaryDiffEq.initialize!` doesn't work, so define one here.

function initialize!(integrator, cache)
    integrator.kshortsize = 7
    integrator.fsalfirst = cache.k1
    integrator.fsallast = cache.k7 # setup pointers
    resize!(integrator.k, integrator.kshortsize)
    # Setup k pointers
    integrator.k[1] = cache.k1
    integrator.k[2] = cache.k2
    integrator.k[3] = cache.k3
    integrator.k[4] = cache.k4
    integrator.k[5] = cache.k5
    integrator.k[6] = cache.k6
    integrator.k[7] = cache.k7
    integrator.f(integrator.fsalfirst, integrator.uprev, integrator.p, integrator.t) # Pre-start fsal
    integrator.stats.nf += 1
    nothing
end

#=
Here's a simple solver function.
It references `integ`, a predefined integrator.
WebAssembly stores that as a global variable.
=#

function simplesolve(x)
    initialize!(integ, integ.cache)
    n = 10000
    tres = zeros(n)
    u1 = zeros(n)
    u2 = zeros(n)
    u3 = zeros(n)
    u1[5] = 99.0
    for i in 1:n
        ret = OrdinaryDiffEq.perform_step!(integ, integ.cache)    
        OrdinaryDiffEq.recursivecopy!(integ.uprev, integ.u)
        OrdinaryDiffEq.recursivecopy!(integ.fsalfirst, integ.fsallast)
        integ.t = integ.t + integ.dt
        integ.tprev = integ.t
        tres[i] = integ.t
        u1[i] = integ.u[1]
        u2[i] = integ.u[2]
        u3[i] = integ.u[3]
    end
    display(tres)
    display(u1)
    x
end

# Compile this to WebAssembly:

compile((simplesolve, Float64); filepath = "simplesolve.wasm", validate = true)   # compiles

#=
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css">
```@raw html
<script src="simplesolve.wasm.js"></script> 
<script type="module">
    export async function load_wasm() {
        const response = await fetch('simplesolve.wasm');
        const bytes = await response.arrayBuffer();
        const { instance } = await WebAssembly.instantiate(bytes, jsexports);
        const { simplesolve } = instance.exports;
        return instance.exports;
    }
    var wasm = await load_wasm();
    console.log(wasm.simplesolve(3.0));
</script>
```
=#
