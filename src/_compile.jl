
function _compile(ctx::CompilerContext, x::Core.Argument; kw...)
    if ctx.ci.slottypes[x.n] isa Core.Const 
        type = typeof(ctx.ci.slottypes[x.n].val)
    else
        type = ctx.ci.slottypes[x.n]
    end
    BinaryenLocalGet(ctx.mod, argmap(ctx, x.n) - 1,
                     gettype(ctx, type))
end
function _compile(ctx::CompilerContext, x::Core.SSAValue; kw...)   # These come after the function arguments.
    bt = basetype(ctx, x)
    if Base.issingletontype(bt)
        getglobal(ctx, _compile(ctx, nothing))
    else
        BinaryenLocalGet(ctx.mod, ctx.varmap[x.id],
                         gettype(ctx, ssatype(ctx, x.id)))
    end
    # localid = ctx.varmap[x.id]
    # BinaryenLocalGet(ctx.mod, localid, ctx.locals[localid])
end
_compile(ctx::CompilerContext, x::Float64; kw...) = BinaryenConst(ctx.mod, BinaryenLiteralFloat64(x))
_compile(ctx::CompilerContext, x::Float32; kw...) = BinaryenConst(ctx.mod, BinaryenLiteralFloat32(x))
_compile(ctx::CompilerContext, x::Int64; kw...) = BinaryenConst(ctx.mod, BinaryenLiteralInt64(x))
_compile(ctx::CompilerContext, x::Int32; kw...) = BinaryenConst(ctx.mod, BinaryenLiteralInt32(x))
_compile(ctx::CompilerContext, x::UInt8; kw...) = BinaryenConst(ctx.mod, BinaryenLiteralInt32(x))
_compile(ctx::CompilerContext, x::Int8; kw...) = BinaryenConst(ctx.mod, BinaryenLiteralInt32(x))
_compile(ctx::CompilerContext, x::UInt64; kw...) = BinaryenConst(ctx.mod, BinaryenLiteralInt64(reinterpret(Int64, x)))
_compile(ctx::CompilerContext, x::UInt32; kw...) = BinaryenConst(ctx.mod, BinaryenLiteralInt32(reinterpret(Int32, x)))
_compile(ctx::CompilerContext, x::Bool; kw...) = BinaryenConst(ctx.mod, BinaryenLiteralInt32(x))
_compile(ctx::CompilerContext, x::Ptr{BinaryenExpression}; kw...) = x
_compile(ctx::CompilerContext, x::GlobalRef; kw...) = getglobal(ctx, x.mod, x.name)
_compile(ctx::CompilerContext, x::QuoteNode; kw...) = _compile(ctx, x.value)
_compile(ctx::CompilerContext, x::String; globals = false, kw...) = globals ?
    BinaryenStringConst(ctx.mod, x) :
    getglobal(ctx, x, compiledval = BinaryenStringConst(ctx.mod, x))
_compile(ctx::CompilerContext, x::Symbol; globals = false, kw...) = globals ?
    BinaryenStringConst(ctx.mod, x) :
    getglobal(ctx, x, compiledval = BinaryenStringConst(ctx.mod, x))

function _compile(ctx::CompilerContext, x::Tuple{}; kw...)
    arraytype = BinaryenTypeGetHeapType(gettype(ctx, Tuple{}))
    values = []
    return BinaryenArrayNewFixed(ctx.mod, arraytype, values, 0)
end

function _compile(ctx::CompilerContext, x::NTuple{N,T}; globals = false, kw...) where {N,T}
    arraytype = BinaryenTypeGetHeapType(gettype(ctx, NTuple{N, roottype(ctx, x[1])}))
    if globals
        values = [T in basictypes ? 
                  _compile(ctx, v) : 
                  getglobal(ctx, v) for v in x]
    else
        values = [_compile(ctx, v) for v in x]
    end
    return BinaryenArrayNewFixed(ctx.mod, arraytype, values, N)
end
function _compile(ctx::CompilerContext, x::Val; kw...)
    return _compile(ctx, hash(x))
    type = BinaryenTypeGetHeapType(gettype(ctx, roottype(ctx, x)))
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
function _compile(ctx::CompilerContext, x::I32; kw...)
    res = _compile(ctx, x.val)
    if sizeof(Int) == 8 # wrap in an 
        res = BinaryenUnary(ctx.mod, BinaryenWrapInt64(), res)
    end
    return res
end


function _compile(ctx::CompilerContext, x::T; globals = false, kw...) where T <: Array 
    # TODO: fix this
    elT = eltype(roottype(ctx, T))
    buffertype = BinaryenTypeGetHeapType(gettype(ctx, Buffer{elT}))
    if globals
        values = [elT in basictypes ? 
                  _compile(ctx, v) : 
                  getglobal(ctx, v) for v in x]
    else
        values = [_compile(ctx, v) for v in x]
    end
    buffer = BinaryenArrayNewFixed(ctx.mod, buffertype, values, length(x))
    wrappertype = BinaryenTypeGetHeapType(gettype(ctx, FakeArrayWrapper{elT}))
    return BinaryenStructNew(ctx.mod, [buffer, _compile(ctx, Int32(length(x)))], 2, wrappertype)
end

function _compile(ctx::CompilerContext, x::T; globals = false, kw...) where T <: Tuple # general tuples
    TT = Tuple{(roottype(ctx, v) for v in x)...}
    type = BinaryenTypeGetHeapType(gettype(ctx, TT))
    if globals
        args = [roottype(ctx, x[i]) in basictypes ? 
                  _compile(ctx, x[i]) : 
                  getglobal(ctx, x[i]) for i in 1:length(x)]
    else
        args = [_compile(ctx, x[i]) for i in 1:length(x)]
    end
    return BinaryenStructNew(ctx.mod, args, length(args), type)
end

function _compile(ctx::CompilerContext, x::T; globals = false, kw...) where T # general version for structs
    type = BinaryenTypeGetHeapType(gettype(ctx, T))
    if globals
        args = [fieldtype(T, field) in basictypes ? 
                _compile(ctx, getfield(x, field)) : 
                getglobal(ctx, getfield(x, field)) for field in fieldnames(T)]
    else
        args = [_compile(ctx, getfield(x, field)) for field in fieldnames(T)]
    end
    return BinaryenStructNew(ctx.mod, args, length(args), type)
end

function _compile(ctx::CompilerContext, x::Expr; kw...)
    if x.head == :boundscheck
        return _compile(ctx, false)
    else
        return _compile(ctx, false)  # not sure what to put here...
    end
end

# function _compileglobal(ctx::CompilerContext, x::T; kw...) where T <: Array 
#     _compile(ctx, x)
# end

# function _compileglobal(ctx::CompilerContext, x::T; kw...) where T
#     type = BinaryenTypeGetHeapType(gettype(ctx, T))
#     args = [fieldtype(T, field) in basictypes ? 
#             _compile(ctx, getfield(x, field)) : 
#             _compileglobal(ctx, getfield(x, field)) for field in fieldnames(T)]
#     return BinaryenStructNew(ctx.mod, args, length(args), type)
# end

