@testitem "Function arguments" begin
    include("setup.jl")   

    # singleton arg
    @noinline fargs1a(a, b) = 2a
    function fargs1(x)
        y = fargs1a(x, sin)
        return x * y
    end
    compile((fargs1, Float64,); filepath = "tmp/fargs1.wasm", validate = true)

    # closures and callable structs
    struct X
        a::Float64
    end
    @noinline (x::X)(w) = w * x.a 
    function fargs2(x)
        y = X(2.0)(x)
        return x * y
    end
    compile((fargs2, Float64,); filepath = "tmp/fargs2.wasm", validate = true)

    # keyword args
    @noinline fargs3a(a; b = 2, c = 5) = a + b
    function fargs3(x)
        y = fargs3a(x, b = 1)
        return x * y
    end
    compile((fargs3, Float64,); filepath = "tmp/fargs3.wasm", validate = true)

    # keyword varargs
    @noinline fargs4a(a; b = 2, kw...) = a + b + kw[1]
    function fargs4(x)
        y = fargs4a(x, b = 1, c = 9)
        return x * y
    end
    compile((fargs4, Float64,); filepath = "tmp/fargs4.wasm", validate = true)

    # varargs
    @noinline fargs5a(a, args...) = args
    function fargs5(x)
        tup = fargs5a(x, 1, 1.1)
        return x * tup[2]
    end
    compile((fargs5, Float64,); filepath = "tmp/fargs5.wasm", validate = true)

    # varargs - 1 arg
    @noinline fargs6a(a, args...) = args
    function fargs6(x)
        tup = fargs6a(x, 1.0)
        return x * tup[1]
    end
    compile((fargs6, Float64,); filepath = "tmp/fargs6.wasm", validate = true)
    
    # varargs - 1 arg, splice
    @noinline fargs7a(a, args...) = (a, args...)
    function fargs7(x)
        tup = fargs7a(x, 1.0)
        return x * tup[1]
    end
    compile((fargs7, Float64,); filepath = "tmp/fargs7.wasm", validate = true)
 
    # varargs - 0 args
    @noinline fargs8a(a, args...) = (a, args...)
    function fargs8(x)
        tup = fargs8a(x)
        return x * tup[1]
    end
    compile((fargs8, Float64,); filepath = "tmp/fargs8.wasm", validate = true)  # type error in Chrome
    compile((fargs8, Float64,); filepath = "tmp/fargs8.wasm", validate = true, optimize = true)
    
end

@testitem "Misc" begin
    include("setup.jl")   

    function f13(x)
        y = Core.bitcast(UInt64, x)
        return Core.bitcast(Float64, y)
    end
    compile((f13, Float64); filepath = "tmp/f13.wasm", validate = true)
    x = 3.0
    # @show f13(x)
    jsfun = jsfunctions((f13, Float64,))
    @test f13(x) == jsfun.f13(x)

end

