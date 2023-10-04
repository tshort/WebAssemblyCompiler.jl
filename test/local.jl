using Revise 
using WebAssemblyCompiler

const W = WebAssemblyCompiler
const WebAssemblyCompiler._DEBUG_ = true
# const WebAssemblyCompiler._DEBUG_ = false
    

    const a = [1.,2.,3.]
    function fpop(x)
        y = pop!(a)
        display(a)
        x + y
    end
    compile((fpop, Float64,); filepath = "tmp/fpop.wasm", validate = true)
