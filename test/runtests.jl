using TestItemRunner
using Test
using WebAssemblyCompiler

include("setup.jl")   

# include("needs-work.jl")   
    compile(nextpow, (Int32,Int32); filepath = "nextpow.wasm")
    run(`$(WebAssemblyCompiler.Bin.wasmdis()) nextpow.wasm -o nextpow.wat`)
    jsfun = jsfunctions(nextpow, (Int32,Int32))
    x = Int32(2)
    y = Int32(7)
    @test jsfun.nextpow(x,y) == nextpow(x,y)
    @show jsfun.nextpow(x,y)
    
    # function f1(x)
    #     a = Array{Float64, 1}(undef, 0)
    #     push!(a, x)
    #     return x
    # end
    # compile(f1, (Float64,); filepath = "grow.wasm")


@run_package_tests
