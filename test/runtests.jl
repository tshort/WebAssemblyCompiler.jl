using TestItemRunner
using Test
using WebAssemblyCompiler

include("setup.jl")   

    function fa13a(x)
        a = Vector{Any}(undef, 3)
        a[1] = 1.5
        a[2] = Int32(2)
        a[3] = "hello"
        jsa = JS.tojs(a)
        JS.console_log(jsa)
        JS.console_log(string("hello", "world"))
        return x
    end
    compile((fa13a, Float64,); filepath = "fa13a.wasm", validate = true)
    run(`$(WebAssemblyCompiler.Bin.wasmdis()) fa13a.wasm -o fa13a.wat`)

    # function fa14(x)
    #     a = Vector{Any}(undef, 3)
    #     a[1] = 1.5
    #     a[2] = Int32(2)
    #     jsa = JS.tojs(a)
    #     JS.console_log(jsa)
    #     return x
    # end
    # compile((fa14, Float64,); filepath = "fa14.wasm", validate = true)
    # run(`$(WebAssemblyCompiler.Bin.wasmdis()) fa14.wasm -o fa14.wat`)

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