@testitem "Basics" begin
    include("setup.jl")   
    
    function fb1(x,y)
        a = x + y
        a + 1
    end
    # compile((fb1, Float64,Float64); filepath = "tmp/fb1.wasm")
    jsfun = jsfunctions((fb1, Float64,Float64))
    @test fb1(3.0, 4.0) == jsfun.fb1(3.0, 4.0)
    jsfun = jsfunctions((fb1, Int32,Int32))
    @test fb1(3, 4) == jsfun.fb1(3, 4)
    jsfun = jsfunctions((fb1, Float64,Int32))
    @test fb1(3, 4) == jsfun.fb1(3, 4)

    function fb2(x,y)
        a = x + y
        a > 2 ? a + 1 : 2a
    end
    jsfun = jsfunctions((fb2, Float64,Float64))
    @test fb2(3.0, 4.0) == jsfun.fb2(3.0, 4.0)
    @test fb2(-3.0, 4.0) == jsfun.fb2(-3.0, 4.0)
    jsfun = jsfunctions((fb2, Int32,Int32))
    @test fb2(3, 4) == jsfun.fb2(3, 4)
    @test fb2(-3, 4) == jsfun.fb2(-3, 4)

    jsfun = jsfunctions((fb1, Float64, Float64),
                        (fb2, Float64, Float64))
    @test fb1(3.0, 4.0) == jsfun.fb1(3.0, 4.0)
    @test fb2(3.0, 4.0) == jsfun.fb2(3.0, 4.0)
    

    function fb3(x,y)
        if x > 1.0
            a = x + y
        else
            a = x + y + 3
        end
        a
    end
    jsfun = jsfunctions((fb3, Float64,Float64))
    @test fb3(0.0, 4.0) == jsfun.fb3(0.0, 4.0)
    @test fb3(2.0, 4.0) == jsfun.fb3(2.0, 4.0)

    function fb4(x,y)
        if x > 1.0
            a = x + 1.0
            b = 3.0
        else
            a = y + 2.0
            b = 4.0
        end
        a + b
    end
    jsfun = jsfunctions((fb4, Float64,Float64))
    @test fb4(0.0, 4.0) == jsfun.fb4(0.0, 4.0)
    @test fb4(2.0, 4.0) == jsfun.fb4(2.0, 4.0)

    function fb5(x,y)
        a = 0.0
        while a < 4.0
            a = a + x
        end
        a + y
    end
    jsfun = jsfunctions((fb5, Float64,Float64))
    @test fb5(1.0, 4.0) == jsfun.fb5(1.0, 4.0)
    @test fb5(5.0, 4.0) == jsfun.fb5(5.0, 4.0)

    @noinline twox(x) = 2x
    function fb7(x,y)
        x + twox(y)
    end
    compile((fb7, Float64,Float64); filepath = "tmp/fb7.wasm")
    jsfun = jsfunctions((fb7, Float64,Float64))
    @test fb7(3.0, 4.0) == jsfun.fb7(3.0, 4.0)

    function fb8(x)
        2x + twox(x)
    end
    jsfun = jsfunctions((fb7, Float64,Float64),
                        (fb8, Float64))
    @test fb7(3.0, 4.0) == jsfun.fb7(3.0, 4.0)
    @test fb8(3.0) == jsfun.fb8(3.0)

    @noinline fb9a(x, ::Type{I}) where {I} = I === Int ? 1.0 * x : 5.0 * x
    fb9(x) = fb9a(x, Float64) * x
    compile((fb9, Float64); filepath = "tmp/fb9.wasm")
    jsfun = jsfunctions((fb9, Float64))
    @test fb9(3.0) == jsfun.fb9(3.0)

end

@testitem "Arrays" begin
    include("setup.jl")   

    function fa1(i)
        a = Array{Float64,1}(undef, Int32(3))
        @inbounds a[i] = 3.0
        @inbounds a[i]
    end
    compile((fa1, Int32,); filepath = "tmp/fa1.wasm")
    compile((fa1, Int32,); filepath = "tmp/fa1o.wasm", optimize = true)
    # jsfun = jsfunctions((fa1, Int32,))
    # @test fa1(Int32(3)) == jsfun.fa1(Int32(3))

    function fa2(i)
        a = Array{Float64,1}(undef, Int32(i))
        unsafe_trunc(Int32, length(a))
    end
    compile((fa2, Int32,); filepath = "tmp/fa2.wasm")
    # compile((fa2, Int32,); filepath = "tmp/fa2o.wasm", optimize = true)   # crashes
    ## BROKEN
    # jsfun = jsfunctions((fa2, Int32,))
    # @test fa2(Int32(3)) == jsfun.fa2(Int32(3))

    @noinline function fa3a(x)
        @inbounds x[2]
    end
    function fa3(x)
        # a = [1.,2.,3.]
        a = Array{Float64, 1}(undef, 3)
        fa3a(a) + x
    end
    compile((fa3, Float64,); filepath = "tmp/fa3.wasm")
    # jsfun = jsfunctions((fa3, Float64,))
    # x = 3.0
    # @test fa3(x) == jsfun.fa3(x)

    function fa4(x)
        a = ones(5)
        b = copy(a)
        b[2] * x
    end
    compile((fa4, Float64,); filepath = "tmp/fa4.wasm", validate = true)
    # In NodeCall: Compiling function #0 failed: invalid array index.
    # Works in the browser.
    # jsfun = jsfunctions((f11, Float64,))
    # x = 2.0
    # @test jsfun.f11(x) == f11(x)

    function fa5(x)
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
    compile((fa5, Float64,); filepath = "tmp/fa5.wasm", validate = true)

    # function fa6(x)
    #     a = [1.,2.,3.]
    #     a[2] + x
    # end
    # compile((fa6, Float64,); filepath = "tmp/fa6.wasm")

    const a = [1.,2.]
    @noinline function fa7!(x)
        a[1] = x
        return x
    end
    function fa7(x)
        fa7!(x)
        x
    end
    compile((fa7, Float64,); filepath = "fa7.wasm")

