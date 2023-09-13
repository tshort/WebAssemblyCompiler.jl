export JS

module JS
using ..WebAssemblyCompiler: WebAssemblyCompiler, Box

arraynew(n) = Base.llvmcall("jsarraynew", WebAssemblyCompiler.Externref, Tuple{Int32}, n)
## Use setindex! instead?? If so, need an ArrayRef type
arraysetf64(jsa, i, x) = Base.llvmcall("jsarraysetf64", Nothing, Tuple{WebAssemblyCompiler.Externref, Int32, Float64}, jsa, Int32(i - 1), x)
arrayseti32(jsa, i, x) = Base.llvmcall("jsarrayseti32", Nothing, Tuple{WebAssemblyCompiler.Externref, Int32, Int32}, jsa, Int32(i - 1), x)
arraysetstr(jsa, i, x) = Base.llvmcall("jsarraysetstr", Nothing, Tuple{WebAssemblyCompiler.Externref, Int32, String}, jsa, Int32(i - 1), x)

console_log(x) = Base.llvmcall("console_log", Nothing, Tuple{WebAssemblyCompiler.Externref}, x)
console_log(x::String) = Base.llvmcall("console_log_str", Nothing, Tuple{String}, x)

eval(x::String) = Base.llvmcall("jseval", WebAssemblyCompiler.Externref, Tuple{String}, x)

print_array_to_string(x) = Base.llvmcall("array_to_string", String, Tuple{WebAssemblyCompiler.Externref}, x)

function tojs(v::Vector{Any})
    jsa = arraynew(Int32(length(v)))
    for (i, x) in enumerate(v)
        if x isa Box{Float64}
            arraysetf64(jsa, i, x.x)
        elseif x isa Box{Int32}
            arrayseti32(jsa, i, x.x)
        elseif x isa Box{String}
            arraysetstr(jsa, i, x.x)
        end
    end
    return jsa
end

end