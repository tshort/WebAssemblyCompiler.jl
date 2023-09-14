using TestItemRunner
using Test
using WebAssemblyCompiler

include("setup.jl")   

# const WebAssemblyCompiler._DEBUG_ = true

# exit()

    # using Dictionaries
    # function fdict1(x)
    #     d = Dictionary{Int32, Float64}([1,2,3], [10.,20.,30.])
    #     get(d, 2, -1.0) + x
    # end
    # compile((fdict1, Float64,); filepath = "fdict1.wasm")
    # run(`$(WebAssemblyCompiler.Bin.wasmdis()) fdict1.wasm -o fdict1.wat`)
 
exit()

@run_package_tests
