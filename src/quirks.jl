using Base.Experimental: @overlay

macro print_and_throw(err)
    quote
        console_log($err)
    end
end

# @overlay MT Base.sqrt(x::Float64) = @ccall BinaryenUnary.BinaryenSqrtFloat32(x::Float64)::Float64

@overlay MT Base.sin(x::Float64) = Base.llvmcall("(x) => Math.sin(x)", Float64, Tuple{Float64}, x)
@overlay MT Base.cos(x::Float64) = Base.llvmcall("(x) => Math.cos(x)", Float64, Tuple{Float64}, x)
@overlay MT Base.tan(x::Float64) = Base.llvmcall("(x) => Math.tan(x)", Float64, Tuple{Float64}, x)
@overlay MT Base.asin(x::Float64) = Base.llvmcall("(x) => Math.asin(x)", Float64, Tuple{Float64}, x)
@overlay MT Base.acos(x::Float64) = Base.llvmcall("(x) => Math.acos(x)", Float64, Tuple{Float64}, x)
@overlay MT Base.atan(x::Float64) = Base.llvmcall("(x) => Math.atan(x)", Float64, Tuple{Float64}, x)
@overlay MT Base.sinh(x::Float64) = Base.llvmcall("(x) => Math.sinh(x)", Float64, Tuple{Float64}, x)
@overlay MT Base.cosh(x::Float64) = Base.llvmcall("(x) => Math.cosh(x)", Float64, Tuple{Float64}, x)
@overlay MT Base.tanh(x::Float64) = Base.llvmcall("(x) => Math.tanh(x)", Float64, Tuple{Float64}, x)
@overlay MT Base.asinh(x::Float64) = Base.llvmcall("(x) => Math.asinh(x)", Float64, Tuple{Float64}, x)
@overlay MT Base.acosh(x::Float64) = Base.llvmcall("(x) => Math.acosh(x)", Float64, Tuple{Float64}, x)
@overlay MT Base.atanh(x::Float64) = Base.llvmcall("(x) => Math.atanh(x)", Float64, Tuple{Float64}, x)
@overlay MT Base.log(x::Float64) = Base.llvmcall("(x) => Math.log(x)", Float64, Tuple{Float64}, x)
@overlay MT Base.log2(x::Float64) = Base.llvmcall("(x) => Math.log2(x)", Float64, Tuple{Float64}, x)
@overlay MT Base.log10(x::Float64) = Base.llvmcall("(x) => Math.log10(x)", Float64, Tuple{Float64}, x)
@overlay MT Base.log1p(x::Float64) = Base.llvmcall("(x) => Math.log1p(x)", Float64, Tuple{Float64}, x)
@overlay MT Base.exp(x::Float64) = Base.llvmcall("(x) => Math.exp(x)", Float64, Tuple{Float64}, x)
@overlay MT Base.expm1(x::Float64) = Base.llvmcall("(x) => Math.expm1(x)", Float64, Tuple{Float64}, x)
@overlay MT Base.cbrt(x::Float64) = Base.llvmcall("(x) => Math.cbrt(x)", Float64, Tuple{Float64}, x)
@overlay MT Base.sign(x::Float64) = Base.llvmcall("(x) => Math.sign(x)", Float64, Tuple{Float64}, x)
@overlay MT Base.rand() = Base.llvmcall("() => Math.random()", Float64, Tuple{})
@overlay MT Base.:^(x::Float64, y::Float64) = Base.llvmcall("(x, y) => Math.pow(x)", Float64, Tuple{Float64, Float64}, x, y)
@overlay MT Base.atan(x::Float64, y::Float64) = Base.llvmcall("(x, y) => Math.atan2(x, y)", Float64, Tuple{Float64, Float64}, x, y)

@overlay MT Base.cconvert(::Type{String}, x::String) = x
@overlay MT Base.unsafe_convert(::Type{String}, x::String) = x

@overlay MT function Base.copy(src::Array{T, N}) where {T, N}
    dest = similar(src)
    @ccall _jl_array_copy(src::Array{T,N}, dest::Array{T,N}, length(src)::Int32)::Cvoid
    return dest
end
# @overlay MT Base.size(x::Vector) = length(x)
@overlay MT Base._copyto_impl!(dest::Array{T, 1}, doffs::Integer, src::Array{T, 1}, soffs::Integer, n::Integer) where {T} =
    @ccall _jl_array_copyto(dest::Array{T,1}, doffs::Int32, src::Array{T,1}, soffs::Int32, n::Int32)::Array{T,1}

@overlay MT Base.string(x...) = JS.array_to_string(JS.object(Any[x...]))

@overlay MT Base.getindex(::Type{Any}, @nospecialize vals...) = unrolledgetindex(vals)

using Unrolled

@unroll function unrolledgetindex(vals)
    a = Vector{Any}(undef, length(vals))
    @unroll for i = 1:length(vals)
        a[i] = vals[i]
    end
    return a
end

@overlay MT Base.hash(x::String) = Int(Base.llvmcall("\$hash-string", Int32, Tuple{String}, x))


# # math.jl
# @device_override @noinline Base.Math.throw_complex_domainerror(f::Symbol, x) =
#     @print_and_throw c"This operation requires a complex input to return a complex result"
# @device_override @noinline Base.Math.throw_exp_domainerror(f::Symbol, x) =
#     @print_and_throw c"Exponentiation yielding a complex result requires a complex argument"

# # intfuncs.jl
# @device_override @noinline Base.throw_domerr_powbysq(::Any, p) =
#     @print_and_throw c"Cannot raise an integer to a negative power"
# @device_override @noinline Base.throw_domerr_powbysq(::Integer, p) =
#     @print_and_throw c"Cannot raise an integer to a negative power"
# @device_override @noinline Base.throw_domerr_powbysq(::AbstractMatrix, p) =
#     @print_and_throw c"Cannot raise an integer to a negative power"
# @device_override @noinline Base.__throw_gcd_overflow(a, b) =
#     @print_and_throw c"gcd overflow"

# # checked.jl
# @device_override @noinline Base.Checked.throw_overflowerr_binaryop(op, x, y) =
#     @print_and_throw c"Binary operation overflowed"
# @device_override @noinline Base.Checked.throw_overflowerr_negation(op, x, y) =
#     @print_and_throw c"Negation overflowed"
# @device_override function Base.Checked.checked_abs(x::Base.Checked.SignedInt)
#     r = ifelse(x < 0, -x, x)
#     r < 0 && @print_and_throw(c"checked arithmetic: cannot compute |x|")
#     r
# end

# # boot.jl
# @device_override @noinline Core.throw_inexacterror(f::Symbol, ::Type{T}, val) where {T} =
#     @print_and_throw c"Inexact conversion"

# # abstractarray.jl
# @device_override @noinline Base.throw_boundserror(A, I) =
#     @print_and_throw c"Out-of-bounds array access"

# # trig.jl
# @device_override @noinline Base.Math.sincos_domain_error(x) =
#     @print_and_throw c"sincos(x) is only defined for finite x."
