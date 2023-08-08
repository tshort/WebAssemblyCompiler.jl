module Binaryen

using Binaryen_jll

include("../lib/LibBinaryen.jl")
using .LibBinaryen

module Bin
    using Reexport 
    @reexport using Binaryen_jll
end

include("julia-compiler.jl")

end
