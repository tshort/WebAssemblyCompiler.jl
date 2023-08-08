using MacroTools

export compile

struct CompilerContext
    mod::BinaryenModuleRef
    funs::Array{Any, 1}
end
CompilerContext() = CompilerContext(BinaryenModuleCreate(), Any[])

compile(fun, tt; filepath = "foo.wasm") = compile(CompilerContext(), fun, tt; filepath)

function compile(ctx::CompilerContext, fun, tt; filepath = "foo.wasm")
    tt = Base.to_tuple_type(tt)
    isconcretetype(tt) || error("input type signature $tt is not concrete")
    ci = code_typed(fun, tt)[1].first
    compile(ctx, ci; filepath)
end

import Core.Compiler: block_for_inst, compute_basic_blocks

# function compile(ctx::CompilerContext, ci::Core.CodeInfo)
#     relooper = RelooperCreate(ctx.mod)
#     code = ci.code
#     cfg = Core.Compiler.compute_basic_blocks(code)
#     # Find and collect phis
#     phis = Dict{Int32, Any}
#     for (idx, block) in enumerate(cfg.blocks)
#         for stmt in block.stmts
#             node = code[stmt]
#             !isa(op, PhiNode) && break
#             for (i, edge) in enumerate(op.edges)
#                 if !haskey(phis, edge)
#                     phis[edge] = Vector{Core.SSAValue}[]
#                 end
#                 push!(phis[edge], stmt => op.values[i])
#             end
#         end
#     end
#     # Create blocks
#     rblocks = [RelooperAddBlock(relooper, compile_exprs(ctx, code, block.stmts)) for block in cfg.blocks]
#     # Create branches
#     for (idx, block) in enumerate(cfg.blocks)
#         terminator = code[last(block.stmts)]
#         phicodes = haskey(phis, idx) ? phiinstructions(ctx, phis[idx]) : 0
#         if isa(terminator, ReturnNode)
#             # return never has any successors, so no branches needed
#         elseif isa(terminator, GotoNode)
#             toblock = block_for_inst(basic_block_index, terminator.label)
#             RelooperAddBranch(rblocks[idx], rblocks[toblock], 0, phicodes)
#         elseif isa(terminator, GotoIfNot)
#             toblock = block_for_inst(basic_block_index, terminator.label)
#             cond = compile_exprs(ctx, terminator.cond)
#             RelooperAddBranch(rblocks[idx], rblocks[toblock], cond, phicodes)
#             RelooperAddBranch(rblocks[idx], rblocks[idx + 1], 0, phicodes)
#         elseif idx < length(cfg.blocks)
#             RelooperAddBranch(rblocks[idx], rblocks[idx + 1], 0, phicodes)
#         end
#     end
#     body = RelooperRenderAndDispose(relooper, rblocks[1], 0)
#     funname = addname!(ctx, ci)
#     BinaryenAddFunction(ctx.mod, funname, params, results, localtypes, nlocals, body)
#     return ctx.mod
# end

function compile(ctx::CompilerContext, ci::Core.CodeInfo; filepath = "foo.wasm")
    code = ci.code
    jparams = binaryen_type.([ci.parent.specTypes.parameters...][2:end])
    bparams = BinaryenTypeCreate(jparams, length(jparams))
    results = binaryen_type(ci.rettype)
    funname = string(ci.parent.def.name)
    body, localtypes = _compile(ctx, ci, jparams)
    BinaryenAddFunction(ctx.mod, funname, bparams, results, localtypes, length(localtypes), body)
    BinaryenAddFunctionExport(ctx.mod, funname, funname)
    BinaryenModulePrint(ctx.mod)
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
mutable struct CompileResult
    body::Vector{BinaryenExpressionRef}
    locals::Vector{BinaryenType}
    localidx::Int
end
CompileResult(n) = CompileResult(BinaryenExpressionRef[], BinaryenType[], n)

function update!(res::CompileResult, x, localtype = nothing)
    push!(res.body, x)
    if localtype != nothing 
        push!(res.locals, binaryen_type(localtype))
        res.localidx += 1
    end
    return nothing
end

function _compile(ctx::CompilerContext, ci::Core.CodeInfo, params, idxs = eachindex(ci.code))
    res = CompileResult(length(params))
    for idx in idxs
        stmt = ci.code[idx]
        if @capture(stmt, $(GlobalRef(Base, :add_float))(a_, b_))
            rettype = ci.ssavaluetypes[idx]
            x = BinaryenLocalSet(ctx.mod, res.localidx, 
                                 BinaryenBinary(ctx.mod, 
                                                rettype == Float64 ? BinaryenAddFloat64() : BinaryenAddFloat32(), 
                                                _compile(ctx, ci, a), 
                                                _compile(ctx, ci, b)))
            update!(res, x, rettype)
        elseif @capture(stmt, $(GlobalRef(Base, :add_int))(a_, b_))
            rettype = ci.ssavaluetypes[idx]
            x = BinaryenLocalSet(ctx.mod, res.localidx, 
                                 BinaryenBinary(ctx.mod, 
                                                rettype == Int64 ? BinaryenAddInt64() : BinaryenAddInt32(), 
                                                _compile(ctx, ci, a), 
                                                _compile(ctx, ci, b)))
            update!(res, x, rettype)
        end
        if stmt isa Core.ReturnNode
            @show res.locals
            x = BinaryenReturn(ctx.mod, _compile(ctx, ci, stmt.val))
            update!(res, x)
        end
    end    
    body = BinaryenBlock(ctx.mod, "body", res.body, length(res.body), BinaryenTypeAuto())
    return body, res.locals
end


function _compile(ctx::CompilerContext, ci::Core.CodeInfo, x::Core.Argument)
    @show x.n
    BinaryenLocalGet(ctx.mod, x.n - 2, 
                     binaryen_type(ci.parent.specTypes.parameters[x.n]))
end
function _compile(ctx::CompilerContext, ci::Core.CodeInfo, x::Core.SSAValue)   # These come after the function arguments.
    @show x.id
    BinaryenLocalGet(ctx.mod, x.id + length(ci.parent.specTypes.parameters) - 2, 
                     binaryen_type(ci.ssavaluetypes[x.id]))
end
_compile(ctx::CompilerContext, ci::Core.CodeInfo, x::Float64) = BinaryenConst(ctx.mod, BinaryenLiteralFloat64(x))
