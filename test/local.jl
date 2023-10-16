using Revise 
using WebAssemblyCompiler

const W = WebAssemblyCompiler
const WebAssemblyCompiler._DEBUG_ = true
# const WebAssemblyCompiler._DEBUG_ = false
   
    # struct X
    #     a::Float64
    # end
    # function (z::X)(x)
    #     return x + z.a
    # end
    # const fclos1 = X(2.0)
    # compile((fclos1, Float64,); filepath = "tmp/fclos1.wasm", validate = true)

    # # Here, just the type is circular
    # struct Y
    #     a::Float64
    #     b::Vector{Y}
    # end
    # const y = Y(1.0, Vector{Y}[])
    # const z = Y(1.0, Vector{Y}[])
    # push!(y.b, z)
    # function frecurs1(x)
    #     return x + y.b[1].a
    # end
    # compile((frecurs1, Float64,); filepath = "tmp/frecurs1.wasm", validate = true)

    # # Here, the value is circular
    # push!(y.b, y)
    # function frecurs2(x)
    #     return x + y.b[1].a
    # end
    # # compile((frecurs2, Float64,); filepath = "tmp/frecurs2.wasm", validate = true)

    function fb2(x,y)
        a = x + y
        a > 2 ? a + 1 : 2a
    end
    compile((fb2, Float64, Float64); filepath = "tmp/fb2.wasm", validate = true)
