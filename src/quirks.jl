using Base.Experimental: @overlay

macro print_and_throw(err)
    quote
        JS.console_log($err)
    end
end

# @overlay MT Base.sqrt(x::Float64) = @ccall BinaryenUnary.BinaryenSqrtFloat32(x::Float64)::Float64

@overlay MT Base.sin(x::Float64) = @jscall("(x) => Math.sin(x)", Float64, Tuple{Float64}, x)
@overlay MT Base.cos(x::Float64) = @jscall("(x) => Math.cos(x)", Float64, Tuple{Float64}, x)
@overlay MT Base.tan(x::Float64) = @jscall("(x) => Math.tan(x)", Float64, Tuple{Float64}, x)
@overlay MT Base.asin(x::Float64) = @jscall("(x) => Math.asin(x)", Float64, Tuple{Float64}, x)
@overlay MT Base.acos(x::Float64) = @jscall("(x) => Math.acos(x)", Float64, Tuple{Float64}, x)
@overlay MT Base.atan(x::Float64) = @jscall("(x) => Math.atan(x)", Float64, Tuple{Float64}, x)
@overlay MT Base.sinh(x::Float64) = @jscall("(x) => Math.sinh(x)", Float64, Tuple{Float64}, x)
@overlay MT Base.cosh(x::Float64) = @jscall("(x) => Math.cosh(x)", Float64, Tuple{Float64}, x)
@overlay MT Base.tanh(x::Float64) = @jscall("(x) => Math.tanh(x)", Float64, Tuple{Float64}, x)
@overlay MT Base.asinh(x::Float64) = @jscall("(x) => Math.asinh(x)", Float64, Tuple{Float64}, x)
@overlay MT Base.acosh(x::Float64) = @jscall("(x) => Math.acosh(x)", Float64, Tuple{Float64}, x)
@overlay MT Base.atanh(x::Float64) = @jscall("(x) => Math.atanh(x)", Float64, Tuple{Float64}, x)
@overlay MT Base.log(x::Float64) = @jscall("(x) => Math.log(x)", Float64, Tuple{Float64}, x)
@overlay MT Base.log2(x::Float64) = @jscall("(x) => Math.log2(x)", Float64, Tuple{Float64}, x)
@overlay MT Base.log10(x::Float64) = @jscall("(x) => Math.log10(x)", Float64, Tuple{Float64}, x)
@overlay MT Base.log1p(x::Float64) = @jscall("(x) => Math.log1p(x)", Float64, Tuple{Float64}, x)
@overlay MT Base.exp(x::Float64) = @jscall("(x) => Math.exp(x)", Float64, Tuple{Float64}, x)
@overlay MT Base.expm1(x::Float64) = @jscall("(x) => Math.expm1(x)", Float64, Tuple{Float64}, x)
@overlay MT Base.cbrt(x::Float64) = @jscall("(x) => Math.cbrt(x)", Float64, Tuple{Float64}, x)
@overlay MT Base.sign(x::Float64) = @jscall("(x) => Math.sign(x)", Float64, Tuple{Float64}, x)
@overlay MT Base.rand() = @jscall("() => Math.random()", Float64, Tuple{})
@overlay MT Base.:^(x::Float64, y::Float64) = @jscall("(x, y) => Math.pow(x)", Float64, Tuple{Float64, Float64}, x, y)
@overlay MT Base.atan(x::Float64, y::Float64) = @jscall("(x, y) => Math.atan2(x, y)", Float64, Tuple{Float64, Float64}, x, y)

@overlay MT Base.cconvert(::Type{String}, x::String) = x
@overlay MT Base.unsafe_convert(::Type{String}, x::String) = x

@overlay MT function Base.copy(src::Array{T, N}) where {T, N}
    dest = similar(src)
    @ccall _jl_array_copy(src::Array{T,N}, dest::Array{T,N}, length(src)::Int32)::Cvoid
    return dest
end
# @overlay MT Base._unsafe_copyto!(dest::Array{U, 1}, doffs::Integer, src::Array{T, 1}, soffs::Integer, n::Integer) where {T,U} =
#     @ccall _jl_array_copyto(dest::Array{U,1}, (doffs-1)::Int32, src::Array{T,1}, (soffs-1)::Int32, n::Int32)::Array{T,1}
@overlay MT function Base._unsafe_copyto!(dest::Array, doffs::Integer, src::Array, soffs::Integer, n::Integer) 
    @inbounds for i in 1:n
        dest[i+doffs-1] = src[i+soffs-1]
    end
    return dest
end
@overlay MT Base._copyto_impl!(dest::Array{T, 1}, doffs::Integer, src::Array{T, 1}, soffs::Integer, n::Integer) where {T} =
    @ccall _jl_array_copyto(dest::Array{T,1}, (doffs-1)::Int32, src::Array{T,1}, (soffs-1)::Int32, n::Int32)::Array{T,1}

# @overlay MT Base.size(x::Vector) = length(x)

