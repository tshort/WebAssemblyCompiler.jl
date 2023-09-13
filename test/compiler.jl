@testitem "Misc" begin
    include("setup.jl")   

    function f13(x)
        y = Core.bitcast(UInt64, x)
        return Core.bitcast(Float64, y)
    end
    compile((f13, Float64); filepath = "j.wasm")
    x = 3.0
    # @show f13(x)
    jsfun = jsfunctions((f13, Float64,))
    @test f13(x) == jsfun.f13(x)

end

@testitem "Basics" begin
    include("setup.jl")   
    
    function f1(x,y)
        a = x + y
        a + 1
    end
    # compile((f1, Float64,Float64); filepath = "j.wasm")
    jsfun = jsfunctions((f1, Float64,Float64))
    @test f1(3.0, 4.0) == jsfun.f1(3.0, 4.0)
    jsfun = jsfunctions((f1, Int32,Int32))
    @test f1(3, 4) == jsfun.f1(3, 4)
    jsfun = jsfunctions((f1, Float64,Int32))
    @test f1(3, 4) == jsfun.f1(3, 4)

    function f2(x,y)
        a = x + y
        a > 2 ? a + 1 : 2a
    end
    jsfun = jsfunctions((f2, Float64,Float64))
    @test f2(3.0, 4.0) == jsfun.f2(3.0, 4.0)
    @test f2(-3.0, 4.0) == jsfun.f2(-3.0, 4.0)
    jsfun = jsfunctions((f2, Int32,Int32))
    @test f2(3, 4) == jsfun.f2(3, 4)
    @test f2(-3, 4) == jsfun.f2(-3, 4)

    jsfun = jsfunctions((f1, Float64, Float64),
                        (f2, Float64, Float64))
    @test f1(3.0, 4.0) == jsfun.f1(3.0, 4.0)
    @test f2(3.0, 4.0) == jsfun.f2(3.0, 4.0)
    

    function f3(x,y)
        if x > 1.0
            a = x + y
        else
            a = x + y + 3
        end
        a
    end
    jsfun = jsfunctions((f3, Float64,Float64))
    @test f3(0.0, 4.0) == jsfun.f3(0.0, 4.0)
    @test f3(2.0, 4.0) == jsfun.f3(2.0, 4.0)

    function f4(x,y)
        if x > 1.0
            a = x + 1.0
            b = 3.0
        else
            a = y + 2.0
            b = 4.0
        end
        a + b
    end
    jsfun = jsfunctions((f4, Float64,Float64))
    @test f4(0.0, 4.0) == jsfun.f4(0.0, 4.0)
    @test f4(2.0, 4.0) == jsfun.f4(2.0, 4.0)

    function f5(x,y)
        a = 0.0
        while a < 4.0
            a = a + x
        end
        a + y
    end
    jsfun = jsfunctions((f5, Float64,Float64))
    @test f5(1.0, 4.0) == jsfun.f5(1.0, 4.0)
    @test f5(5.0, 4.0) == jsfun.f5(5.0, 4.0)

    @noinline twox(x) = 2x
    function f7(x,y)
        x + twox(y)
    end
    compile((f7, Float64,Float64); filepath = "j.wasm")
    # run(`$(WebAssemblyCompiler.Bin.wasmdis()) j.wasm -o j.wat`)
    jsfun = jsfunctions((f7, Float64,Float64))
    @test f7(3.0, 4.0) == jsfun.f7(3.0, 4.0)

    function f8(x)
        2x + twox(x)
    end
    jsfun = jsfunctions((f7, Float64,Float64),
                        (f8, Float64))
    @test f7(3.0, 4.0) == jsfun.f7(3.0, 4.0)
    @test f8(3.0) == jsfun.f8(3.0)


end

@testitem "Arrays" begin
    include("setup.jl")   

    function f8(i)
        a = Array{Float64,1}(undef, Int32(3))
        @inbounds a[i] = 3.0
        @inbounds a[i]
    end
    compile((f8, Int32,); filepath = "j.wasm")
    run(`$(WebAssemblyCompiler.Bin.wasmdis()) j.wasm -o j.wat`)
    jsfun = jsfunctions((f8, Int32,))
    @test f8(Int32(3)) == jsfun.f8(Int32(3))

    function f9(i)
        a = Array{Float64,1}(undef, Int32(i))
        unsafe_trunc(Int32, length(a))
    end
    compile((f9, Int32,); filepath = "j.wasm")
    run(`$(WebAssemblyCompiler.Bin.wasmdis()) j.wasm -o j.wat`)
    ## BROKEN
    # jsfun = jsfunctions((f9, Int32,))
    # @test f9(Int32(3)) == jsfun.f9(Int32(3))

    @noinline function f10a(x)
        @inbounds x[2]
    end
    function f10(x)
        # a = [1.,2.,3.]
        a = Array{Float64, 1}(undef, 3)
        f10a(a) + x
    end
    compile((f10, Float64,); filepath = "j.wasm")
    run(`$(WebAssemblyCompiler.Bin.wasmdis()) j.wasm -o j.wat`)
    jsfun = jsfunctions((f10, Float64,))
    x = 3.0
    @test f10(x) == jsfun.f10(x)

    function f11(x)
        a = ones(5)
        b = copy(a)
        b[2] * x
    end
    compile((f11, Float64,); filepath = "arraycopy.wasm", validate = true)
    run(`$(WebAssemblyCompiler.Bin.wasmdis()) arraycopy.wasm -o arraycopy.wat`)
    # In NodeCall: Compiling function #0 failed: invalid array index.
    # Works in the browser.
    # jsfun = jsfunctions((f11, Float64,))
    # x = 2.0
    # @test jsfun.f11(x) == f11(x)

    function f12(x)
        a = Array{Float64, 1}(undef, 0)
        push!(a, x)
        push!(a, x)
        push!(a, x)
        push!(a, x)
        push!(a, x)
        push!(a, 2x)
        return @inbounds x * a[6]
    end
    x = 2.0
    compile((f12, Float64,); filepath = "f12.wasm", validate = true)
    run(`$(WebAssemblyCompiler.Bin.wasmdis()) f12.wasm -o f12.wat`)

