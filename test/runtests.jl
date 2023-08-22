using TestItemRunner
using Test
using Binaryen
    include("setup.jl")   

    compile(((exp, Float64,),); filepath = "j.wasm")
    run(`$(Binaryen.Bin.wasmdis()) j.wasm -o j.wat`)
    jsfun = jsfunctions(exp, (Float64,))
    x = 3.0
    @show exp(x)
    @show jsfun.exp(x)
    @test exp(x) == jsfun.exp(x)


#     compile(((sin, Float64,),); filepath = "j.wasm")

#     function f13(x)
#         y = Core.bitcast(UInt64, x)
#         return Core.bitcast(Float64, y)
#     end
#     compile(((f13, Float64,),); filepath = "j.wasm")
#     x = 3.0
#     @show f13(x)
#     jsfun = jsfunctions(f13, (Float64,))
#     @test f13(x) == jsfun.f13(x)

# @run_package_tests
