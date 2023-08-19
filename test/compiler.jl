@testitem "Basics" begin
    include("setup.jl")   
    
    function f1(x,y)
        a = x + y
        a + 1
    end
    # compile(f1, (Float64,Float64); filepath = "j.wasm")
    jsfun = jsfunctions(f1, (Float64,Float64))
    @test f1(3.0, 4.0) == jsfun.f1(3.0, 4.0)
    jsfun = jsfunctions(f1, (Int32,Int32))
    @test f1(3, 4) == jsfun.f1(3, 4)
    jsfun = jsfunctions(f1, (Float64,Int32))
    @test f1(3, 4) == jsfun.f1(3, 4)

    function f2(x,y)
        a = x + y
        a > 2 ? a + 1 : 2a
    end
    jsfun = jsfunctions(f2, (Float64,Float64))
    @test f2(3.0, 4.0) == jsfun.f2(3.0, 4.0)
    @test f2(-3.0, 4.0) == jsfun.f2(-3.0, 4.0)
    jsfun = jsfunctions(f2, (Int32,Int32))
    @test f2(3, 4) == jsfun.f2(3, 4)
    @test f2(-3, 4) == jsfun.f2(-3, 4)

    jsfun = jsfunctions(((f1, Float64, Float64),
                        (f2, Float64, Float64)))
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
    jsfun = jsfunctions(f3, (Float64,Float64))
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
    jsfun = jsfunctions(f4, (Float64,Float64))
    @test f4(0.0, 4.0) == jsfun.f4(0.0, 4.0)
    @test f4(2.0, 4.0) == jsfun.f4(2.0, 4.0)

    function f5(x,y)
        a = 0.0
        while a < 4.0
            a = a + x
        end
        a + y
    end
    jsfun = jsfunctions(f5, (Float64,Float64))
    @test f5(1.0, 4.0) == jsfun.f5(1.0, 4.0)
    @test f5(5.0, 4.0) == jsfun.f5(5.0, 4.0)

    function f6(x,y)
        a = x + y
        b = ccall(:sin, Float64, (Float64,), a)
        b + 1
    end
    compile(f6, (Float64,Float64); filepath = "j.wasm")
    # run(`$(Binaryen.Bin.wasmdis()) j.wasm -o j.wat`)
    jsfun = jsfunctions(f6, (Float64,Float64))
    @test  jsfun.f6(3.0, 4.0) ≈ sin(7.0) + 1

    @noinline twox(x) = 2x
    function f7(x,y)
        x + twox(y)
    end
    compile(f7, (Float64,Float64); filepath = "j.wasm")
    # run(`$(Binaryen.Bin.wasmdis()) j.wasm -o j.wat`)
    jsfun = jsfunctions(f7, (Float64,Float64))
    @test f7(3.0, 4.0) == jsfun.f7(3.0, 4.0)

end

@testitem "Arrays" begin
    include("setup.jl")   

    function f8(i)
        a = Array{Float64,1}(undef, Int32(3))
        @inbounds a[i] = 3.0
        @inbounds a[i]
    end
    compile(f8, (Int32,); filepath = "j.wasm")
    run(`$(Binaryen.Bin.wasmdis()) j.wasm -o j.wat`)
    jsfun = jsfunctions(f8, (Int32,))
    @test f8(Int32(3)) == jsfun.f8(Int32(3))

    function f9(i)
        a = Array{Float64,1}(undef, Int32(i))
        unsafe_trunc(Int32, length(a))
    end
    compile(f9, (Int32,); filepath = "j.wasm")
    run(`$(Binaryen.Bin.wasmdis()) j.wasm -o j.wat`)
    ## BROKEN
    # jsfun = jsfunctions(f9, (Int32,))
    # @test f9(Int32(3)) == jsfun.f9(Int32(3))

    @noinline function f10a(x)
        @inbounds x[2]
    end
    function f10(x)
        # a = [1.,2.,3.]
        a = Array{Float64, 1}(undef, 3)
        f10a(a) + x
    end
    compile(f10, (Float64,); filepath = "j.wasm")
    run(`$(Binaryen.Bin.wasmdis()) j.wasm -o j.wat`)
    jsfun = jsfunctions(f10, (Float64,))
    x = 3.0
    @test f10(x) == jsfun.f10(x)
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
    compile(f11, (Float64,); filepath = "j.wasm")
    run(`$(Binaryen.Bin.wasmdis()) j.wasm -o j.wat`)
    jsfun = jsfunctions(f11, (Float64,))
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
    compile(((f12, Float64,),); filepath = "j.wasm")
    # run(`$(Binaryen.Bin.wasmdis()) j.wasm -o j.wat`)
    jsfun = jsfunctions(f12, (Float64,))
    x = 3.0
    @test f12(x) == jsfun.f12(x)

end