end


@testitem "Structs" begin
    include("setup.jl")   

    mutable struct X{A,B,C}
        a::A
        b::B
        c::C
    end

    @noinline function f11a(y)
        X(y, 2y, 3y)
    end
    function f11(x)
        x = f11a(x)
        x.c + 1
    end
    # x = X(1., 2., 3.)
    compile((f11, Float64,); filepath = "j.wasm")
    run(`$(WebAssemblyCompiler.Bin.wasmdis()) j.wasm -o j.wat`)
    jsfun = jsfunctions((f11, Float64,))
    x = 3.0
    @test f11(x) == jsfun.f11(x)

    @noinline function f12a(y)
        x = X(y, 2y, 3y)
        x.b = x.c
        x
    end
    function f12(x)
        y = f12a(x)
        y.c + 1
    end
    compile((f12, Float64); filepath = "j.wasm")
    # run(`$(WebAssemblyCompiler.Bin.wasmdis()) j.wasm -o j.wat`)
    jsfun = jsfunctions((f12, Float64,))
    x = 3.0
    @test f12(x) == jsfun.f12(x)

end

@testitem "Strings" begin
    include("setup.jl")   

    function f(x)
        a = "hello"
        @ccall console.log(a::String)::Cvoid
        return x
    end
    compile((f, Float64,); filepath = "string.wasm")
    run(`$(WebAssemblyCompiler.Bin.wasmdis()) string.wasm -o string.wat`)
    ## NodeCall doesn't work because its version of Node doesn't support stringrefs.
    # jsfun = jsfunctions((f, Float64,))
    # jsfun.f(1.0)

end

@testitem "ccall" begin
    include("setup.jl")   

    f(x) = @ccall twox(x::Float64)::Float64
    jsfun = jsfunctions((f, Float64,))
    x = 0.5
    @test jsfun.f(x) == 2x
    
    mysin(x) = @ccall Math.sin(x::Float64)::Float64
    jsfun = jsfunctions((mysin, Float64,))
    x = 0.5
    @test jsfun.mysin(x) == sin(x)

end


@testitem "JavaScript interop" begin
    include("setup.jl")   
   
end

@testitem "Math" begin
    include("setup.jl")   

    f(x) = cos(x)
    jsfun = jsfunctions((f, Float64,))
    x = 0.5
    @test f(x) == jsfun.f(x)

    jsfun = jsfunctions((sqrt, Float64,))
    for x in (0.5, 1.01, 3.0, 300.0)
        @test sqrt(x) == jsfun.sqrt(x)
    end

    jsfun = jsfunctions((log, Float64,))
    for x in (0.5, 1.01, 3.0, 300.0)
        @test log(x) == jsfun.log(x)
    end

    jsfun = jsfunctions((log10, Float64,))
    for x in (0.5, 1.01, 3.0, 300.0)
        @test log10(x) == jsfun.log10(x)
    end

    jsfun = jsfunctions((muladd, Float64, Float64, Float64,))
    x, y, z = 3.0, 2.0, 1.0
    @test muladd(x, y, z) == jsfun.muladd(x, y, z)

    jsfun = jsfunctions((exp, Float64,))
    x = 3.0
    @test exp(x) == jsfun.exp(x)

    jsfun = jsfunctions((acos, Float64,))
    x = 0.3
    @test acos(x) == jsfun.acos(x)

end

@testitem "Tuples / globals" begin
    include("setup.jl")   

    const tpl = (1.,2.,3.)
    function f1(x)
        @inbounds tpl[x]
    end
    compile((f1, Int32,); filepath = "j.wasm")
    run(`$(WebAssemblyCompiler.Bin.wasmdis()) j.wasm -o j.wat`)
    jsfun = jsfunctions((f1, Int32,))
    x = Int32(1)
    @test f1(x) == jsfun.f1(x)

