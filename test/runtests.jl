using TestItemRunner
using Test
using WebAssemblyCompiler

include("setup.jl")   
const W = WebAssemblyCompiler
# const WebAssemblyCompiler._DEBUG_ = true
    


# exit()
   
    # using Cobweb: h, Node
    # using Cobweb

    # function JS.sethtml(id, n::Cobweb.Node)
    #     io = JS.IOBuff()
    #     print(io, n)
    #     str = take!(io)
    #     JS.sethtml(id, str)
    #     nothing
    # end

    # function tostring(n::Cobweb.Node)
    #     io = JS.IOBuff()
    #     print(io, n)
    #     take!(io)
    # end
    # @inline Base.print(io::JS.IOBuff, a::Node) = show(io, a)

    # function doit(_n)
    #     JS.sethtml("myid", tostring(_n))
    #     return
    # end
    # # function f(x)
    # #     n = h("div", "hi", xyz="abc")
    # #     println("myid", tostring(n))
    # #     return x
    # # end
    # function fcw1(_x)
    #     # n = h("div", "jkl", h("strong", "!!!!!", "xxxx"))
    #     # n = Node("div", (;), ("jkl", Node("strong", (;), ("!!!!!", "xxxx"))))
    #     # n1 = Node("strong", (;), ("hello", "world"))
    #     # n = Node("div", (;), (n1, "oooo", "ahh", n1))
    #     n = h("div", "jkl", h("strong", "!!!!!", "xxxx"))
    #     n = h("div", "hi", "abc", _x, n)
    #     doit(n)
    #     return _x
    # end
    # compile((fcw1, Float64,); filepath = "fcw1.wasm", validate = true)
    # run(`$(WebAssemblyCompiler.Bin.wasmdis()) fcw1.wasm -o fcw1.wat`)
    # # run(`$(WebAssemblyCompiler.Bin.wasmopt()) --enable-gc --enable-reference-types --enable-strings -O3 fcw1.wasm -o fcw1o.wasm`)
    # # run(`$(WebAssemblyCompiler.Bin.wasmdis()) fcw1o.wasm -o fcw1o.wat`)



@run_package_tests
