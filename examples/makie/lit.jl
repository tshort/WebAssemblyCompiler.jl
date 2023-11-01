using Literate 

include("../../docs/hideall.jl")

Literate.markdown(joinpath("makie.jl"), 
                  joinpath("."), credit = false, postprocess = hideall)

