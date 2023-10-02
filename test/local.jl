using Revise 
using WebAssemblyCompiler

const W = WebAssemblyCompiler
const WebAssemblyCompiler._DEBUG_ = true
# const WebAssemblyCompiler._DEBUG_ = false
    

    using Dictionaries
    function fdict1(x)
        d = Dictionary{Int32, Float64}(Int32[Int32(1),Int32(2),Int32(3)], [10.,20.,30.])
        get(d, 2, -1.0) + x
    end
    compile((fdict1, Float64,); filepath = "tmp/fdict1.wasm", validate = true)
