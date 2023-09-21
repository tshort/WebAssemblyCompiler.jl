using Revise 
using WebAssemblyCompiler

const W = WebAssemblyCompiler
const WebAssemblyCompiler._DEBUG_ = true
    
  
  
    using Cobweb: h, Node
    using Cobweb

    function JS.sethtml(id, n::Cobweb.Node)
        io = JS.IOBuff()
        print(io, n)
        str = take!(io)
        JS.sethtml(id, str)
        nothing
    end

    function tostring(n::Cobweb.Node)
        io = JS.IOBuff()
        print(io, n)
        take!(io)
    end
    @inline Base.print(io::JS.IOBuff, a::Node) = show(io, a)

    function fcw2(x)
        snip = h("div",
                 h.h1("Hello there"),
                 h.p("This is some ", h.strong("strong text")),
                 h.p("more text", class = "myclass"))
        JS.sethtml("myid", tostring(snip))
        return x
    end
    # ## This version crashes Julia:
    # function fcw2(_x)
    #     n = h("div", "jkl", h("strong", "!!!!!", "xxxx"), class = "myclass")
    #     n = h("div", "hi", "abc", _x, n, class = "myclass2")
    #     JS.sethtml("myid", n)
    #     return _x
    # end
    compile((fcw2, Float64,); filepath = "fcw2.wasm", validate = true)
