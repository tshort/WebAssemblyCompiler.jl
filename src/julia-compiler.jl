using MacroTools

export compile

mutable struct CompilerContext
    mod::BinaryenModuleRef
    ci::Core.CodeInfo
    body::Vector{BinaryenExpressionRef}
    locals::Vector{BinaryenType}
    localidx::Int
    varmap::Dict{Int, Int}
    funs::Array{Any, 1}
end
CompilerContext(ci::Core.CodeInfo) = CompilerContext(BinaryenModuleCreate(), ci, BinaryenExpressionRef[], BinaryenType[], 0, Dict{Int,Int}(), Any[])

function compile(fun, tt; filepath = "foo.wasm")
    tt = Base.to_tuple_type(tt)
    isconcretetype(tt) || error("input type signature $tt is not concrete")
    ci = code_typed(fun, tt)[1].first
    compile(CompilerContext(ci); filepath)
end

import Core.Compiler: block_for_inst, compute_basic_blocks

function compile(ctx::CompilerContext; filepath = "foo.wasm")
    ci = ctx.ci
    code = ci.code
    jparams = binaryen_type.([ci.parent.specTypes.parameters...][2:end])
    ctx.localidx = length(jparams)
    bparams = BinaryenTypeCreate(jparams, length(jparams))
    results = binaryen_type(ci.rettype)
    funname = string(ci.parent.def.name)
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
    BinaryenAddFunctionExport(ctx.mod, funname, funname)
    # BinaryenModulePrint(ctx.mod)
    @debug BinaryenModulePrint(ctx.mod)
    out = BinaryenModuleAllocateAndWrite(ctx.mod, C_NULL)
    write(filepath, unsafe_wrap(Vector{UInt8}, Ptr{UInt8}(out.binary), (out.binaryBytes,)))
    Libc.free(out.binary)  
    BinaryenModuleDispose(ctx.mod)
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
                                            sizeof(roottype(ctx, a)) == 8 && length(bfuns) > 1 ? bfuns[1]() : bfuns[2](), 
                                            _compile(ctx, a), 
                                            _compile(ctx, b)))
        update!(ctx, x, ctx.ci.ssavaluetypes[idx])
    end
    for idx in idxs
        node = ci.code[idx]
        if node isa Union{Core.GotoNode, Core.GotoIfNot, Core.PhiNode, Nothing}
            # do nothing

        ## Intrinsics ##
        
       
        elseif @capture(node, $(GlobalRef(Base, :add_int))(a_, b_))
            _binaryfun(ctx, idx, (BinaryenAddInt64, BinaryenAddInt32), a, b)

        elseif @capture(node, $(GlobalRef(Base, :sub_int))(a_, b_))
            _binaryfun(ctx, idx, (BinaryenSubInt64, BinaryenSubInt32), a, b)

        elseif @capture(node, $(GlobalRef(Base, :mul_int))(a_, b_))
            _binaryfun(ctx, idx, (BinaryenMulInt64, BinaryenMulInt32), a, b)

        elseif @capture(node, $(GlobalRef(Base, :sdiv_int))(a_, b_))
            _binaryfun(ctx, idx, (BinaryenDivS64, BinaryenDivS32), a, b)

        elseif @capture(node, $(GlobalRef(Base, :udiv_int))(a_, b_))
            _binaryfun(ctx, idx, (BinaryenDivU64, BinaryenDivU32), a, b)

        elseif @capture(node, $(GlobalRef(Base, :srem_int))(a_, b_))
            _binaryfun(ctx, idx, (BinaryenRemS64, BinaryenRemS32), a, b)

        elseif @capture(node, $(GlobalRef(Base, :urem_int))(a_, b_))
            _binaryfun(ctx, idx, (BinaryenRemU64, BinaryenRemU32), a, b)

        elseif @capture(node, $(GlobalRef(Base, :add_float))(a_, b_))
            _binaryfun(ctx, idx, (BinaryenAddFloat64, BinaryenAddFloat32), a, b)

        elseif @capture(node, $(GlobalRef(Base, :sub_float))(a_, b_))
            _binaryfun(ctx, idx, (BinaryenSubFloat64, BinaryenSubFloat32), a, b)

        elseif @capture(node, $(GlobalRef(Base, :mul_float))(a_, b_))
            _binaryfun(ctx, idx, (BinaryenMulFloat64, BinaryenMulFloat32), a, b)

        elseif @capture(node, $(GlobalRef(Base, :div_float))(a_, b_))
            _binaryfun(ctx, idx, (BinaryenDivFloat64, BinaryenDivFloat32), a, b)

        elseif @capture(node, $(GlobalRef(Base, :eq_int))(a_, b_))
            _binaryfun(ctx, idx, (BinaryenEqInt64, BinaryenEqInt32), a, b)

        elseif @capture(node, $(GlobalRef(Base, :ne_int))(a_, b_))
            _binaryfun(ctx, idx, (BinaryenNeInt64, BinaryenNeInt32), a, b)

        elseif @capture(node, $(GlobalRef(Base, :slt_int))(a_, b_))
            _binaryfun(ctx, idx, (BinaryenLtSInt64, BinaryenLtSInt32), a, b)

        elseif @capture(node, $(GlobalRef(Base, :ult_int))(a_, b_))
            _binaryfun(ctx, idx, (BinaryenLtUInt64, BinaryenLtUInt32), a, b)

        elseif @capture(node, $(GlobalRef(Base, :sle_int))(a_, b_))
            _binaryfun(ctx, idx, (BinaryenLeSInt64, BinaryenLeSInt32), a, b)

        elseif @capture(node, $(GlobalRef(Base, :ule_int))(a_, b_))
            _binaryfun(ctx, idx, (BinaryenLeUInt64, BinaryenLeUInt32), a, b)

        elseif @capture(node, $(GlobalRef(Base, :eq_float))(a_, b_))
            _binaryfun(ctx, idx, (BinaryenEqFloat64, BinaryenEqFloat32), a, b)

        elseif @capture(node, $(GlobalRef(Base, :ne_float))(a_, b_))
            _binaryfun(ctx, idx, (BinaryenNeFloat64, BinaryenNeFloat32), a, b)

        elseif @capture(node, $(GlobalRef(Base, :lt_float))(a_, b_))
            _binaryfun(ctx, idx, (BinaryenLtFloat64, BinaryenLtFloat32), a, b)

        elseif @capture(node, $(GlobalRef(Base, :le_float))(a_, b_))
            _binaryfun(ctx, idx, (BinaryenLeFloat64, BinaryenLeFloat32), a, b)

        elseif @capture(node, $(GlobalRef(Base, :and_int))(a_, b_))
            _binaryfun(ctx, idx, (BinaryenAndInt64, BinaryenAndInt32), a, b)

        elseif @capture(node, $(GlobalRef(Base, :or_int))(a_, b_))
            _binaryfun(ctx, idx, (BinaryenOrInt64, BinaryenOrInt32), a, b)

        elseif @capture(node, $(GlobalRef(Base, :xor_int))(a_, b_))
            _binaryfun(ctx, idx, (BinaryenXorInt64, BinaryenXorInt32), a, b)

        elseif @capture(node, $(GlobalRef(Base, :not_int))(a_, b_))
            _binaryfun(ctx, idx, (BinaryenNotInt64, BinaryenNotInt32), a, b)

        elseif @capture(node, $(GlobalRef(Base, :shl_int))(a_, b_))
            _binaryfun(ctx, idx, (BinaryenShlInt64, BinaryenShlInt32), a, b)

        elseif @capture(node, $(GlobalRef(Base, :lshr_int))(a_, b_))
            _binaryfun(ctx, idx, (BinaryenShrUInt64, BinaryenShrUInt32), a, b)

        elseif @capture(node, $(GlobalRef(Base, :ashr_int))(a_, b_))
            _binaryfun(ctx, idx, (BinaryenShrSInt64, BinaryenShrSInt32), a, b)

        elseif @capture(node, $(GlobalRef(Base, :ctpop_int))(a_, b_))
            _binaryfun(ctx, idx, (BinaryenPopcntInt64, BinaryenPopcntInt32), a, b)

        elseif @capture(node, $(GlobalRef(Base, :ctpop_int))(a_, b_))
            _binaryfun(ctx, idx, (BinaryenPopcntInt64, BinaryenPopcntInt32), a, b)

        # elseif @capture(node, $(GlobalRef(Base, :ctlz_int))(a_, b_))
        #     _binaryfun(ctx, idx, (BinaryenClzInt64, BinaryenClzInt32), a, b)

        # elseif @capture(node, $(GlobalRef(Base, :cttz_int))(a_, b_))
        #     _binaryfun(ctx, idx, (BinaryenCtzInt64, BinaryenCtzInt32), a, b)

        # ADD_I(sext_int, 2) \
        # ADD_I(zext_int, 2) \
        # ADD_I(trunc_int, 2) \
        # ADD_I(fptoui, 2) \
        # ADD_I(fptosi, 2) \
        # ADD_I(uitofp, 2) \
        # ADD_I(sitofp, 2) \
        # ADD_I(fptrunc, 2) \
        # ADD_I(fpext, 2) \
    
        ## TODO
        # ADD_I(neg_int, 1) \
        # ADD_I(add_ptr, 2) \
        # ADD_I(sub_ptr, 2) \
        # ADD_I(neg_float, 1) \
        # ADD_I(fpiseq, 2) \
        # ADD_I(bswap_int, 1) \
        

        ## Other ##

        elseif node isa Core.ReturnNode
            x = BinaryenReturn(ctx.mod, _compile(ctx, node.val))
            update!(ctx, x)

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
roottype(ctx::CompilerContext, x::Core.Argument) = ctx.ci.parent.specTypes.parameters[x.n]
roottype(ctx::CompilerContext, x::Core.SSAValue) = ctx.ci.ssavaluetypes[x.id]
