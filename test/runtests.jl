using TestItemRunner
using Test
using WebAssemblyCompiler

include("setup.jl")   
const W = WebAssemblyCompiler
# const WebAssemblyCompiler._DEBUG_ = true


# exit()

@run_package_tests