end


@testitem "Structs" begin
    include("setup.jl")   

    mutable struct X{A,B,C}
        a::A
        b::B
        c::C
    end

    @noinline function fstructs1a(y)
        X(y, 2y, 3y)
    end
    function fstructs1(x)
        x = fstructs1a(x)
        x.c + 1
    end
    # x = X(1., 2., 3.)
    compile((fstructs1, Float64,); filepath = "tmp/fstructs1.wasm")
    # jsfun = jsfunctions((fstructs1, Float64,))
    # x = 3.0
    # @test fstructs1(x) == jsfun.fstructs1(x)

    @noinline function fstructs2a(y)
        x = X(y, 2y, 3y)
        x.b = x.c
        x
    end
    function fstructs2(x)
        y = fstructs2a(x)
        y.c + 1
    end
    compile((fstructs2, Float64); filepath = "tmp/fstructs2.wasm")
    # jsfun = jsfunctions((fstructs2, Float64,))
    # x = 3.0
    # @test fstructs2(x) == jsfun.fstructs2(x)

    function fstructs3(x)
        a = [1.,2.,x]
        a[2] + x
    end
    compile((fstructs3, Float64,); filepath = "tmp/fstructs3.wasm", validate = true)
    x = 3.0
    # jsfun = jsfunctions((fstructs3, Float64,))
    # @test fstructs3(x) == jsfun.fstructs3(x)

end

@testitem "Strings" begin
    include("setup.jl")   

    function fstrings1(x)
        a = "hello"
        @ccall console.log(a::String)::Cvoid
        return x
    end
    compile((fstrings1, Float64,); filepath = "tmp/fstrings1.wasm")
    ## NodeCall doesn't work because its version of Node doesn't support stringrefs.
    # jsfun = jsfunctions((f, Float64,))
    # jsfun.f(1.0)

end

@testitem "llvmcall" begin
    include("setup.jl")   

    ftwox(x) = Base.llvmcall("(x) => 2*x", Float64, Tuple{Float64}, x)
    x = 0.5
    # compile((ftwox, Float64,); filepath = "tmp/ftwox.wasm")
    jsfun = jsfunctions((ftwox, Float64,))
    @test jsfun.ftwox(x) == 2x
    
    mysin(x) = Base.llvmcall("(x) => Math.sin(x)", Float64, Tuple{Float64}, x)
    # compile((mysin, Float64,); filepath = "tmp/mysin.wasm")
    jsfun = jsfunctions((mysin, Float64,))
    x = 0.5
    @test jsfun.mysin(x) == sin(x)

end

@testitem "Math" begin
    include("setup.jl")   

    # This one calls the JavaScript version because `cos` is in a function.
    f(x) = cos(x)
    jsfun = jsfunctions((f, Float64,))
    x = 0.5
    @test f(x) == jsfun.f(x)

    # This one compiles the Julia version because `sqrt` is compiled directly.
    # jsfun = jsfunctions((sqrt, Float64,))
    # for x in (0.5, 1.01, 3.0, 300.0)
    #     @test sqrt(x) == jsfun.sqrt(x)
    # end

    ## These log functions used to test fine when a Symbol was represented by an Int32 value.
    ## Now, they fail because of the stringref used to represent Symbols.
    # jsfun = jsfunctions((log, Float64,))
    # for x in (0.5, 1.01, 3.0, 300.0)
    #     @test log(x) == jsfun.log(x)
    # end

    # jsfun = jsfunctions((log10, Float64,))
    # for x in (0.5, 1.01, 3.0, 300.0)
    #     @test log10(x) == jsfun.log10(x)
    # end

    jsfun = jsfunctions((muladd, Float64, Float64, Float64,))
    x, y, z = 3.0, 2.0, 1.0
    @test muladd(x, y, z) == jsfun.muladd(x, y, z)

    # jsfun = jsfunctions((exp, Float64,))
    # x = 3.0
    # @test exp(x) == jsfun.exp(x)

    # jsfun = jsfunctions((acos, Float64,))
    # x = 0.3
    # @test acos(x) == jsfun.acos(x)

