using TestItemRunner
using Test
using WebAssemblyCompiler

include("setup.jl")   
const W = WebAssemblyCompiler
const WebAssemblyCompiler._DEBUG_ = true

    using Dictionaries
    function fdict1(x)
        d = Dictionary{Int32, Float64}(Int32[Int32(1),Int32(2),Int32(3)], [10.,20.,30.])
        get(d, 2, -1.0) + x
    end
    compile((fdict1, Float64,); filepath = "fdict1.wasm", validate = true)
    run(`$(WebAssemblyCompiler.Bin.wasmdis()) fdict1.wasm -o fdict1.wat`)
    
    # using Cobweb: h
    # using Cobweb

    # function JS.sethtml(id, n::Cobweb.Node)
    #     io = JS.IOBuff()
    #     print(io, n)
    #     JS.sethtml(id, take!(io))
    # end

    # function fcw1(x)
    #     n = h("div", "hi")
    #     JS.sethtml("myid", n)
    #     return x
    # end
    # compile((fcw1, Float64,); filepath = "fcw1.wasm", validate = true, optimize = true)
    # run(`$(WebAssemblyCompiler.Bin.wasmdis()) fcw1.wasm -o fcw1.wat`)
    # # run(`$(WebAssemblyCompiler.Bin.wasmopt()) --enable-gc --enable-reference-types --enable-strings -O3 fcw1.wasm -o fcw1o.wasm`)
    # # run(`$(WebAssemblyCompiler.Bin.wasmdis()) fcw1o.wasm -o fcw1o.wat`)


exit()

@run_package_tests
