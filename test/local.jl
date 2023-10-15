using Revise 
using WebAssemblyCompiler

const W = WebAssemblyCompiler
const WebAssemblyCompiler._DEBUG_ = true
# const WebAssemblyCompiler._DEBUG_ = false
   
    struct X
        a::Float64
    end
    function (z::X)(x)
        return x + z.a
    end
    const fclos1 = X(2.0)
    compile((fclos1, Float64,); filepath = "tmp/fclos1.wasm", validate = true)

    # function outer(x)
    #     a = x + 1.0
    #     inner(y) = y + a + x
    #     return inner
    # end
    # fclos2(x) = outer(1.0)(x)
    # compile((fclos2, Float64,); filepath = "tmp/fclos2.wasm", validate = true)

    # # too much constant prop to test
    # struct X
    #     a::Base.RefValue{Float64}
    # end
    # function (z::X)(x)
    #     return x + z.a[]
    # end
    # function fclos3(y)
    #     x = X(Ref(y + 1.0))
    #     return x(y)
    # end
    # compile((fclos3, Float64,); filepath = "tmp/fclos3.wasm", validate = true)


    # using Statistics
    # function est_mean(x)
    #     function fun(m)
    #         return m - mean(x)
    #     end
    #     val = fun(2.0)
    #     @show val, mean(x)
    #     return fun # explicitly return the inner function to inspect it
    # end
    # x = rand(10)
    # fun = est_mean(x)
    # fun(10)
    # # gfun(x) = est_mean(x)
    # # gfun(10)


        
