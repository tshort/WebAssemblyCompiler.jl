using TestItemRunner
using Test
using WebAssemblyCompiler

include("setup.jl")   
const W = WebAssemblyCompiler
# const WebAssemblyCompiler._DEBUG_ = true


#     function f13(x)
#         a = [1.,2.,x]
#         a[2] + x
#     end
#     compile((f13, Float64,); filepath = "f13.wasm", validate = true)
#     run(`$(WebAssemblyCompiler.Bin.wasmdis()) f13.wasm -o f13.wat`)


# exit()

#     using Dictionaries
    
#     # compile((Dictionary{Int32,Float64}, Vector{Int32}, Vector{Float64}); filepath = "fdict0.wasm")

#     function fdict1(x)
#         d = Dictionary{Int32, Float64}(Int32[Int32(1),Int32(2),Int32(3)], [10.,20.,30.])
#         get(d, 2, -1.0) + x
#     end
#     compile((fdict1, Float64,); filepath = "fdict1.wasm", validate = true)
#     run(`$(WebAssemblyCompiler.Bin.wasmdis()) fdict1.wasm -o fdict1.wat`)
# exit()
 
#     const i = Indices(Int32[3,4,5])
#     compile((Base.copy, Indices{Int32}); filepath = "fdict0.wasm")
# exit()

@run_package_tests
