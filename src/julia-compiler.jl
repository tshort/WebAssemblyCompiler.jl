include("types.jl")
include("mixtape.jl")
include("interpreter.jl")
include("_compile.jl")
include("utils.jl")
include("quirks.jl")

export compile
compile(fun, tt; filepath = "foo.wasm") = compile(((fun, tt...),); filepath)

function compile(funs; filepath = "foo.wasm", validate = false, optimize = false)
    cis = Core.CodeInfo[]
    dummyci = code_typed(() -> nothing, Tuple{})[1].first
    ctx = CompilerContext(dummyci)
    BinaryenModuleSetFeatures(ctx.mod, BinaryenFeatureReferenceTypes() | BinaryenFeatureGC() | BinaryenFeatureStrings())
    # Create CodeInfo's, and fill in names first
    for funtpl in funs
        tt = length(funtpl) > 1 ? Base.to_tuple_type(funtpl[2:end]) : Tuple{}
        isconcretetype(tt) || error("input type signature $tt for $(funtpl[1]) is not concrete")
        ci = code_typed(funtpl[1], tt, interp = StaticInterpreter())[1].first
        # @show ci
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
    validate && BinaryenModuleValidate(ctx.mod)
    optimize && BinaryenModuleOptimize(ctx.mod)
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
    jparams = [gettype(ctx, T) for T in [sig.parameters...][2:end]]
    ctx.localidx = length(jparams)
    bparams = BinaryenTypeCreate(jparams, length(jparams))
    results = gettype(ctx, ci.rettype)
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
            push!(ctx.locals, gettype(ctx, ctx.ci.ssavaluetypes[stmt]))
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

