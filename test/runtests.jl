using TestItemRunner
using SafeTestsets
using Test
using Binaryen

include("setup.jl")   

# include("needs-work.jl")   


@run_package_tests
