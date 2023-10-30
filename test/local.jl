using Revise 
using WebAssemblyCompiler

const W = WebAssemblyCompiler
W.setdebug(:offline)
W.setdebug(:inline)


    @noinline fargs6a(a, args...) = args
    function fargs6(x)
        tup = fargs6a(x, 1.0)
        return x * tup[1]
    end
    compile((fargs6, Float64,); filepath = "tmp/fargs6.wasm", validate = true)
 
    # function fstringx(x)
    #     s = "hello"
    #     JS.console_log(s)
    #     fs() = JS.JSString(@jscall("() => \"hello\"", Externref, Tuple{}))
    #     js = fs()
    #     JS.console_log(js)
    #     v = Vector{UInt8}(@jscall("(x) => (new TextEncoder()).encode(x)", Externref, Tuple{Externref}, js))
    #     JS.console_log(v)
    #     if String(js) == s
    #         JS.console_log("Same")
    #     end
    #     return x
    # end
    # compile((fstringx, Float64,); filepath = "tmp/fstringx.wasm", validate = true)



 
 
    # function fdict2(x)
    #     d = Dict{String, String}(("1" => "10.", "2" => "20.", "3" => "30."))
    #     get(d, 2, -1.0) + x
    # end
    # compile((fdict2, Float64,); filepath = "tmp/fdict2.wasm")

    # function fhash2(x)
    #     z = Base.hashindex("jhkjh", 3)
    #     z[1] + x
    # end
    # compile((fhash2, Float64,); filepath = "tmp/fhash2.wasm")

    # function fdict2(x)
    #     d = Dict{String, String}(("1" => "10.", "2" => "20.", "3" => "30."))
    #     get(d, 2, -1.0) + x
    # end
    # compile((fdict2, Float64,); filepath = "tmp/fdict2.wasm")