@overlay MT Base.string(x...) = JS._string(x...)

@overlay MT Base.getindex(::Type{Any}, @nospecialize vals...) = unrolledgetindex(vals)

using Unrolled

@unroll function unrolledgetindex(vals)
    a = Vector{Any}(undef, length(vals))
    @unroll for i = 1:length(vals)
        a[i] = vals[i]
    end
    return a
end

# @overlay MT Base.hash(x::String) = @jscall("\$hash-string", UInt64, Tuple{String}, x)

@overlay MT Base.CoreLogging.current_logger_for_env(x...) = nothing

@overlay MT Base.display(x) = JS.console_log(x)

# Avoid some memcpy's or memcmp's
@overlay MT function fill!(a::Union{Array{UInt8}, Array{Int8}}, x::Integer)
    val = x isa eltype(a) ? x : convert(eltype(a), x)
    for i in eachindex(a)
        a[i] = val
    end
    return nothing
end

@overlay MT function Base.:(==)(a::Arr, b::Arr) where {Arr <: Base.BitIntegerArray}
    length(a) !== length(b) && return false
    for i in eachindex(a)
        if a[i] != b[i]
            return false
        end
    end
    return true
end

# @overlay MT Base.:(==)(s1::String, s2::String) = Bool(@jscall("\$string-eq", Int32, Tuple{String, String}, s1, s2))

# @overlay MT Base.:(==)(s1::String, s2::String) = unsafe_wrap(Vector{UInt8}, s1) == unsafe_wrap(Vector{UInt8}, s2)

@overlay MT function Base.:(==)(a::String, b::String)
    wa = unsafe_wrap(Vector{UInt8}, a)
    wb = unsafe_wrap(Vector{UInt8}, b)
    length(wa) !== length(wb) && return false
    for i in eachindex(wa)
        if wa[i] != wb[i]
            return false
        end
    end
    return true
end


# Make this match the version for AbstractArrays (removes a pointer access)
@overlay MT @inline Base.dataids(A::Array) = (UInt(objectid(A)),)

# I'm not sure this works:
@overlay MT @inline Base.FastMath.mul_float_fast(a, b) = a * b
@overlay MT @inline Base.FastMath.div_float_fast(a, b) = a / b
@overlay MT @inline Base.FastMath.add_float_fast(a, b) = a + b

#### Error handling
struct DummyException <: Exception
end
@overlay MT @inline Base.error(err) = throw(DummyException())

# @overlay MT @inline Base.error(err) = JS.console_log(err)
# @overlay MT @inline Base.throw(err) = JS.console_log(err)
@overlay MT @inline Base.DomainError(str) = str
@overlay MT @inline Base.InexactError(str...) = str
@overlay MT @inline Base.ArgumentError(str) = str
@overlay MT @inline Base.OverflowError(str) = str
@overlay MT @inline Base.AssertionError(str) = str
@overlay MT @inline Base.DimensionMismatch(str) = str

# math.jl
@overlay MT @inline Base.Math.throw_complex_domainerror(f::Symbol, x) =
    @print_and_throw "This operation requires a complex input to return a complex result"
@overlay MT @inline Base.Math.throw_exp_domainerror(f::Symbol, x) =
    @print_and_throw "Exponentiation yielding a complex result requires a complex argument"

# intfuncs.jl
@overlay MT @inline Base.throw_domerr_powbysq(::Any, p) =
    @print_and_throw "Cannot raise an integer to a negative power"
@overlay MT @inline Base.throw_domerr_powbysq(::Integer, p) =
    @print_and_throw "Cannot raise an integer to a negative power"
@overlay MT @inline Base.throw_domerr_powbysq(::AbstractMatrix, p) =
    @print_and_throw "Cannot raise an integer to a negative power"
@overlay MT @inline Base.__throw_gcd_overflow(a, b) =
    @print_and_throw "gcd overflow"

# checked.jl
@overlay MT @inline Base.Checked.throw_overflowerr_binaryop(op, x, y) =
    @print_and_throw "Binary operation overflowed"
@overlay MT @inline Base.Checked.throw_overflowerr_negation(op, x, y) =
    @print_and_throw "Negation overflowed"
@overlay MT function Base.Checked.checked_abs(x::Base.Checked.SignedInt)
    r = ifelse(x < 0, -x, x)
    r < 0 && @print_and_throw("checked arithmetic: cannot compute |x|")
    r
end

# boot.jl
@overlay MT @inline Core.throw_inexacterror(f::Symbol, ::Type{T}, val) where {T} =
    @print_and_throw "Inexact conversion"

# abstractarray.jl
@overlay MT @inline Base.throw_boundserror(A, I) =
    @print_and_throw "Out-of-bounds array access"

# trig.jl
@overlay MT @inline Base.Math.sincos_domain_error(x) =
    @print_and_throw "sincos(x) is only defined for finite x."

@overlay MT @inline Base.throw_eachindex_mismatch_indices(x...) =
    @print_and_throw "all inputs to eachindex must have the same indices."
