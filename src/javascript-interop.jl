export JS

module JS
using ..WebAssemblyCompiler: WebAssemblyCompiler, Box

arraynew(n) = Base.llvmcall("n => Array(n)", WebAssemblyCompiler.Externref, Tuple{Int32}, n)
## Use setindex! instead?? If so, need an ArrayRef type?
set(jsa::WebAssemblyCompiler.Externref, i::Integer, x::T) where T = Base.llvmcall("(v, i, x) => v[i] = x", Nothing, Tuple{WebAssemblyCompiler.Externref, Int32, T}, jsa, Int32(i - 1), x)
set(jsa::WebAssemblyCompiler.Externref, str::String, x::T) where T = Base.llvmcall("(v, i, x) => v[i] = x", Nothing, Tuple{WebAssemblyCompiler.Externref, String, T}, jsa, str, x)
get(jsa::WebAssemblyCompiler.Externref, i::Integer, ::Type{T}) where T = Base.llvmcall("(v, i) => v[i]", T, Tuple{WebAssemblyCompiler.Externref, Int32}, jsa, Int32(i - 1))
get(jsa::WebAssemblyCompiler.Externref, str::String, ::Type{T}) where T = Base.llvmcall("(v, i) => v[i]", T, Tuple{WebAssemblyCompiler.Externref, String}, jsa, str)

struct TypedArray{T} end

TypedArray{Float64}(n) = Base.llvmcall("n => new Float64Array(n)", WebAssemblyCompiler.Externref, Tuple{Int32}, n)
TypedArray{Float32}(n) = Base.llvmcall("n => new Float32Array(n)", WebAssemblyCompiler.Externref, Tuple{Int32}, n)

objectnew() = Base.llvmcall("() => ({})", WebAssemblyCompiler.Externref, Tuple{})

console_log(x::WebAssemblyCompiler.Externref) = Base.llvmcall("(x) => console.log(x)", Nothing, Tuple{WebAssemblyCompiler.Externref}, x)
console_log(x::T) where {T <: Union{Int32, Float32, Float64, String}} = Base.llvmcall("x => console.log(x)", Nothing, Tuple{T}, x)
console_log(x::Symbol) = Base.llvmcall("x => console.log(x)", Nothing, Tuple{String}, x)
console_log(x) = console_log(object(x))

getelementbyid(x) = Base.llvmcall("(x) => document.getElementById(x)", WebAssemblyCompiler.Externref, Tuple{String}, x)
sethtml(ref::WebAssemblyCompiler.Externref, str) = Base.llvmcall("(x, str) => x.innerHTML = str", Nothing, Tuple{WebAssemblyCompiler.Externref, String}, ref, str)
sethtml(id::String, str) = sethtml(getelementbyid(id), str)

eval(x::String) = Base.llvmcall("(x) => eval(x)", WebAssemblyCompiler.Externref, Tuple{String}, x)

array_to_string(x::WebAssemblyCompiler.Externref) = Base.llvmcall("(x) => x.join(\"\")", String, Tuple{WebAssemblyCompiler.Externref}, x)
array_to_string(x::Array) = array_to_string(object(x))

object(x::Union{Int32, Float32, Float64, String, Symbol}) = x
object(x::Char) = string(x)

function object(v::Vector{Any})
    jsa = arraynew(Int32(length(v)))
    for (i, x) in enumerate(v)
        if x isa Box{Float64}
            set(jsa, i, x.x)
        elseif x isa Box{Int32}
            set(jsa, i, x.x)
        elseif x isa Box{String}
            set(jsa, i, x.x)
        elseif x isa Box{Char}
            set(jsa, i, x.x)
        elseif x isa Vector{Any}
            set(jsa, i, object(x))
        end
    end
    return jsa
end

# function object(v::Vector{T}) where T <: Union{Int64, Int32, UInt64, UInt32, Float64, Float32, Char, Bool, UInt8, Int8}
function object(v::Vector{T}) where T <: Union{Float64, Float32}
    jsa = TypedArray{T}(Int32(length(v)))
    for (i, x) in enumerate(v)
        set(jsa, i, x)
    end
    return jsa
end

using Unrolled

@inline @generated function object(nt::NamedTuple)
    ks = fieldnames(nt)
    res = Expr(:block)
    push!(res.args, :(jso = objectnew()))
    for k in ks
        sk = String(k)
        qk = QuoteNode(k)
        push!(res.args, :(set(jso, $sk, object(getfield(nt, $qk)))))
    end
    push!(res.args, :(return jso))
    return res
end

# Simple IO buffer for printing to strings
struct IOBuff #<: IO      # subtyping IO causes problems for `print` below
    x::Vector{Any}
end
IOBuff() = IOBuff(Any[])

Base.isreadable(io::IOBuff) = false
Base.iswritable(io::IOBuff) = true

Base.take!(b::IOBuff) = array_to_string(b.x)

@inline Base.print(io::IOBuff, a)  = push!(io.x, a)
@inline Base.print(io::IOBuff, a, b)  = (push!(io.x, a); push!(io.x, b))
@inline Base.print(io::IOBuff, a, b, c...)  = (push!(io.x, a); push!(io.x, b); print(io, c...))

end