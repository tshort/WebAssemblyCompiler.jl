
wtypes() = Dict{Any, BinaryenType}(
    Int64 => BinaryenTypeInt64(),
    Int32 => BinaryenTypeInt32(),
    UInt64 => BinaryenTypeInt64(),
    UInt32 => BinaryenTypeInt32(),
    UInt8 => BinaryenTypeInt32(),
    Bool  => BinaryenTypeInt32(),
    Float64 => BinaryenTypeFloat64(),
    Float32 => BinaryenTypeFloat32(),
    Symbol => BinaryenTypeInt64(),
    String => BinaryenTypeStringref(),
    Core.TypeofBottom => BinaryenTypeNone(),
    Union{} => BinaryenTypeNone(),
    Nothing => BinaryenTypeNone(),
)

const basictypes = [Int64, Int32, UInt64, UInt32, UInt8, Bool , Float64, Float32]

mutable struct CompilerContext
    ## module-level context
    mod::BinaryenModuleRef
    names::Dict{DataType, String}  # function signature to name
    sigs::Dict{String, DataType}   # name to function signature
    imports::Dict{String, Any}
    wtypes::Dict{Any, BinaryenType}
    globals::Dict{UInt, Any}    
    ## function-level context
    ci::Core.CodeInfo
    body::Vector{BinaryenExpressionRef}
    locals::Vector{BinaryenType}
    localidx::Int
    varmap::Dict{Int, Int}
end

CompilerContext(ci::Core.CodeInfo) = 
    CompilerContext(BinaryenModuleCreate(), Dict{DataType, String}(), Dict{String, DataType}(), Dict{String, DataType}(), wtypes(), Dict{String, Any}(),
                    ci, BinaryenExpressionRef[], BinaryenType[], 0, Dict{Int,Int}())
CompilerContext(ctx::CompilerContext, ci::Core.CodeInfo) = 
    CompilerContext(ctx.mod, ctx.names, ctx.sigs, ctx.imports, ctx.wtypes, ctx.globals,
                    ci, BinaryenExpressionRef[], BinaryenType[], 0, Dict{Int,Int}())

