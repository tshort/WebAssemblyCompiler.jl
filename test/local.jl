using Revise 
using WebAssemblyCompiler

const W = WebAssemblyCompiler
const WebAssemblyCompiler._DEBUG_ = true
# const WebAssemblyCompiler._DEBUG_ = false
   
# # using Hyperscript
# using Cobweb
# using Cobweb: h

const h = JS.h


    # function fcw1(x)
    #     n = h("div", "jkl", class = "myclass")
    #     # n = h("div", "jkl")
    #     io = JS.IOBuff() 
    #     show(io, n)
    #     # str = take!(io)
    #     display(io.x)
    #     return x
    # end

    function fcw2(x)
        # snip = h("div",
        #          h.h1("Hello there"),
        #          h.p("This is some ", h.strong("strong text")),
        #          h.p("more text", class = "myclass"))
        snip = h.h1("Hello there", h("div"))
        JS.console_log(snip)
        return x
    end
    compile((fcw2, Float64,); filepath = "tmp/fcw2.wasm", validate = true)
    # function fcw1(x)
    #     n = h("div", "jkl", h("strong", "!!!!!", "xxxx"), class = "myclass")
    #     n = h("div", "hi", "abc", x, n, class = "myclass2")
    #     display(string(n))
    #     return x
    # end
    # compile((fcw1, Float64,); filepath = "tmp/fcw1.wasm", validate = true)
