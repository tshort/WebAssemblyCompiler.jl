using TestItemRunner
using Test
using Binaryen
    include("setup.jl")   

    function f13(x)
        y = Core.bitcast(UInt64, x)
        return Core.bitcast(Float64, y)
    end
    compile(((f13, Float64,),); filepath = "j.wasm")
    x = 3.0
    @show f13(x)
    jsfun = jsfunctions(f13, (Float64,))
    @test f13(x) == jsfun.f13(x)

@run_package_tests
