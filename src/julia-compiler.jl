
export compile

mutable struct CompilerContext
    ## module-level context
    mod::BinaryenModuleRef
    names::Dict{DataType, String}  # function signature to name
    sigs::Dict{String, DataType}   # name to function signature
    imports::Dict{String, DataType}
    ## function-level context
    ci::Core.CodeInfo
    body::Vector{BinaryenExpressionRef}
    locals::Vector{BinaryenType}
    localidx::Int
    varmap::Dict{Int, Int}
end

CompilerContext(ci::Core.CodeInfo) = 
    CompilerContext(BinaryenModuleCreate(), Dict{DataType, String}(), Dict{String, DataType}(), Dict{String, DataType}(), 
                    ci, BinaryenExpressionRef[], BinaryenType[], 0, Dict{Int,Int}())
CompilerContext(ctx::CompilerContext, ci::Core.CodeInfo) = 
    CompilerContext(ctx.mod, ctx.names, ctx.sigs, ctx.imports, 
                    ci, BinaryenExpressionRef[], BinaryenType[], 0, Dict{Int,Int}())

importedfun() = nothing

compile(fun, tt; filepath = "foo.wasm") = compile(((fun, tt...),); filepath)

function compile(funs; filepath = "foo.wasm")
    cis = Core.CodeInfo[]
    dummyci = code_typed(() -> nothing, Tuple{})[1].first
    ctx = CompilerContext(dummyci)
    # Create CodeInfo's, and fill in names first
    for funtpl in funs
        tt = length(funtpl) > 1 ? Base.to_tuple_type(funtpl[2:end]) : Tuple{}
        isconcretetype(tt) || error("input type signature $tt for $(funtpl[1]) is not concrete")
        ci = code_typed(funtpl[1], tt)[1].first
        push!(cis, ci)
        name = string(funtpl[1])
        sig = ci.parent.specTypes
        ctx.sigs[name] = sig
        ctx.names[sig] = name
    end
    # Compile funs
    for ci in cis
        _compile(CompilerContext(ctx, ci), exported = true)
    end
    # BinaryenModulePrint(ctx.mod)
    @debug BinaryenModulePrint(ctx.mod)
    out = BinaryenModuleAllocateAndWrite(ctx.mod, C_NULL)
    write(filepath, unsafe_wrap(Vector{UInt8}, Ptr{UInt8}(out.binary), (out.binaryBytes,)))
    Libc.free(out.binary)
    BinaryenModuleDispose(ctx.mod)
end

import Core.Compiler: block_for_inst, compute_basic_blocks

function _compile(ctx::CompilerContext; exported = false)
    ci = ctx.ci
    code = ci.code
    
    sig = ci.parent.specTypes
    jparams = binaryen_type.([sig.parameters...][2:end])
    ctx.localidx = length(jparams)
    bparams = BinaryenTypeCreate(jparams, length(jparams))
    results = binaryen_type(ci.rettype)
    funname = ctx.names[sig]
    cfg = Core.Compiler.compute_basic_blocks(code)
    relooper = RelooperCreate(ctx.mod)

    # Find and collect phis
    phis = Dict{Int32, Any}()
    for (idx, block) in enumerate(cfg.blocks)
        for stmt in block.stmts
            node = code[stmt]
            !isa(node, Core.PhiNode) && break
            for (i, edge) in enumerate(node.edges)
                blocknum = block_for_inst(cfg, Int(edge))
                if !haskey(phis, blocknum)
                    phis[blocknum] = Pair{Int64, Any}[]
                end
                push!(phis[blocknum], stmt => node.values[i])
            end
            ctx.varmap[stmt] = ctx.localidx
            push!(ctx.locals, binaryen_type(ctx.ci.ssavaluetypes[stmt]))
            ctx.localidx += 1
        end
    end
    # Create blocks
    rblocks = [RelooperAddBlock(relooper, _compile(ctx, cfg, phis, idx)) for idx in eachindex(cfg.blocks)]
    # Create branches
    for (idx, block) in enumerate(cfg.blocks)
        terminator = code[last(block.stmts)]
        if isa(terminator, Core.ReturnNode)
            # return never has any successors, so no branches needed
        elseif isa(terminator, Core.GotoNode)
            toblock = block_for_inst(cfg, terminator.label)
            RelooperAddBranch(rblocks[idx], rblocks[toblock], C_NULL, C_NULL)
        elseif isa(terminator, Core.GotoIfNot)
            toblock = block_for_inst(cfg, terminator.dest)
            RelooperAddBranch(rblocks[idx], rblocks[idx + 1], _compile(ctx, terminator.cond), C_NULL)
            RelooperAddBranch(rblocks[idx], rblocks[toblock], C_NULL, C_NULL)
        elseif idx < length(cfg.blocks)
            RelooperAddBranch(rblocks[idx], rblocks[idx + 1], C_NULL, C_NULL)
        end
    end
    body = RelooperRenderAndDispose(relooper, rblocks[1], 0)
    BinaryenAddFunction(ctx.mod, funname, bparams, results, ctx.locals, length(ctx.locals), body)
    if exported
        BinaryenAddFunctionExport(ctx.mod, funname, funname)
    end
    return nothing
