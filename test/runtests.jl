using TestItemRunner
using SafeTestsets
using Test
using Binaryen

include("setup.jl")   
    function f(x)
        a = "hello"
        @ccall console.log(a::String)::Cvoid
    end
    # compile(f, (Int32,); filepath = "string.wasm")
    # run(`$(Binaryen.Bin.wasmdis()) string.wasm -o string.wat`)
    # jsfun = jsfunctions(f, (Float64,))
    # jsfun.f(1.0)
 
   
    
# include("compiler.jl") 

@run_package_tests
