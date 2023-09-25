using Revise 
using WebAssemblyCompiler

const W = WebAssemblyCompiler
const WebAssemblyCompiler._DEBUG_ = true
# const WebAssemblyCompiler._DEBUG_ = false
    
    const h = JS.h

    using Dictionaries
    function fdict1(x)
        d = Dictionary{Int32, Float64}(Int32[Int32(1),Int32(2),Int32(3)], [10.,20.,30.])
        get(d, 2, -1.0) + x
    end
    compile((fdict1, Float64,); filepath = "tmp/fdict1.wasm", validate = true)
    # ## This version crashes Julia:
    # function fjsx(_x)
    #     n = h("div", "jkl", h("strong", "!!!!!", "xxxx"), class = "myclass")
        # n = h("div", "hi", "abc", _x, n, class = "myclass2")
    #     JS.sethtml("myid", n)
    #     return _x
    # end
    compile((fdict1, Float64,); filepath = "tmp/fdict1.wasm", validate = true)
