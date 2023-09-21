
export compile
# compile(fun, tt; filepath = "foo.wasm", validate = false, optimize = false) = compile(((fun, tt...),); filepath, validate, optimize)

function compile(funs::Tuple...; filepath = "foo.wasm", jspath = filepath * ".js", validate = false, optimize = false, experimental = true)
    cis = Core.CodeInfo[]
    dummyci = code_typed(() -> nothing, Tuple{})[1].first
    ctx = CompilerContext(dummyci; experimental)
    # BinaryenModuleSetFeatures(ctx.mod, BinaryenFeatureReferenceTypes() | BinaryenFeatureGC() | BinaryenFeatureStrings())
    BinaryenModuleSetFeatures(ctx.mod, BinaryenFeatureAll())
    # Create CodeInfo's, and fill in names first
    for funtpl in funs
        tt = length(funtpl) > 1 ? Base.to_tuple_type(funtpl[2:end]) : Tuple{}
        # isconcretetype(tt) || error("input type signature $tt for $(funtpl[1]) is not concrete")
        ci = code_typed(funtpl[1], tt, interp = StaticInterpreter())[1].first
        push!(cis, ci)
        name = string(funtpl[1])
        sig = ci.parent.specTypes
        ctx.sigs[name] = sig
        ctx.names[sig] = name
    end
    # Compile funs
    for ci in cis
        _DEBUG_ && @show ci
        compile_method(CompilerContext(ctx, ci), exported = true)
    end
    # _DEBUG_ && BinaryenModulePrint(ctx.mod)
    # _DEBUG_ && BinaryenModulePrintStackIR(ctx.mod, false)
    validate && BinaryenModuleValidate(ctx.mod)
    optimize && BinaryenModuleOptimize(ctx.mod)

    out = BinaryenModuleAllocateAndWrite(ctx.mod, C_NULL)
    write(filepath, unsafe_wrap(Vector{UInt8}, Ptr{UInt8}(out.binary), (out.binaryBytes,)))
    Libc.free(out.binary)
    out = BinaryenModuleAllocateAndWriteText(ctx.mod)
    write(filepath * ".wat", unsafe_string(out))
    Libc.free(out)
    BinaryenModuleDispose(ctx.mod)
    jstext = "var jsexports = { js: {} };\n"
    jstext *= join(["jsexports['js']['$v'] = $v;" for (_,v) in ctx.imports], "\n")
    write(jspath, jstext)
end

function compile_method(ctx::CompilerContext; sig = ctx.ci.parent.specTypes, exported = false)
    funname = ctx.names[sig]
    jparams = [gettype(ctx, T) for T in collect(sig.parameters)[argsused(ctx)]]
    bparams = BinaryenTypeCreate(jparams, length(jparams))
    results = gettype(ctx, ctx.ci.rettype)
    body = compile_method_body(ctx)
    BinaryenAddFunction(ctx.mod, funname, bparams, results, ctx.locals, length(ctx.locals), body)
    if exported
        BinaryenAddFunctionExport(ctx.mod, funname, funname)
    end
    return nothing
end

import Core.Compiler: block_for_inst, compute_basic_blocks

function compile_method_body(ctx::CompilerContext)
    ci = ctx.ci
    code = ci.code
    ctx.localidx += nargs(ci)
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
    rblocks = [RelooperAddBlock(relooper, compile_block(ctx, cfg, phis, idx)) for idx in eachindex(cfg.blocks)]
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
    RelooperRenderAndDispose(relooper, rblocks[1], 0)
end

