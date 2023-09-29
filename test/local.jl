using Revise 
using WebAssemblyCompiler

const W = WebAssemblyCompiler
const WebAssemblyCompiler._DEBUG_ = true
# const WebAssemblyCompiler._DEBUG_ = false
    

    function fxxx(x)
        y = (ss = true, a = Int32(1), b = 2.0, x = [1.,2.], c = (3.0, 4.0, "hello"))
        y = (1.0, 2.0, (ss = true, a = Int32(1)), (3., 4.))
        display(y)
        return x
    end
    compile((fxxx, Float64,); filepath = "tmp/fxxx.wasm", validate = true)
