
function _compile(ctx::CompilerContext, x::Core.Argument)
    BinaryenLocalGet(ctx.mod, x.n - 2,
                     gettype(ctx, ctx.ci.slottypes[x.n]))
end
function _compile(ctx::CompilerContext, x::Core.SSAValue)   # These come after the function arguments.
    BinaryenLocalGet(ctx.mod, ctx.varmap[x.id],
                     gettype(ctx, ssatype(ctx, x.id)))
    # localid = ctx.varmap[x.id]
    # BinaryenLocalGet(ctx.mod, localid, ctx.locals[localid])
end
_compile(ctx::CompilerContext, x::Float64) = BinaryenConst(ctx.mod, BinaryenLiteralFloat64(x))
_compile(ctx::CompilerContext, x::Float32) = BinaryenConst(ctx.mod, BinaryenLiteralFloat32(x))
_compile(ctx::CompilerContext, x::Int64) = BinaryenConst(ctx.mod, BinaryenLiteralInt64(x))
_compile(ctx::CompilerContext, x::Int32) = BinaryenConst(ctx.mod, BinaryenLiteralInt32(x))
_compile(ctx::CompilerContext, x::UInt8) = BinaryenConst(ctx.mod, BinaryenLiteralInt32(x))
_compile(ctx::CompilerContext, x::Int8) = BinaryenConst(ctx.mod, BinaryenLiteralInt32(x))
_compile(ctx::CompilerContext, x::UInt64) = BinaryenConst(ctx.mod, BinaryenLiteralInt64(reinterpret(Int64, x)))
_compile(ctx::CompilerContext, x::UInt32) = BinaryenConst(ctx.mod, BinaryenLiteralInt32(reinterpret(Int32, x)))
_compile(ctx::CompilerContext, x::Bool) = BinaryenConst(ctx.mod, BinaryenLiteralInt32(x))
_compile(ctx::CompilerContext, x::Ptr{BinaryenExpression}) = x
_compile(ctx::CompilerContext, x::String) = getglobal(ctx, x, compiledval = BinaryenStringConst(ctx.mod, x))
_compile(ctx::CompilerContext, x::GlobalRef) = getglobal(ctx, x.mod, x.name)
_compile(ctx::CompilerContext, x::QuoteNode) = _compile(ctx, x.value)
_compile(ctx::CompilerContext, x::Symbol) = getglobal(ctx, x, compiledval = BinaryenStringConst(ctx.mod, x))

function _compile(ctx::CompilerContext, x::NTuple{N,T}) where {N,T}
    arraytype = BinaryenTypeGetHeapType(gettype(ctx, typeof(x)))
    values = [_compile(ctx, v) for v in x]
    return BinaryenArrayNewFixed(ctx.mod, arraytype, values, N)
end
function _compile(ctx::CompilerContext, x::Val)
    return _compile(ctx, hash(x))
    type = BinaryenTypeGetHeapType(gettype(ctx, typeof(x)))
    nargs = nfields(x)
    args = [_compile(ctx, getfield(x, i)) for i in 1:nargs]
    return BinaryenStructNew(ctx.mod, args, nargs, type)
end

_compile(ctx::CompilerContext, x::Type) = BinaryenConst(ctx.mod, BinaryenLiteralInt32(-99))

struct Pass{T}
    val::T
end
_compile(ctx::CompilerContext, x::Pass) = x.val
struct I32{T}
    val::T
end
function _compile(ctx::CompilerContext, x::I32)
    res = _compile(ctx, x.val)
    if sizeof(Int) == 8 # wrap in an 
        res = BinaryenUnary(ctx.mod, BinaryenWrapInt64(), res)
    end
    return res
end


function _compile(ctx::CompilerContext, x::T) where T <: Array 
    # TODO: fix this
    elT = eltype(roottype(ctx, T))
    buffertype = BinaryenTypeGetHeapType(gettype(ctx, Buffer{elT}))
    values = [_compile(ctx, v) for v in x]
    buffer = BinaryenArrayNewFixed(ctx.mod, buffertype, values, length(x))
    wrappertype = BinaryenTypeGetHeapType(gettype(ctx, FakeArrayWrapper{elT}))
    return BinaryenStructNew(ctx.mod, [buffer, _compile(ctx, Int32(length(x)))], 2, wrappertype)
end

function _compile(ctx::CompilerContext, x::T) where T <: Tuple # general tuples
    type = BinaryenTypeGetHeapType(gettype(ctx, T))
    args = [_compile(ctx, x[i]) for i in 1:length(x)]
    return BinaryenStructNew(ctx.mod, args, length(args), type)
end

function _compile(ctx::CompilerContext, x::T) where T # general version for structs
    type = BinaryenTypeGetHeapType(gettype(ctx, T))
    args = [_compile(ctx, getfield(x, field)) for field in fieldnames(T)]
    return BinaryenStructNew(ctx.mod, args, length(args), type)
end

# function _compileglobal(ctx::CompilerContext, x::T) where T <: Array 
#     _compile(ctx, x)
# end

# function _compileglobal(ctx::CompilerContext, x::T) where T
#     type = BinaryenTypeGetHeapType(gettype(ctx, T))
#     args = [fieldtype(T, field) in basictypes ? 
#             _compile(ctx, getfield(x, field)) : 
#             _compileglobal(ctx, getfield(x, field)) for field in fieldnames(T)]
#     return BinaryenStructNew(ctx.mod, args, length(args), type)
# end

