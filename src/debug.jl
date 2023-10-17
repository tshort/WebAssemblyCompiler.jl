# This is a kludge. Logging.jl caused a crash.
_DEBUG_::Bool = false

const DEBUG = Ref{Any}()
mutable struct DB
    def::Core.Method
    ci::Core.CodeInfo
    steps::Vector{Any}
    children::Vector{Any}
end
function _debug_ci(ctx, parent = nothing)
    db = DB(ctx.ci.parent.def, ctx.ci, Any[], Any[])
    ctx.meta[:debug] = db
    if parent === nothing
        DEBUG[] = db
    else
        push!(parent.meta[:debug].children, db)
    end
    nothing
end
function _debug_module(ctx)
    original_stdout = stdout
    (rd, wr) = redirect_stdout()
    BinaryenModulePrint(ctx.mod)
    Libc.flush_cstdio()
    redirect_stdout(original_stdout)
    close(wr)
    s = read(rd, String)
    push!(ctx.meta[:debug].steps, :module => s)
    nothing
end
function _debug_binaryen(ctx, x)
    original_stdout = stdout
    (rd, wr) = redirect_stdout()
    BinaryenExpressionPrint(x)
    Libc.flush_cstdio()
    close(wr)
    redirect_stdout(original_stdout)
    s = read(rd, String)
    push!(ctx.meta[:debug].steps, :wasm => s)
    nothing
end
function _debug_line(ctx, idx, node)
    push!(ctx.meta[:debug].steps, :idx => idx)
    push!(ctx.meta[:debug].steps, :ssavalue => ssatype(ctx, idx))
    push!(ctx.meta[:debug].steps, :node => node)
    nothing
end