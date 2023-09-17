struct Externref end

struct Box{T}
    x::T
end

wtypes() = Dict{Any, BinaryenType}(
    Int64 => BinaryenTypeInt64(),
    Int32 => BinaryenTypeInt32(),
    UInt64 => BinaryenTypeInt64(),
    UInt32 => BinaryenTypeInt32(),
    UInt8 => BinaryenTypeInt32(),
    Bool  => BinaryenTypeInt32(),
    Float64 => BinaryenTypeFloat64(),
    Float32 => BinaryenTypeFloat32(),
    Symbol => BinaryenTypeStringref(),
    String => BinaryenTypeStringref(),
    Externref => BinaryenTypeExternref(),
    Any => BinaryenTypeEqref(),
    Core.TypeofBottom => BinaryenTypeNone(),
    Union{} => BinaryenTypeNone(),
    Nothing => BinaryenTypeNone(),
)

const basictypes = [Int64, Int32, UInt64, UInt32, UInt8, Bool, Float64, Float32]

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
    ## special context
    meta::Dict{Symbol, Any}
end

const experimentalwat = raw"""
(module

  (func $hash-string
    (param $s stringref) (result i32)
    (return (string.hash (local.get $s))))

  (func $string-eq
    (param $s1 stringref) (param $s2 stringref) (result i32)
    (return 
      (string.eq (local.get $s1) (local.get $s2))))
)
"""
# The approach above is nice, because WAT is easier to write than Binaryen code.
# But, the one above errors in NodeCall with the older version of V8. 
const wat = raw"""
(module
) 
"""

CompilerContext(ci::Core.CodeInfo; experimental = false) = 
    CompilerContext(BinaryenModuleParse(experimental ? experimentalwat : wat), Dict{DataType, String}(), Dict{String, DataType}(), Dict{String, Any}(), wtypes(), Dict{String, Any}(),
                    ci, BinaryenExpressionRef[], BinaryenType[], 0, Dict{Int, Int}(), Dict{Symbol, Any}())
CompilerContext(ctx::CompilerContext, ci::Core.CodeInfo) = 
    CompilerContext(ctx.mod, ctx.names, ctx.sigs, ctx.imports, ctx.wtypes, ctx.globals,
                    ci, BinaryenExpressionRef[], BinaryenType[], 0, Dict{Int, Int}(), Dict{Symbol, Any}())

