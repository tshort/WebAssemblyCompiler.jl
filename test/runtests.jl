using TestItemRunner
using Test
using WebAssemblyCompiler

include("setup.jl")   

# include("needs-work.jl")   

    const a = [1.,2.,3.,4.]
    f2(i) = @inbounds a[i]
    compile(f2, (Int32,); filepath = "globalarray2.wasm")
    # compile(f2, (Int32,); filepath = "globalarray2.wasm", validate = true, optimize = true)
    run(`$(WebAssemblyCompiler.Bin.wasmdis()) globalarray2.wasm -o globalarray2.wat`)
    jsfun = jsfunctions(f2, (Int32,))
    @test jsfun.f2(1) == f2(1)
 
@run_package_tests