end

@testitem "Tuples / globals" begin
    include("setup.jl")   

    const tpl = (1.,2.,3.)
    function ftuples1(x)
        @inbounds tpl[x]
    end
    compile((ftuples1, Int32,); filepath = "tmp/ftuples1.wasm")
    # jsfun = jsfunctions((ftuples1, Int32,))
    # x = Int32(1)
    # @test ftuples1(x) == jsfun.ftuples1(x)

end

@testitem "Globals" begin
    include("setup.jl")   

    const a = [1.,2.,3.,4.]
    fglobals1(i) = @inbounds length(a)
    compile((fglobals1, Int32,); filepath = "tmp/fglobals1.wasm", validate = true)
    # works in browser!
    # jsfun = jsfunctions((fglobals1, Int32,))
    # @test jsfun.fglobals1(1) == fglobals1(1)

    fglobals2(i) = @inbounds a[i]
    compile((fglobals2, Int32,); filepath = "tmp/fglobals2.wasm", validate = true, optimize = true)
    # jsfun = jsfunctions((fglobals2, Int32,))
    # @test jsfun.fglobals2(1) == fglobals2(1)
    
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
    compile((g1, Int32,); filepath = "tmp/globalcombo.wasm")
    # jsfun = jsfunctions((g1, Int32,))
    # @test jsfun.g1(1) == g1(1)

    
    mutable struct X
        a::Array{Float64,1}
        b::Array{Float64,1}
        c::Float64
    end
    const xx = X([1.,2.], [5., 6.], 3.)
    g1(i) = xx.b[i]
    compile((g1, Int32,); filepath = "tmp/globalcombo2.wasm")
    # jsfun = jsfunctions((g1, Int32,))
    # @test jsfun.g1(1) == g1(1)
    # # @show jsfun.g1(2)

    g2(i) = xx.b[i] + length(xx.a)
    compile((g2, Int32,); filepath = "tmp/globalcombo3.wasm")
    # jsfun = jsfunctions((g2, Int32,))
    # @test jsfun.g2(1) == g2(1)
    # @show jsfun.g2(2)

    function fglobals3(x)
        xx.b[2] = 4.
        xx.c = 5.
        return x + xx.c
    end
    compile((fglobals3, Float64,); filepath = "tmp/fglobals3.wasm")

 
    const d = Dict{Int32,Int32}(1 => 10, 2 => 20, 3 => 30, 4 => 40)
    f(i) = get(d, i, Int32(-1))
    compile((f, Int32,); filepath = "tmp/dict.wasm")
    # works in browser!
    # jsfun = jsfunctions((f, Int32,))
    # @show jsfun.f(1)

    function fdict1(x)
        d = Dict{Int, Float64}((1 => 10., 2 => 20., 3 => 30.))
        get(d, 2, -1.0) + x
    end
    compile((fdict1, Float64,); filepath = "tmp/fdict1.wasm")

    function fhash2(x)
        z = Base.hashindex("jhkjh", 3)
        z[1] + x
    end
    compile((fhash2, Float64,); filepath = "tmp/fhash2.wasm")

    function fdict2(x)
        d = Dict{String, String}(("1" => "10.", "2" => "20.", "3" => "30."))
        get(d, 2, -1.0) + x
    end
    compile((fdict2, Float64,); filepath = "tmp/fdict2.wasm")

end

@testitem "Aliasing" begin
    const a = Float64[1.,2.,3.]
    const tpl = (a, a)
    function falias(x)
        @inline tpl[1][1] = 10. 
        y = tpl[2][1]
        display(y)
        return x
    end
    compile((falias, Float64,); filepath = "tmp/falias.wasm", validate = true)

    function falias2(x)  # works
        a = Float64[1:1.:10;]
        tpl = (a = a, aa = a, b = 3)
        tpl.a[1] = 10. 
        y = tpl.aa[1]
        display(1.0)
        display(string(y, " "))
        display(3.0)
        display("hello")
        return x
    end
    compile((falias2, Float64,); filepath = "tmp/falias2.wasm", validate = true)

