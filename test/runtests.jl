using TestItemRunner
using Test
using WebAssemblyCompiler

include("setup.jl")   

struct Box{T}
    x::T
end

# include("needs-work.jl")   

    function fa13(x)
        a = Vector{Any}(undef, 3)
        a[1] = Box(1.0)
        # a[2] = "hello"
        a[3] = Box(Int32(2))
        # b = a[1].x::Float64
        return x
    end
    compile((fa13, Float64,); filepath = "fa13.wasm", validate = true)
    run(`$(WebAssemblyCompiler.Bin.wasmdis()) fa13.wasm -o fa13.wat`)
# exit()
 
    # compile((string, Float64,Int32, String); filepath = "fstr13.wasm")

    # function fstr13(arr)
    #     @ccall makestring(arr::Ref{Any})::String
    # end
    # compile((fstr13, Vector,); filepath = "fstr13.wasm")

    # function fstr13(arr)
    #     Base.llvmcall("makestring", String, Tuple{Vector{Any}}, arr)
    # end
    # getindexany(x::Vector{Any}, i) = getindex(x, i)
    # isstring(x) = llvmcall("__isstring", Bool, Tuple{Any}, x)
    # getstring(x) = llvmcall("__caststring", String, Tuple{Any}, x)
    # compile(((fstr13, Vector{Any}),
    #         getindexany, Vector{Any}, Int32),
    #         (length, Vector),
    #         (isstring, Any),
    #         (getstring, Any),
    #         #  (isf64, Any),
    #         #  (getf64, Any),
    #         ; filepath = "fstr13.wasm", validate = true)
    # run(`$(WebAssemblyCompiler.Bin.wasmdis()) fstr13.wasm -o fstr13.wat`)

    # using Dictionaries
    # function fdict1(x)
    #     d = Dictionary{Int32, Float64}([1,2,3], [10.,20.,30.])
    #     get(d, 2, -1.0) + x
    # end
    # compile((fdict1, Float64,); filepath = "fdict1.wasm")
    # run(`$(WebAssemblyCompiler.Bin.wasmdis()) fdict1.wasm -o fdict1.wat`)
 
# exit()

@run_package_tests