end

for T in (:Int32, :Int64, :Float32, :Float64)
    BT = Symbol(:BinaryenType, T)
    @eval binaryen_type(::Type{$T}) = $BT()
end
binaryen_type(::Type{Bool}) = BinaryenTypeInt32()

function update!(ctx::CompilerContext, x, localtype = nothing)
    push!(ctx.body, x)
    if localtype != nothing
        push!(ctx.locals, binaryen_type(localtype))
        ctx.localidx += 1
    end
    return nothing
end

function _compile(ctx::CompilerContext, cfg::Core.Compiler.CFG, phis, idx)
    idxs = cfg.blocks[idx].stmts
    ci = ctx.ci
    ctx.body = BinaryenExpressionRef[]
    function _binaryfun(ctx, idx, bfuns, a, b)
        ctx.varmap[idx] = ctx.localidx
        x = BinaryenLocalSet(ctx.mod, ctx.localidx,
                             BinaryenBinary(ctx.mod,
                                            sizeof(roottype(ctx, a)) < 8 && length(bfuns) > 1 ? bfuns[2]() : bfuns[1](),
                                            _compile(ctx, a),
                                            _compile(ctx, b)))
        update!(ctx, x, ctx.ci.ssavaluetypes[idx])
    end
    function _unaryfun(ctx, idx, bfuns, a)
        ctx.varmap[idx] = ctx.localidx
        x = BinaryenLocalSet(ctx.mod, ctx.localidx,
                             BinaryenUnary(ctx.mod,
                                           sizeof(roottype(ctx, a)) < 8 && length(bfuns) > 1 ? bfuns[2]() : bfuns[1](),
                                           _compile(ctx, a)))
        update!(ctx, x, ctx.ci.ssavaluetypes[idx])
    end
    function _fun(ctx, idx, bfun, args...)
        ctx.varmap[idx] = ctx.localidx
        x = bfun(ctx.mod, (_compile(ctx, a) for a in args)...)
        update!(ctx, x, ctx.ci.ssavaluetypes[idx])
    end
    for idx in idxs
        node = ci.code[idx]
        if node isa Union{Core.GotoNode, Core.GotoIfNot, Core.PhiNode, Nothing}
            # do nothing

        elseif node == Core.ReturnNode()
            update!(ctx, BinaryenUnreachable(ctx.mod))

        elseif node isa Core.ReturnNode
            update!(ctx, BinaryenReturn(ctx.mod, _compile(ctx, node.val)))

        ## Intrinsics ##

        elseif matchgr(node, :neg_int) do a
                _binaryfun(ctx, idx, (BinaryenSubInt64, BinaryenSubInt32), 0, a)
            end

        elseif matchgr(node, :neg_float) do a
                _unaryfun(ctx, idx, (BinaryenNegInt64, BinaryenNegInt32), a)
            end

        elseif matchgr(node, :add_int) do a, b
                _binaryfun(ctx, idx, (BinaryenAddInt64, BinaryenAddInt32), a, b)
            end

        elseif matchgr(node, :sub_int) do a, b
                _binaryfun(ctx, idx, (BinaryenSubInt64, BinaryenSubInt32), a, b)
            end

        elseif matchgr(node, :mul_int) do a, b
                _binaryfun(ctx, idx, (BinaryenMulInt64, BinaryenMulInt32), a, b)
            end

        elseif matchgr(node, :sdiv_int) do a, b
                _binaryfun(ctx, idx, (BinaryenDivS64, BinaryenDivS32), a, b)
            end

        elseif matchgr(node, :udiv_int) do a, b
                _binaryfun(ctx, idx, (BinaryenDivU64, BinaryenDivU32), a, b)
            end

        elseif matchgr(node, :srem_int) do a, b
                _binaryfun(ctx, idx, (BinaryenRemS64, BinaryenRemS32), a, b)
            end

        elseif matchgr(node, :urem_int) do a, b
                _binaryfun(ctx, idx, (BinaryenRemU64, BinaryenRemU32), a, b)
            end

        elseif matchgr(node, :add_float) do a, b
                _binaryfun(ctx, idx, (BinaryenAddFloat64, BinaryenAddFloat32), a, b)
            end

        elseif matchgr(node, :sub_float) do a, b
                _binaryfun(ctx, idx, (BinaryenSubFloat64, BinaryenSubFloat32), a, b)
            end

        elseif matchgr(node, :mul_float) do a, b
                _binaryfun(ctx, idx, (BinaryenMulFloat64, BinaryenMulFloat32), a, b)
            end

        elseif matchgr(node, :div_float) do a, b
                _binaryfun(ctx, idx, (BinaryenDivFloat64, BinaryenDivFloat32), a, b)
            end

        elseif matchgr(node, :eq_int) do a, b
                _binaryfun(ctx, idx, (BinaryenEqInt64, BinaryenEqInt32), a, b)
            end

        elseif matchgr(node, :ne_int) do a, b
                _binaryfun(ctx, idx, (BinaryenNeInt64, BinaryenNeInt32), a, b)
            end

        elseif matchgr(node, :slt_int) do a, b
                _binaryfun(ctx, idx, (BinaryenLtSInt64, BinaryenLtSInt32), a, b)
            end

        elseif matchgr(node, :ult_int) do a, b
                _binaryfun(ctx, idx, (BinaryenLtUInt64, BinaryenLtUInt32), a, b)
            end

        elseif matchgr(node, :sle_int) do a, b
                _binaryfun(ctx, idx, (BinaryenLeSInt64, BinaryenLeSInt32), a, b)
            end

        elseif matchgr(node, :ule_int) do a, b
                _binaryfun(ctx, idx, (BinaryenLeUInt64, BinaryenLeUInt32), a, b)
            end

        elseif matchgr(node, :eq_float) do a, b
                _binaryfun(ctx, idx, (BinaryenEqFloat64, BinaryenEqFloat32), a, b)
            end

        elseif matchgr(node, :ne_float) do a, b
                _binaryfun(ctx, idx, (BinaryenNeFloat64, BinaryenNeFloat32), a, b)
            end

        elseif matchgr(node, :lt_float) do a, b
                _binaryfun(ctx, idx, (BinaryenLtFloat64, BinaryenLtFloat32), a, b)
            end

        elseif matchgr(node, :le_float) do a, b
                _binaryfun(ctx, idx, (BinaryenLeFloat64, BinaryenLeFloat32), a, b)
            end

        elseif matchgr(node, :and_int) do a, b
                _binaryfun(ctx, idx, (BinaryenAndInt64, BinaryenAndInt32), a, b)
            end

        elseif matchgr(node, :or_int) do a, b
                _binaryfun(ctx, idx, (BinaryenOrInt64, BinaryenOrInt32), a, b)
            end

        elseif matchgr(node, :xor_int) do a, b
                _binaryfun(ctx, idx, (BinaryenXorInt64, BinaryenXorInt32), a, b)
            end

        elseif matchgr(node, :not_int) do a, b
                _binaryfun(ctx, idx, (BinaryenNotInt64, BinaryenNotInt32), a, b)
            end

        elseif matchgr(node, :shl_int) do a, b
                _binaryfun(ctx, idx, (BinaryenShlInt64, BinaryenShlInt32), a, b)
            end

        elseif matchgr(node, :lshr_int) do a, b
                _binaryfun(ctx, idx, (BinaryenShrUInt64, BinaryenShrUInt32), a, b)
            end

        elseif matchgr(node, :ashr_int) do a, b
                _binaryfun(ctx, idx, (BinaryenShrSInt64, BinaryenShrSInt32), a, b)
            end

        elseif matchgr(node, :ctpop_int) do a, b
                _binaryfun(ctx, idx, (BinaryenPopcntInt64, BinaryenPopcntInt32), a, b)
            end

        elseif matchgr(node, :ctpop_int) do a, b
                _binaryfun(ctx, idx, (BinaryenPopcntInt64, BinaryenPopcntInt32), a, b)
            end

        # elseif matchgr(f node:ctlz_int) do a, b
        #         _binaryfun(ctx, idx, (BinaryenClzInt64, BinaryenClzInt32), a, b)
        # end

        # elseifmatchgr(f node:cttz_int) do a, b
        #         _binaryfun(ctx, idx, (BinaryenCtzInt64, BinaryenCtzInt32), a, b)
        # end

        ## I'm not sure these are right
        elseif matchgr(node, :sext_int) do a, b
                t = (roottype(ctx, a), roottype(ctx, b))
                t == (Int64, Int16) ? _unaryfun(ctx, idx, (BinaryenExtendS16Int64,), b) :
                t == (Int64, Int32) ? _unaryfun(ctx, idx, (BinaryenExtendSInt32,), b) :
                t == (Int32, Int8)  ? _unaryfun(ctx, idx, (BinaryenExtendS8Int32,), b) :
                t == (Int32, Int16) ? _unaryfun(ctx, idx, (BinaryenExtendS16Int32,), b) :
                error("Unsupported `sext_int` types")
            end

        elseif matchgr(node, :zext_int) do a, b
                t = (roottype(ctx, a), roottype(ctx, b))
                t == (Int64, Int16) ? _unaryfun(ctx, idx, (BinaryenExtendU16Int64,), b) :
                t == (Int64, Int32) ? _unaryfun(ctx, idx, (BinaryenExtendUInt64,), b) :
                t == (Int32, Int8)  ? _unaryfun(ctx, idx, (BinaryenExtendU8Int32,), b) :
                t == (Int32, Int16) ? _unaryfun(ctx, idx, (BinaryenExtendU16Int32,), b) :
                error("Unsupported `zext_int` types")
            end

        elseif matchgr(node, :fptoui) do a, b
                t = (roottype(ctx, a), roottype(ctx, b))
                t == (UInt64, Float32) ? _unaryfun(ctx, idx, (BinaryenTruncSatUFloat32ToInt64,), b) :
                t == (UInt64, Float64) ? _unaryfun(ctx, idx, (BinaryenTruncSatUFloat64ToInt64,), b) :
                t == (UInt32, Float32) ? _unaryfun(ctx, idx, (BinaryenTruncSatUFloat32ToInt32,), b) :
                t == (UInt32, Float64) ? _unaryfun(ctx, idx, (BinaryenTruncSatUFloat64ToInt32,), b) :
                error("Unsupported `fptoui` types")
            end

        elseif matchgr(node, :fptosi) do a, b
                t = (roottype(ctx, a), roottype(ctx, b))
                t == (Int64, Float32) ? _unaryfun(ctx, idx, (BinaryenTruncSatSFloat32ToInt64,), b) :
                t == (Int64, Float64) ? _unaryfun(ctx, idx, (BinaryenTruncSatSFloat64ToInt64,), b) :
                t == (Int32, Float32) ? _unaryfun(ctx, idx, (BinaryenTruncSatSFloat32ToInt32,), b) :
                t == (Int32, Float64) ? _unaryfun(ctx, idx, (BinaryenTruncSatSFloat64ToInt32,), b) :
                error("Unsupported `fptosi` types")
            end

        elseif matchgr(node, :uitofp) do a, b
                t = (roottype(ctx, a), roottype(ctx, b))
                t == (Float64, UInt32) ? _unaryfun(ctx, idx, (BinaryenConvertUInt32ToFloat64,), b) :
                t == (Float64, UInt64) ? _unaryfun(ctx, idx, (BinaryenConvertUInt64ToFloat64,), b) :
                t == (Float32, UInt32) ? _unaryfun(ctx, idx, (BinaryenConvertUInt32ToFloat32,), b) :
                t == (Float32, UInt64) ? _unaryfun(ctx, idx, (BinaryenConvertUInt64ToFloat32,), b) :
                error("Unsupported `uitofp` types")
            end

        elseif matchgr(node, :sitofp) do a, b
                t = (roottype(ctx, a), roottype(ctx, b))
                t == (Float64, Int32) ? _unaryfun(ctx, idx, (BinaryenConvertSInt32ToFloat64,), b) :
                t == (Float64, Int64) ? _unaryfun(ctx, idx, (BinaryenConvertSInt64ToFloat64,), b) :
                t == (Float32, Int32) ? _unaryfun(ctx, idx, (BinaryenConvertSInt32ToFloat32,), b) :
                t == (Float32, Int64) ? _unaryfun(ctx, idx, (BinaryenConvertSInt64ToFloat32,), b) :
                error("Unsupported `sitofp` types")
            end

        elseif matchgr(node, :fptrunc) do a, b
                t = (roottype(ctx, a), roottype(ctx, b))
                t == (Float32, Float64) ? _unaryfun(ctx, idx, (BinaryenTruncFloat32,), b) :
                error("Unsupported `fptrunc` types")
            end

        elseif matchgr(node, :fpext) do a, b
                t = (roottype(ctx, a), roottype(ctx, b))
                t == (Float64, Float32) ? _unaryfun(ctx, idx, (BinaryenPromoteFloat32,), b) :
                error("Unsupported `fpext` types")
            end

        elseif matchgr(node, :ifelse) do cond, a, b
                _fun(BinaryenIf, idx, cond, a, b)
            end



        ## TODO
        # ADD_I(trunc_int, 2) \
        # ADD_I(add_ptr, 2) \
        # ADD_I(sub_ptr, 2) \
        # ADD_I(fpiseq, 2) \
        # ADD_I(bswap_int, 1) \
        # /*  functions */ \
        # ADD_I(abs_float, 1) \
        # ADD_I(copysign_float, 2) \
        # ADD_I(flipsign_int, 2) \
        # ADD_I(ceil_llvm, 1) \
        # ADD_I(floor_llvm, 1) \
        # ADD_I(trunc_llvm, 1) \
        # ADD_I(rint_llvm, 1) \
        # ADD_I(sqrt_llvm, 1) \
        # ADD_I(sqrt_llvm_fast, 1) \
        # /*  pointer access */ \
        # ADD_I(pointerref, 3) \
        # ADD_I(pointerset, 4) \
        # /*  pointer atomics */ \
        # ADD_I(atomic_fence, 1) \
        # ADD_I(atomic_pointerref, 2) \
        # ADD_I(atomic_pointerset, 3) \
        # ADD_I(atomic_pointerswap, 3) \
        # ADD_I(atomic_pointermodify, 4) \
        # ADD_I(atomic_pointerreplace, 5) \
        # /*  c interface */ \
        # ADD_I(cglobal, 2) \
        # ALIAS(llvmcall, llvmcall) \
        # /*  object access */ \
        # ADD_I(arraylen, 1) \
        # /*  cpu feature tests */ \
        # ADD_I(have_fma, 1) \

        ## Builtins / key functions ##

        elseif matchgr(node, :arrayref) do bool, arr, i
                T = roottype(arr)
                unsigned = T <: Unsigned
                _fun(BinaryenArrayGet, idx, arr, i, _compile(ctx, T), !unsigned)
            end

        elseif matchgr(node, :arrayset) do bool, arr, val, i
                _fun(BinaryenArraySet, idx, arr, i, val)
            end

        elseif matchgr(node, :arraylen) do arr
                _fun(BinaryenArrayLen, idx, arr)
            end

        # elseif  matchgr(node, :arraysize) do arr
        #             end

        elseif matchforeigncall(node, :jl_alloc_array_1d) do args
                type = eltype(args[2])
                size = args[7]
                init = C_NULL
                _fun(BinaryenArrayNew, type, size, init)
            end

        elseif node isa Expr && node.head == :foreigncall    # general foreigncalls that need to be imported
            modname = "ext"
            extname = args[1].value
            name = modname * "." * extname
            nargs = length(args[3]) - 1
            sig = args[7:(7 + nargs - 1)]
            args = _compile.(ctx, sig)
            rettype = _compile(ctx, args[2])
            BinaryenCall(ctx.mod, name, args, nargs, rettype)
            if !haskey(ctx.imports, name)
                BinaryenAddFunctionImport(ctx.mod, name, modname, extname, args, rettype)
                ctx.imports[name] = sig
            elseif ctx.imports[name] != sig
                error("Mismatch in foreigncall import for $name: $sig vs. $(ctx.imports[name]).")
            end


        # DECLARE_BUILTIN(applicable);
        # DECLARE_BUILTIN(_apply_iterate);
        # DECLARE_BUILTIN(_apply_pure);
        # DECLARE_BUILTIN(apply_type);
        # DECLARE_BUILTIN(arrayref);
        # DECLARE_BUILTIN(arrayset);
        # DECLARE_BUILTIN(arraysize);
        # DECLARE_BUILTIN(_call_in_world);
        # DECLARE_BUILTIN(_call_in_world_total);
        # DECLARE_BUILTIN(_call_latest);
        # DECLARE_BUILTIN(replacefield);
        # DECLARE_BUILTIN(const_arrayref);
        # DECLARE_BUILTIN(_expr);
        # DECLARE_BUILTIN(fieldtype);
        # DECLARE_BUILTIN(getfield);
        # DECLARE_BUILTIN(invoke);
        # DECLARE_BUILTIN(is);
        # DECLARE_BUILTIN(isa);
        # DECLARE_BUILTIN(isdefined);
        # DECLARE_BUILTIN(issubtype);
        # DECLARE_BUILTIN(modifyfield);
        # DECLARE_BUILTIN(nfields);
        # DECLARE_BUILTIN(setfield);
        # DECLARE_BUILTIN(sizeof);
        # DECLARE_BUILTIN(svec);
        # DECLARE_BUILTIN(swapfield);
        # DECLARE_BUILTIN(throw);
        # DECLARE_BUILTIN(tuple);
        # DECLARE_BUILTIN(typeassert);
        # DECLARE_BUILTIN(_typebody);
        # DECLARE_BUILTIN(typeof);
        # DECLARE_BUILTIN(_typevar);
        # DECLARE_BUILTIN(donotdelete);
        # DECLARE_BUILTIN(compilerbarrier);
        # DECLARE_BUILTIN(getglobal);
        # DECLARE_BUILTIN(setglobal);
        # DECLARE_BUILTIN(finalizer);
        # DECLARE_BUILTIN(_compute_sparams);
        # DECLARE_BUILTIN(_svec_ref);

        ## Other ##

        else
            error("Unsupported Julia construct $node")
        end
    end
    if haskey(phis, idx)
        for (i, var) in phis[idx]
            push!(ctx.body, BinaryenLocalSet(ctx.mod, ctx.varmap[i], _compile(ctx, var)))
        end
    end
    body = BinaryenBlock(ctx.mod, "body", ctx.body, length(ctx.body), BinaryenTypeAuto())
    return body
