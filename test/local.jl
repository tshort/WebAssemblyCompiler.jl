using Revise 
using WebAssemblyCompiler

const W = WebAssemblyCompiler
const WebAssemblyCompiler._DEBUG_ = true
# const WebAssemblyCompiler._DEBUG_ = false
    
    function fdict1(x)
        d = Dict{Int, Float64}((1 => 10., 2 => 20., 3 => 30.))
        get(d, 2, -1.0) + x
    end
    compile((fdict1, Float64,); filepath = "tmp/fdict1.wasm")

