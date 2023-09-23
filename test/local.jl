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
    @inline Base.print(io::JS.IOBuff, a::Cobweb.Node) = show(io, a)

    function fcw1(x)
        n = h("div", "jkl", h("strong", "!!!!!", "xxxx"), class = "myclass")
        n = h("div", "hi", "abc", x, n, class = "myclass2")
        JS.sethtml("myid", tostring(n))
        return x
    end
    # ## This version crashes Julia:
    # function fcw1(_x)
    #     n = h("div", "jkl", h("strong", "!!!!!", "xxxx"), class = "myclass")
    #     n = h("div", "hi", "abc", _x, n, class = "myclass2")
    #     JS.sethtml("myid", n)
    #     return _x
    # end
    # compile((fcw1, Float64,); filepath = "tmp/fcw1.wasm", validate = true)
    function fcw2(x)
        snip = h("div",
                 h.h1("Hello there"),
                 h.p("This is some ", h.strong("strong text")),
                 h.p("more text", class = "myclass another"))
        JS.sethtml("myid", tostring(snip))
        return x
    end
    # compile((fcw2, Float64,); filepath = "tmp/fcw2.wasm", validate = true)
    
    const obj = JS.object
    const Ext = W.Externref
    # const obj = string
    # const Ext = String
    @inline _m(n::Cobweb.Node) = mithril(n)
    @inline _m(x) = obj(x)
    @inline _m(x, xs...) = (x, _m(xs...)...)

    mithril(tag::String, attrs::Ext, content::Ext) =    
        Base.llvmcall("(tag, attrs, content) => m(tag, attrs, content)", 
            Ext, 
            Tuple{String, Ext, Ext}, 
            tag, attrs, content)
    mithril(tag::String, attrs::Ext, content::String) =    
        Base.llvmcall("(tag, attrs, content) => m(tag, attrs, content)", 
            Ext, 
            Tuple{String, Ext, String}, 
            tag, attrs, content)
    
    mithril(n::Cobweb.Node) =
        mithril(Cobweb.tag(n), obj(Cobweb.attrs(n)), obj(_m(Cobweb.children(n)...)))
  

    function fcw3(x)
        snip = h("div",
                #  h("h1", "Hello there"),
                 h("p", h("strong", "strong text")))
                #  h("p", "more text", class = "myclass another"))
        # snip = h("div", "hello", class = "myclass")
        # JS.console_log(Cobweb.children(snip))
        JS.console_log(mithril(snip))
        return x
    end
    compile((fcw3, Float64,); filepath = "tmp/fcw3.wasm", validate = true)
