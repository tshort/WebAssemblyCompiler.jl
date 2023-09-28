using Revise 
using WebAssemblyCompiler

const W = WebAssemblyCompiler
const WebAssemblyCompiler._DEBUG_ = true
# const WebAssemblyCompiler._DEBUG_ = false
    
    const h = JS.h

    function fcw1(x)
        n = h("div", "hello") 
        # n = h("div", "jkl", n)
        # n = h("div", "jkl", h("strong", "!!!!!", "xxxx"), class = "myclass")
        # n = h("div", "hi", "abc", x, n, class = "myclass2")
        JS.sethtml("myid", n)
        return x
    end
    compile((fcw1, Float64,); filepath = "tmp/fcw1.wasm", validate = true)
