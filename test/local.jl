using Revise 
using WebAssemblyCompiler

const W = WebAssemblyCompiler
const WebAssemblyCompiler._DEBUG_ = true
const WebAssemblyCompiler._DEBUG_ = false
    
    const h = JS.h

    function fcw1(x)
        n = h("div", "jkl", h("strong", "!!!!!", "xxxx"), class = "myclass")
        n = h("div", "hi", "abc", x, n, class = "myclass2")
        JS.sethtml("myid", string(n))
        JS.console_log(string("hello", "world", 1, "asdf"))
        JS.console_log(Any["hello", "world", 1.1, "asdf"])
        return x
    end
    # ## This version crashes Julia:
    # function fcw1(_x)
    #     n = h("div", "jkl", h("strong", "!!!!!", "xxxx"), class = "myclass")
        # n = h("div", "hi", "abc", _x, n, class = "myclass2")
    #     JS.sethtml("myid", n)
    #     return _x
    # end
    compile((fcw1, Float64,); filepath = "tmp/fcw1.wasm", validate = true)
