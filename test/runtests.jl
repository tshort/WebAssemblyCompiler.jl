using TestItemRunner
using Test
using WebAssemblyCompiler

include("setup.jl")   

# include("needs-work.jl")   

    function f8(i)
        a = Array{Float64,1}(undef, Int32(3))
        @inbounds a[i] = 3.0
        @inbounds a[i]
    end
    compile(f8, (Int32,); filepath = "j.wasm")


@run_package_tests
