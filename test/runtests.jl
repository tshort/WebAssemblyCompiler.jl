using TestItemRunner
using Test
using WebAssemblyCompiler

include("setup.jl")   

# const WebAssemblyCompiler._DEBUG_ = true

    function fjs12(x)
        JS.console_log("hello world")
        return x
    end
    compile((fjs12, Float64,); filepath = "fjs12.wasm", validate = true)
    run(`$(WebAssemblyCompiler.Bin.wasmdis()) fjs12.wasm -o fjs12.wat`)

exit()

    # using Dictionaries
    # function fdict1(x)
    #     d = Dictionary{Int32, Float64}([1,2,3], [10.,20.,30.])
    #     get(d, 2, -1.0) + x
    # end
    # compile((fdict1, Float64,); filepath = "fdict1.wasm")
    # run(`$(WebAssemblyCompiler.Bin.wasmdis()) fdict1.wasm -o fdict1.wat`)
 
# exit()

@run_package_tests
