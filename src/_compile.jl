
function _compile(ctx::CompilerContext, x::Core.Argument; kw...)
    if callablestruct(ctx) && x.n == 1 && ctx.toplevel
        getglobal(ctx, ctx.gfun)
    end
    if ctx.ci.slottypes[x.n] isa Core.Const 
        type = typeof(ctx.ci.slottypes[x.n].val)
    else
        type = ctx.ci.slottypes[x.n]
    end
    # If at the top level or if it's not a callable struct, 
    # we don't include the fun as the first argument.
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
# _compile(ctx::CompilerContext, x::String; globals = false, kw...) = globals ?
#     BinaryenStringConst(ctx.mod, x) :
#     getglobal(ctx, x, compiledval = BinaryenStringConst(ctx.mod, x))
# _compile(ctx::CompilerContext, x::Symbol; globals = false, kw...) = globals ?
#     BinaryenStringConst(ctx.mod, x) :
#     getglobal(ctx, x, compiledval = BinaryenStringConst(ctx.mod, x))
_compile(ctx::CompilerContext, x::String; globals = false, kw...) =
    _compile(ctx, unsafe_wrap(Vector{UInt8}, x))
_compile(ctx::CompilerContext, x::Symbol; globals = false, kw...) =
    _compile(ctx, unsafe_wrap(Vector{UInt8}, string(x)))

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
    return _compile(ctx, hash(x))     # TODO: what am I doing here?
    type = BinaryenTypeGetHeapType(gettype(ctx, roottype(ctx, x)))
    nargs = nfields(x)
    args = [_compile(ctx, getfield(x, i)) for i in 1:nargs]
    return BinaryenStructNew(ctx.mod, args, nargs, type)
end

function _compile(ctx::CompilerContext, x::Type)
    _compile(ctx, Int32(-99))
    # _compile(ctx, nothing)
end

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
    
    if haskey(ctx.globals, x)
        return ctx.globals[x]
    end
    if haskey(ctx.objects, x)
        ox = ctx.objects[x]
        if ox == Nothing  # indicates a circular reference
            return default(x)
        end
        return ox
    end
    ctx.objects[x] = nothing
    # TODO: fix this; problem is, I can't remember what's broken
    elT = eltype(roottype(ctx, T))
    buffertype = BinaryenTypeGetHeapType(gettype(ctx, Buffer{elT}))
    _f(i) = isassigned(x, i) ? x[i] : default(elT)
    if globals
        values = [elT in basictypes ? 
                  _compile(ctx, _f(i)) : 
                  getglobal(ctx, _f(i)) for i in eachindex(x)]
    else
        values = [_compile(ctx, _f(i)) for i in eachindex(x)]
    end
    buffer = BinaryenArrayNewFixed(ctx.mod, buffertype, values, length(x))
    wrappertype = BinaryenTypeGetHeapType(gettype(ctx, FakeArrayWrapper{elT}))
    result = BinaryenStructNew(ctx.mod, [buffer, _compile(ctx, Int32(length(x)))], 2, wrappertype)
    ctx.objects[x] = result
    return result
end

# general tuples
function _compile(ctx::CompilerContext, x::T; globals = false, kw...) where T <: Tuple
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

# general version for structs
function _compile(ctx::CompilerContext, x::T; globals = false, kw...) where T
    if haskey(ctx.globals, x)
        return ctx.globals[x]
    end
    if ismutabletype(T) && haskey(ctx.objects, x)
    # if haskey(ctx.objects, x)
        ox = ctx.objects[x]
        # @show typeof(ox)
        # if ox === nothing  # indicates a circular reference
        #     @show ctx.objects
        #     show(stdout, MIME"text/plain"(), ctx.objects)
        #     @show x typeof(ox)
        #     return _compile(ctx, default(x))
        # end
        return ox
    end
    ctx.objects[x] = nothing
    type = BinaryenTypeGetHeapType(gettype(ctx, T))
    if globals
        args = [fieldtype(T, field) in basictypes ? 
                _compile(ctx, getfield(x, field)) : 
                # maybeboxfield(x, field) : 
                getglobal(ctx, getfield(x, field)) for field in fieldskept(T)]
    else
        args = [_compile(ctx, getfield(x, field)) for field in fieldskept(T)]
    end
    result = BinaryenStructNew(ctx.mod, args, length(args), type)
    if ismutabletype(T)
        ctx.objects[x] = result
    end
    return result
end
function maybeboxfield(x, field)
    val = getfield(x, field)
    ftype = fieldtype(typeof(x), field)
    if typeof(val) == ftype
        return _compile(ctx, val)
    else
        return BinaryenRefCast(ctx.mod, _compile(ctx, Box{ftype}(val)))
    end
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

