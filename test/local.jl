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

    # Circular reference
    mutable struct X
        a::Float64
        b
    end
    const x = X(2.0, Any[])
    push!(x.b, x)
    function fcircular1(y)
        return x.a + y
    end
    compile((fcircular1, Float64,); filepath = "tmp/fcircular1.wasm", validate = true)

    
