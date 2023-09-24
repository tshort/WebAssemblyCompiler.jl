using TestItemRunner
using Test
using WebAssemblyCompiler

include("setup.jl")   
const W = WebAssemblyCompiler
const WebAssemblyCompiler._DEBUG_ = true
mkpath("tmp")
ENV["wac_outpath"] = "./tmp"
# exit()

@run_package_tests
