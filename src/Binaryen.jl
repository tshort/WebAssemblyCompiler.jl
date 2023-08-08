module Binaryen

using Binaryen_jll

include("../lib/LibBinaryen.jl")
using .LibBinaryen

include("julia-compiler.jl")

end
