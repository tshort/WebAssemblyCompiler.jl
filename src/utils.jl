specialtype(x) = nothing
specialtype(::Type{T}) where T <: Val = BinaryenTypeInt64()

function ssatype(ctx::CompilerContext, idx)
    ctx.ci.ssavaluetypes[idx]
end


roottype(ctx::CompilerContext, x) = typeof(x)
roottype(ctx::CompilerContext, x::Type{T}) where T = T
roottype(ctx::CompilerContext, x::GlobalRef) = roottype(ctx, eval(x))
roottype(ctx::CompilerContext, x::Core.Argument) = ctx.ci.parent.specTypes.parameters[x.n]
roottype(ctx::CompilerContext, x::Core.SSAValue) = ctx.ci.ssavaluetypes[x.id]

## Matching helpers

## Matches an expression starting with a GlobalRef given by `sym`.
## This is common for intrinsics.
function matchgr(fun, node, sym; combinedargs = false)
    match = node isa Expr && length(node.args) > 0 && 
            ((node.args[1] isa GlobalRef && node.args[1].name == sym) ||
             (node.args[1] isa Core.IntrinsicFunction && nameof(node.args[1]) == sym))
    if match
        if !combinedargs && length(methods(fun)[1].sig.parameters) != length(node.args)
            return false
        end
        fargs = length(node.args) > 1 ? node.args[2:end] : []
        if combinedargs
            fun(fargs)
        else
            fun(fargs...)
        end
    end
    return match
end

## Matches an expression starting with a foreigncall given by `sym`.
## This is common for intrinsics.
function matchforeigncall(fun, node, sym)
    match = node isa Expr && node.head == :foreigncall && node.args[1] isa QuoteNode && node.args[1].value == sym
    if match
        fargs = length(node.args) > 1 ? node.args[2:end] : []
        fun(fargs)
    end
    return match
end


# Other utilities

getfun(x::Core.MethodInstance) = getfun(x.def)
getfun(x::Method) = getfield(x.module, basename(x))
basename(f::Function) = Base.function_name(f)
basename(f::Core.IntrinsicFunction) = Symbol(unsafe_string(ccall(:jl_intrinsic_name, Cstring, (Core.IntrinsicFunction,), f)))
basename(x::GlobalRef) = x.name
basename(m::Core.MethodInstance) = basename(m.def)
basename(m::Method) = m.name == :Type ? m.sig.parameters[1].parameters[1].name.name : m.name

function gettype(ctx, type)
    if haskey(ctx.wtypes, type)
        return ctx.wtypes[type]
    end
    if specialtype(type) !== nothing
        return specialtype(type)
    end
    if type <: Array
        @show type
        wrappertype = gettype(ctx, FakeArrayWrapper{eltype(type)})
        ctx.wtypes[type] = wrappertype
        return wrappertype
    end
    @show type
    @show ctx.wtypes
    # exit()
    tb = TypeBuilderCreate(1)
    builtheaptypes = Array{BinaryenHeapType}(undef, 1)
    if type <: Buffer || type <: NTuple
        elt = eltype(type)
        TypeBuilderSetArrayType(tb, 0, gettype(ctx, elt), sizeof(elt) == 1 ? BinaryenPackedTypeInt8() : BinaryenPackedTypeNotPacked(), type <: Buffer)
    else  # Structs
        fieldtypes = [gettype(ctx, T) for T in Base.datatype_fieldtypes(type)]
        n = length(fieldtypes)
        fieldpackedtypes = fill(BinaryenPackedTypeNotPacked(), n)
        fieldmutables = fill(ismutabletype(type), n)
        TypeBuilderSetStructType(tb, 0, fieldtypes, fieldpackedtypes, fieldmutables, n)
    end
    TypeBuilderBuildAndDispose(tb, builtheaptypes, C_NULL, C_NULL)
    newtype = BinaryenTypeFromHeapType(builtheaptypes[1], true)
    ctx.wtypes[type] = newtype
    return newtype
end

function getglobal(ctx, gval; compiledval = nothing)
    id = objectid(gval)
    if haskey(ctx.globals, id)
        return ctx.globals[id]
    end
    T = typeof(gval)
    wtype = gettype(ctx, T)
    name = string("g", id)
    BinaryenAddGlobal(ctx.mod, 
                      name, 
                      wtype, 
                    #   ismutable(gval), 
                      false, 
                      isnothing(compiledval) ? _compile(ctx, gval) : compiledval)
                    #   isnothing(compiledval) ? _compileglobal(ctx, gval) : compiledval)
    gv = BinaryenGlobalGet(ctx.mod, name, wtype)
    # BinaryenExpressionPrint(gv)
    ctx.globals[id] = gv
    return gv
end
getglobal(ctx, mod, name; compiledval = nothing) = getglobal(ctx, mod.eval(name); compiledval)
hasglobal(ctx, gval) = haskey(ctx.globals, objectid(gval))
hasglobal(ctx, mod, name) = hasglobal(ctx, mod.eval(name))


function compile_inline(ctx::CompilerContext, idx, fun, tt, args, meta = nothing)
    tt = Base.to_tuple_type(tt)
    ci = code_typed(fun, tt, interp = StaticInterpreter())[1].first
    @show ci
    meta = meta !== Nothing ? Dict{Symbol, Any}(meta => 1) : Dict{Symbol, Any}()
    meta[:inlining] = ctx.localidx    # this is the local variable used in place of the return
    ctx.localidx += 1
    newctx = CompilerContext(ctx.mod, ctx.names, ctx.sigs, ctx.imports, ctx.wtypes, ctx.globals,
                             ci, ctx.body, ctx.locals, ctx.localidx, ctx.varmap, meta)
    # TODO: how to wire in input args?
    for (i, a) in enumerate(args)
        setlocal!(newctx, idx + i - 1, _compile(newctx, a))
    end
    return compile_method_body(newctx)
end