end

@testitem "Globals" begin
    include("setup.jl")   

    const a = [1.,2.,3.,4.]
    f1(i) = @inbounds length(a)
    compile((f1, Int32,); filepath = "globalarray.wasm", validate = true)
    run(`$(WebAssemblyCompiler.Bin.wasmdis()) globalarray.wasm -o globalarray.wat`)
    # works in browser!
    # jsfun = jsfunctions((f1, Int32,))
    # @test jsfun.f1(1) == f1(1)

    f2(i) = @inbounds a[i]
    compile((f2, Int32,); filepath = "globalarray2.wasm", validate = true, optimize = true)
    run(`$(WebAssemblyCompiler.Bin.wasmdis()) globalarray2.wasm -o globalarray2.wat`)
    jsfun = jsfunctions((f2, Int32,))
    @test jsfun.f2(1) == f2(1)
    
    struct Y
        a::Float64
        b::Float64
    end
    mutable struct Z
        a::Y
        b::Float64
    end
    const x = Z(Y(1.,2.), 3.)
    g1(i) = x.a.a
    compile((g1, Int32,); filepath = "globalcombo.wasm")
    run(`$(WebAssemblyCompiler.Bin.wasmdis()) globalcombo.wasm -o globalcombo.wat`)
    jsfun = jsfunctions((g1, Int32,))
    @test jsfun.g1(1) == g1(1)

     
    mutable struct X
        a::Array{Float64,1}
        b::Array{Float64,1}
        c::Float64
    end
    const xx = X([1.,2.], [5., 6.], 3.)
    g1(i) = xx.b[i]
    compile((g1, Int32,); filepath = "globalcombo2.wasm")
    run(`$(WebAssemblyCompiler.Bin.wasmdis()) globalcombo2.wasm -o globalcombo2.wat`)
    jsfun = jsfunctions((g1, Int32,))
    @test jsfun.g1(1) == g1(1)
    # @show jsfun.g1(2)

    g2(i) = xx.b[i] + length(xx.a)
    compile((g2, Int32,); filepath = "globalcombo3.wasm")
    run(`$(WebAssemblyCompiler.Bin.wasmdis()) globalcombo3.wasm -o globalcombo3.wat`)
    # jsfun = jsfunctions((g2, Int32,))
    # @test jsfun.g2(1) == g2(1)
    # @show jsfun.g2(2)


    const d = Dict{Int32,Int32}(1 => 10, 2 => 20, 3 => 30, 4 => 40)
    f(i) = get(d, i, Int32(-1))
    compile((f, Int32,); filepath = "dict.wasm")
    run(`$(WebAssemblyCompiler.Bin.wasmdis()) dict.wasm -o dict.wat`)
    # works in browser!
    # jsfun = jsfunctions((f, Int32,))
    # @show jsfun.f(1)

end
 

@testitem "Test" begin
    ccall((:set_verbose, :libccalltest), Cvoid, (Int32,), false)
    x = false
    @ccall :libccalltest.set_verbose(x::Int32)::Cvoid
end

@testitem "JavaScript interop" begin

    function fjs10(x)
        a = Vector{Any}(undef, 3)
        a[1] = 1.5
        a[2] = Int32(2)
        jsa = JS.tojs(a)
        JS.console_log(jsa)
        return x
    end
    compile((fjs10, Float64,); filepath = "fjs10.wasm", validate = true)
    run(`$(WebAssemblyCompiler.Bin.wasmdis()) fjs10.wasm -o fjs10.wat`)

    function fjs11(x)
        a = Any[1.5, Int32(2), "hello"]
        jsa = JS.tojs(a)
        JS.console_log(jsa)
        return x
    end
    compile((fjs11, Float64,); filepath = "fjs11.wasm", validate = true)
    run(`$(WebAssemblyCompiler.Bin.wasmdis()) fjs11.wasm -o fjs11.wat`)
    compile((fjs11, Float64,); filepath = "fjs11o.wasm", optimize = true)
    run(`$(WebAssemblyCompiler.Bin.wasmdis()) fjs11o.wasm -o fjs11o.wat`)
     
    function fjs12(x)
        JS.console_log(string("hello", "world"))
        return x
    end
    compile((fjs12, Float64,); filepath = "fjs12.wasm", validate = true)
    run(`$(WebAssemblyCompiler.Bin.wasmdis()) fjs12.wasm -o fjs12.wat`)


    function fjs13(x)
        JS.eval("console.log('hello world')")
        return x
    end
    compile((fjs13, Float64,); filepath = "fjs13.wasm", validate = true)
    run(`$(WebAssemblyCompiler.Bin.wasmdis()) fjs13.wasm -o fjs13.wat`)

    function fjs14(x)
        y = hash("hello")
        return Float64(y) + x
    end
    compile((fjs14, Float64,); filepath = "fjs14.wasm", validate = true)
    run(`$(WebAssemblyCompiler.Bin.wasmdis()) fjs14.wasm -o fjs14.wat`)

end
