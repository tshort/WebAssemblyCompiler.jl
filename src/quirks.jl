using Base.Experimental: @overlay

macro print_and_throw(err)
    quote
        console_log($err)
    end
end

# @overlay MT Base.sqrt(x::Float64) = @ccall BinaryenUnary.BinaryenSqrtFloat32(x::Float64)::Float64

@overlay MT Base.sin(x::Float64) = @ccall Math.sin(x::Float64)::Float64
@overlay MT Base.cos(x::Float64) = @ccall :Math.cos(x::Float64)::Float64
@overlay MT Base.tan(x::Float64) = @ccall :Math.tan(x::Float64)::Float64
@overlay MT Base.asin(x::Float64) = @ccall :Math.asin(x::Float64)::Float64
@overlay MT Base.acos(x::Float64) = @ccall :Math.acos(x::Float64)::Float64
@overlay MT Base.atan(x::Float64) = @ccall :Math.atan(x::Float64)::Float64
@overlay MT Base.atan(x::Float64, y::Float64) = @ccall Math.atan2(x::Float64, y::Float64)::Float64
@overlay MT Base.sinh(x::Float64) = @ccall Math.sinh(x::Float64)::Float64
@overlay MT Base.cosh(x::Float64) = @ccall :Math.cosh(x::Float64)::Float64
@overlay MT Base.tanh(x::Float64) = @ccall :Math.tanh(x::Float64)::Float64
@overlay MT Base.asinh(x::Float64) = @ccall Math.asinh(x::Float64)::Float64
@overlay MT Base.acosh(x::Float64) = @ccall :Math.acosh(x::Float64)::Float64
@overlay MT Base.atanh(x::Float64) = @ccall :Math.atanh(x::Float64)::Float64
@overlay MT Base.log(x::Float64) = @ccall :Math.log(x::Float64)::Float64
@overlay MT Base.log2(x::Float64) = @ccall :Math.log2(x::Float64)::Float64
@overlay MT Base.log10(x::Float64) = @ccall :Math.log10(x::Float64)::Float64
@overlay MT Base.log1p(x::Float64) = @ccall :Math.log1p(x::Float64)::Float64
@overlay MT Base.exp(x::Float64) = @ccall :Math.exp(x::Float64)::Float64
@overlay MT Base.expm1(x::Float64) = @ccall :Math.expm1(x::Float64)::Float64
@overlay MT Base.cbrt(x::Float64) = @ccall :Math.cbrt(x::Float64)::Float64
@overlay MT Base.:^(x::Float64, y::Float64) = @ccall :Math.pow(x::Float64, y::Float64)::Float64
@overlay MT Base.sign(x::Float64) = @ccall :Math.sign(x::Float64)::Float64
@overlay MT Base.rand() = @ccall Math.random()::Float64

@overlay MT Base.cconvert(::Type{String}, x::String) = x
@overlay MT Base.unsafe_convert(::Type{String}, x::String) = x

@overlay MT function Base.copy(src::Array{T, N}) where {T, N}
    dest = similar(src)
    @ccall _jl_array_copy(src::Array{T,N}, dest::Array{T,N}, length(src)::Int32)::Cvoid
    return dest
end
# @overlay MT Base.size(x::Vector) = length(x)

@overlay MT Base.string(x...) = JS.print_array_to_string(Any[x...])


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
