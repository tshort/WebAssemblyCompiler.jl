  
    function f1(x)
        d = Dict{Int32, Float64}((1 => 10., 2 => 20., 3 => 30.))
        get(d, 2, -1.0) + x
    end
    compile(f1, (Float64,); filepath = "dict.wasm")
    # jsfun = jsfunctions(f1, (Float64,))
    # x = 1.0
    # @test jsfun.f1(x) == f1(x)
    # @show jsfun.f1(x)

   
    # compile(nextpow, (Int32,Int32); filepath = "nextpow.wasm")
    # run(`$(WebAssemblyCompiler.Bin.wasmdis()) nextpow.wasm -o nextpow.wat`)
    # jsfun = jsfunctions(nextpow, (Int32,Int32))
    # x = Int32(2)
    # y = Int32(7)
    # @test jsfun.nextpow(x,y) == nextpow(x,y)
    # @show jsfun.nextpow(x,y)

    # Circular references
    # Here, just the type is circular
    struct Y
        a::Float64
        b::Vector{Y}
    end
    const y = Y(1.0, Vector{Y}[])
    const z = Y(1.0, Vector{Y}[])
    push!(y.b, z)
    function frecurs1(x)
        return x + y.b[1].a
    end
    compile((frecurs1, Float64,); filepath = "tmp/frecurs1.wasm", validate = true)

    # Here, the value is circular
    push!(y.b, y)
    function frecurs2(x)
        return x + y.b[1].a
    end
    # compile((frecurs2, Float64,); filepath = "tmp/frecurs2.wasm", validate = true)

