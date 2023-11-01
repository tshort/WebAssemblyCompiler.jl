using Revise 
using WebAssemblyCompiler

const W = WebAssemblyCompiler
W.setdebug(:offline)
W.setdebug(:inline)

    struct X
        a::Float64
    end
    @noinline (x::X)(w) = w * x.a 
    function fargs2(x)
        y = X(2.0)(x)
        return x * y
    end
    compile((fargs2, Float64,); filepath = "tmp/fargs2.wasm", validate = true)

    # function fa2(i)
    #     a = Array{Float64,1}(undef, Int32(i))
    #     unsafe_trunc(Int32, length(a))
    # end
    # compile((fa2, Int32,); filepath = "tmp/fa2.wasm")
    # # compile((fa2, Int32,); filepath = "tmp/fa2o.wasm", optimize = true)   # crashes


    # function falias2(x)  # works
    #     a = Float64[1:1.:10;]
    #     tpl = (a = a, aa = a, b = 3)
    #     tpl.a[1] = 10. 
    #     y = tpl.aa[1]
    #     JS.console_log(1.0)
    #     JS.console_log(string(y, " "))
    #     JS.console_log(3.0)
    #     JS.console_log("hello")
    #     return x
    # end
    # compile((falias2, Float64,); filepath = "tmp/falias2.wasm", validate = true)

    # function fdict1(x)
    #     d = Dict{Int, Float64}((1 => 10., 2 => 20., 3 => 30.))
    #     get(d, 2, -1.0) + x
    # end
    # compile((fdict1, Float64,); filepath = "tmp/fdict1.wasm")
 
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