end

@testitem "Dictionaries" begin
    include("setup.jl")   
    using Dictionaries
    function fdict2(x)
        d = Dictionary{Int32, Float64}(Int32[Int32(1),Int32(2),Int32(3)], [10.,20.,30.])
        get(d, 2, -1.0) + x
    end
    compile((fdict2, Float64,); filepath = "tmp/fdict2.wasm", validate = true)
end
 
@testitem "JavaScript interop" begin
    include("setup.jl")   

    function fjs10(x)
        a = Vector{Any}(undef, 3)
        a[1] = 1.5
        a[2] = Int32(2)
        jsa = JS.object(a)
        JS.console_log(jsa)
        return x
    end
    compile((fjs10, Float64,); filepath = "tmp/fjs10.wasm", validate = true)

    function fjs11(x)
        a = Any[1.5, Int32(2), "hello"]
        jsa = JS.object(a)
        JS.console_log(jsa)
        return x
    end
    compile((fjs11, Float64,); filepath = "tmp/fjs11.wasm", validate = true)
    compile((fjs11, Float64,); filepath = "tmp/fjs11o.wasm", optimize = true)
     
    function fjs12(x)
        JS.console_log(string("hello", "world"))
        return x
    end
    compile((fjs12, Float64,); filepath = "tmp/fjs12.wasm", validate = true)


    function fjs13(x)
        JS.eval("console.log('hello world')")
        return x
    end
    compile((fjs13, Float64,); filepath = "tmp/fjs13.wasm", validate = true)

    function fjs14(x)
        y = hash("hello")
        return Float64(y) + x
    end
    compile((fjs14, Float64,); filepath = "tmp/fjs14.wasm", validate = true)

    function fjs15(x)
        y = JS.getelementbyid("myid")
        JS.sethtml(y, "hello <strong>world</strong>")
        return x
    end
    compile((fjs15, Float64,); filepath = "tmp/fjs15.wasm", validate = true)

    function fjs16(x)
        JS.sethtml("myid", "hello <strong>world</strong>")
        return x
    end
    compile((fjs16, Float64,); filepath = "tmp/fjs16.wasm", validate = true)

    function fjs17(x)
        a = Any[1.5, Int32(2), "hello", Any[1.5, "world"]]
        jsa = JS.object(a)
        JS.console_log(jsa)
        return x
    end
    compile((fjs17, Float64,); filepath = "tmp/fjs17.wasm", validate = true)

    function fjs18(x)
        a = [1.5, 3.0]
        jsa = JS.object(a)
        JS.console_log(jsa)
        return x
    end
    compile((fjs18, Float64,); filepath = "tmp/fjs18.wasm", validate = true)

    function fjs19(x)
        a = :Hello
        jso = JS.object(a)
        JS.console_log(jso)
        return x
    end
    compile((fjs19, Float64,); filepath = "tmp/fjs19.wasm", validate = true)

    function fjs20(x)
        a = 1.3
        jso = JS.object(a)
        JS.console_log(jso)
        return x
    end
    compile((fjs20, Float64,); filepath = "tmp/fjs20.wasm", validate = true)

    function fjs21(x)
        JS.console_log(:Cheers)
        return x
    end
    compile((fjs21, Float64,); filepath = "tmp/fjs21.wasm", validate = true)

    function fjs22(x)
        a = (a = 1.5, b = Int32(3), c = "hello", d = (x = x, y = 22.0))
        jso = JS.object(a)
        JS.console_log(jso)
        return x
    end
    compile((fjs22, Float64,); filepath = "tmp/fjs22.wasm", validate = true)

    function fjs23(x)
        JS.console_log(Float64[1.1, 2.2])
        return x
    end
    compile((fjs23, Float64,); filepath = "tmp/fjs23.wasm", validate = true)

end

