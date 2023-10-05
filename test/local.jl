using Revise 
using WebAssemblyCompiler

const W = WebAssemblyCompiler
const WebAssemblyCompiler._DEBUG_ = true
# const WebAssemblyCompiler._DEBUG_ = false
    

    # const a = [1.,2.,3.]
    # @noinline function fnothing2(y; idxs = 3)
    #     idxs2 = idxs
    #     if typeof(idxs2) <: Nothing
    #         return y
    #     else
    #         return 2y
    #     end
    # end
    # function fnothing(x)
    #     z = nothing
    #     return fnothing2(x, idxs = z)
    # end
    # compile((fnothing, Float64,); filepath = "tmp/fnothing.wasm", validate = true)


    