end


function _compile(ctx::CompilerContext, x::Core.Argument)
    BinaryenLocalGet(ctx.mod, x.n - 2,
                     binaryen_type(ctx.ci.parent.specTypes.parameters[x.n]))
end
function _compile(ctx::CompilerContext, x::Core.SSAValue)   # These come after the function arguments.
    BinaryenLocalGet(ctx.mod, ctx.varmap[x.id],
                     binaryen_type(ctx.ci.ssavaluetypes[x.id]))
end
_compile(ctx::CompilerContext, x::Float64) = BinaryenConst(ctx.mod, BinaryenLiteralFloat64(x))
_compile(ctx::CompilerContext, x::Float32) = BinaryenConst(ctx.mod, BinaryenLiteralFloat32(x))
_compile(ctx::CompilerContext, x::Int64) = BinaryenConst(ctx.mod, BinaryenLiteralInt64(x))
_compile(ctx::CompilerContext, x::Int32) = BinaryenConst(ctx.mod, BinaryenLiteralInt32(x))
_compile(ctx::CompilerContext, x::Bool) = BinaryenConst(ctx.mod, BinaryenLiteralInt32(x))

roottype(ctx::CompilerContext, x) = typeof(x)
roottype(ctx::CompilerContext, x::Type{T}) where T = T
roottype(ctx::CompilerContext, x::GlobalRef) = roottype(ctx, eval(x))
roottype(ctx::CompilerContext, x::Core.Argument) = ctx.ci.parent.specTypes.parameters[x.n]
roottype(ctx::CompilerContext, x::Core.SSAValue) = ctx.ci.ssavaluetypes[x.id]

## Matching helpers

## Matches an expression starting with a GlobalRef given by `sym`.
## This is common for intrinsics.
function matchgr(fun, node, sym)
    match = node isa Expr && length(node.args) > 0 && node.args[1] isa GlobalRef && node.args[1].name == sym
    if match
        fargs = length(node.args) > 1 ? node.args[2:end] : []
        fun(fargs...)
    end
    return match
end

## Matches an expression starting with a foreigncall given by `sym`.
## This is common for intrinsics.
function matchforeigncall(fun, node, sym)
    match = node isa Expr && node.head == :foreigncall && node.args[1].value == sym
    if match
        fargs = length(node.args) > 1 ? node.args[2:end] : []
        fun(fargs)
    end
    return match
end
