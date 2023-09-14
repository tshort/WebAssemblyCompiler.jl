export JS

module JS
using ..WebAssemblyCompiler: WebAssemblyCompiler, Box

arraynew(n) = Base.llvmcall("arraynew", WebAssemblyCompiler.Externref, Tuple{Int32}, n)
## Use setindex! instead?? If so, need an ArrayRef type?
set(jsa::WebAssemblyCompiler.Externref, i::Integer, x::T) where T = Base.llvmcall("set", Nothing, Tuple{WebAssemblyCompiler.Externref, Int32, T}, jsa, Int32(i - 1), x)
set(jsa::WebAssemblyCompiler.Externref, str::String, x::T) where T = Base.llvmcall("set", Nothing, Tuple{WebAssemblyCompiler.Externref, String, T}, jsa, str, x)
get(jsa::WebAssemblyCompiler.Externref, i::Integer, ::Type{T}) where T = Base.llvmcall("get", T, Tuple{WebAssemblyCompiler.Externref, Int32}, jsa, Int32(i - 1))
get(jsa::WebAssemblyCompiler.Externref, str::String, ::Type{T}) where T = Base.llvmcall("get", T, Tuple{WebAssemblyCompiler.Externref, String}, jsa, str)

objectnew(n) = Base.llvmcall("objectnew", WebAssemblyCompiler.Externref, Tuple{Int32}, n)

console_log(x) = Base.llvmcall("console_log", Nothing, Tuple{WebAssemblyCompiler.Externref}, x)
console_log(x::String) = Base.llvmcall("console_log", Nothing, Tuple{String}, x)

getelementbyid(x) = Base.llvmcall("getelementbyid", WebAssemblyCompiler.Externref, Tuple{String}, x)
sethtml(ref::WebAssemblyCompiler.Externref, str) = Base.llvmcall("sethtml", Nothing, Tuple{WebAssemblyCompiler.Externref, String}, ref, str)
sethtml(id::String, str) = sethtml(getelementbyid(id), str)

eval(x::String) = Base.llvmcall("jseval", WebAssemblyCompiler.Externref, Tuple{String}, x)

array_to_string(x) = Base.llvmcall("array_to_string", String, Tuple{WebAssemblyCompiler.Externref}, x)

function tojs(v::Vector{Any})
    jsa = arraynew(Int32(length(v)))
    for (i, x) in enumerate(v)
        if x isa Box{Float64}
            set(jsa, i, x.x)
        elseif x isa Box{Int32}
            set(jsa, i, x.x)
        elseif x isa Box{String}
            set(jsa, i, x.x)
        elseif x isa Vector{Any}
            set(jsa, i, tojs(x))
        end
    end
    return jsa
end

end