@testitem "IO" begin
    include("setup.jl")   

    function fio1(x)
        io = JS.IOBuff()
        print(io, x)
        print(io, " hello", " hello", " world")
        print(io, " hello", " hello", " world", "1", "2", "3", "4")
        print(io, "X")
        JS.console_log(take!(io))
        return x
    end
    compile((fio1, Float64,); filepath = "tmp/fio1.wasm", validate = true)

end

@testitem "Cobweb / Hyperscript" begin
    include("setup.jl")   

    const h = JS.h

    function fcw1(x)
        n = h("div", "jkl", h("strong", "!!!!!", "xxxx"), class = "myclass")
        n = h("div", "hi", "abc", x, n, class = "myclass2")
        JS.sethtml("myid", string(n))
        return x
    end
    # ## This version crashes Julia:
    # function fcw1(_x)
    #     n = h("div", "jkl", h("strong", "!!!!!", "xxxx"), class = "myclass")
        # n = h("div", "hi", "abc", _x, n, class = "myclass2")
    #     JS.sethtml("myid", n)
    #     return _x
    # end
    compile((fcw1, Float64,); filepath = "tmp/fcw1.wasm", validate = true)
    function fcw2(x)
        snip = h("div",
                 h.h1("Hello there"),
                 h.p("This is some ", h.strong("strong text")),
                 h.p("more text", class = "myclass"))
        JS.sethtml("myid", string(snip))
        return x
    end
    compile((fcw2, Float64,); filepath = "tmp/fcw2.wasm", validate = true)

    # const obj = JS.object
    # const Ext = WebAssemblyCompiler.Externref
    # @inline _mithril(n::JS.Node) = mithril(n)
    # @inline _mithril(x) = obj(x)
    # @inline _mithril(x, xs::Tuple...) = (x, _mithril(xs...)...)
    # @inline _mithril(x, y) = (x, y)

    # mithril(tag::String, attrs::Ext, content::Ext) =    
    #     Base.llvmcall("(tag, attrs, content) => m(tag, attrs, content)", 
    #         Ext, 
    #         Tuple{String, Ext, Ext}, 
    #         tag, attrs, content)
    # mithril(tag::String, attrs::Ext, content::String) =    
    #     Base.llvmcall("(tag, attrs, content) => m(tag, attrs, content)", 
    #         Ext, 
    #         Tuple{String, Ext, String}, 
    #         tag, attrs, content)
    
    # mithril(n::JS.Node) =
    #     mithril(JS.tag(n), obj(JS.attrs(n)), obj(_mithril(JS.children(n)...)))
  

    # function fcw3(x)
    #     snip = h("div",
    #              h("p", h("strong", "strong text"), " text"))
    #     JS.sethtml("myid", string(snip))
    #     # JS.console_log(mithril(snip))
    #     return x
    # end
    # compile((fcw3, Float64,); filepath = "tmp/fcw3.wasm", validate = true)

    # # Here's a more direct approach to convert to mithril objects as you go.
    # m(tag, attrs::Ext, content::Ext) =
    #     Base.llvmcall("(tag, attrs, content) => m(tag, attrs, content)", 
    #         Ext, 
    #         Tuple{String, Ext, Ext}, 
    #         tag, attrs, content)
    # m(tag, attrs::Ext, content::String) =
    #     Base.llvmcall("(tag, attrs, content) => m(tag, attrs, content)", 
    #         Ext, 
    #         Tuple{String, Ext, String}, 
    #         tag, attrs, content)
    # m(tag, attrs, content) =
    #     m(tag, JS.object(attrs), content)
    # m(tag, attrs::Ext, content) =
    #     m(tag, attrs, JS.object(content))
    # m(tag, attrs::Ext, content...) =
    #     m(tag, attrs, _m(content...))
    # m(tag, content::String="") = m(tag, (;), content)
    
    # @inline _m() = ()
    # @inline _m(x) = (x,)
    # @inline _m(x, xs::Tuple...) = (x, _m(xs...)...)
    # @inline _m(x, y) = (x, y)

    # function fcw4(x)
    #     snip = m("div",
    #              m("h1", (class = "myclass",), "Hello there"),
    #              m("p", m("strong", "strong text")))
    #     JS.sethtml("myid", string(snip))
    #     # JS.console_log(snip)
    #     return x
    # end
    # compile((fcw4, Float64,); filepath = "tmp/fcw4.wasm", validate = true)

end
