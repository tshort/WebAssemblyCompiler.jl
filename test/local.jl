using Revise 
using WebAssemblyCompiler

const W = WebAssemblyCompiler
const WebAssemblyCompiler._DEBUG_ = true
# const WebAssemblyCompiler._DEBUG_ = false
   
   
    @noinline fargs5a(a, args...) = args
    function fargs5(x)
        tup = fargs5a(x, 1, 1.1)
        return x * tup[2]
    end
    compile((fargs5, Float64,); filepath = "tmp/fargs5.wasm", validate = true)

 
    # function fdict1(x)
    #     d = Dict{Int, Float64}((1 => 10., 2 => 20., 3 => 30.))
    #     get(d, 2, -1.0) + x
    # end
    # compile((fdict1, Float64,); filepath = "tmp/fdict1.wasm")

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

