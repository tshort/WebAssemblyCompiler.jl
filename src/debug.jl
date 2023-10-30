# This is a kludge. Logging.jl caused a crash.
const _DEBUG_::Set{Symbol} = Set{Symbol}()
# options are:
# :inline - show stuff inline in the REPL
# :offline - store stuff in WebAssemblyCompiler.DEBUG
debug(x) = x in _DEBUG_
setdebug(x) = push!(_DEBUG_, x)
unsetdebug(x) = delete!(_DEBUG_, x)
 
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
function _debug_binaryen_get(ctx, x)
    original_stdout = stdout
    (rd, wr) = redirect_stdout()
    BinaryenExpressionPrint(x)
    Libc.flush_cstdio()
    close(wr)
    redirect_stdout(original_stdout)
    return read(rd, String)
end
