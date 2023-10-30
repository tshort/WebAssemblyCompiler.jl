using TestItemRunner
using Test
using WebAssemblyCompiler

include("setup.jl")   
const W = WebAssemblyCompiler

mkpath("tmp")
ENV["wac_outpath"] = "./tmp"
# exit()

@run_package_tests
