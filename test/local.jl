using Revise 
using WebAssemblyCompiler

const W = WebAssemblyCompiler
const WebAssemblyCompiler._DEBUG_ = true
# const WebAssemblyCompiler._DEBUG_ = false
    
    const h = JS.h

    function fcw2(x)
        snip = h("div",
                 h.h1("Hello there"),
                 h.p("This is some ", h.strong("strong text")),
                 h.p("more text", class = "myclass"))
        JS.sethtml("myid", string(snip))
        return x
    end
    compile((fcw2, Float64,); filepath = "tmp/fcw2.wasm", validate = true)
