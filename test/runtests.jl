using TestItemRunner
using Test
using WebAssemblyCompiler

include("setup.jl")   

# include("needs-work.jl")   

    function f1(x)
        a = Array{Float64, 1}(undef, 0)
        push!(a, x)
        return x
    end

@run_package_tests
