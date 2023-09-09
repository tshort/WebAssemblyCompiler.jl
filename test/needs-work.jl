  
    function f1(x)
        d = Dict{Int32, Float64}((1 => 10., 2 => 20., 3 => 30.))
        get(d, 2, -1.0) + x
    end
    compile(f1, (Float64,); filepath = "dict.wasm")
    run(`$(WebAssemblyCompiler.Bin.wasmdis()) dict.wasm -o dict.wat`)
    # jsfun = jsfunctions(f1, (Float64,))
    # x = 1.0
    # @test jsfun.f1(x) == f1(x)
    # @show jsfun.f1(x)

    using Dictionaries
    function f2(x)
        d = Dictionary{Int32, Float64}([1,2,3], [10.,20.,30.])
        get(d, 2, -1.0) + x
    end
    compile(f2, (Float64,); filepath = "dict.wasm")
    run(`$(WebAssemblyCompiler.Bin.wasmdis()) dict.wasm -o dict.wat`)
    # Dictionaries advantages
    # - sizehint in constructor
    # - less complications
    
    # compile(nextpow, (Int32,Int32); filepath = "nextpow.wasm")
    # run(`$(WebAssemblyCompiler.Bin.wasmdis()) nextpow.wasm -o nextpow.wat`)
    # jsfun = jsfunctions(nextpow, (Int32,Int32))
    # x = Int32(2)
    # y = Int32(7)
    # @test jsfun.nextpow(x,y) == nextpow(x,y)
    # @show jsfun.nextpow(x,y)
