push!(LOAD_PATH,"../src/")
using Documenter
using WebAssemblyCompiler

if haskey(ENV, "GITHUB_ACTIONS")
    ENV["JULIA_DEBUG"] = "Documenter"
end

deployconfig = Documenter.auto_detect_deploy_system()
Documenter.post_status(deployconfig; type="pending", repo="github.com/tshort/WebAssemblyCompiler.jl.git")
using Literate

# Hide example blocks with "#hideall". 
# Also, use "#hideon" and "#hideoff" to toggle hiding for the current document.
function hideall(input)
    lines = split(input, "\n")
    inexample = false
    shouldhide = false
    hideon = false
    for (i,s) in enumerate(lines)
        if occursin(r"^````@example", s)
            inexample = true
            continue
        end
        if inexample && occursin(r"\#hideall", s)
            shouldhide = true
        end
        if inexample && occursin(r"\#hideon", s)
            hideon = true
        end
        if inexample && occursin(r"\#hideoff", s)
            hideon = false
        end
        if occursin(r"^````", s) && !occursin("@", s)
            inexample = false
            shouldhide = false
            continue
        end
        if inexample && (hideon || shouldhide)
            lines[i] *= "   #hide"
        end
    end
    return join(lines, "\n")
end

Literate.markdown(joinpath(@__DIR__, "../examples/basics/basics.jl"), 
                  joinpath(@__DIR__, "src/examples"), credit = false, postprocess = hideall)
Literate.markdown(joinpath(@__DIR__, "../examples/lorenz/lorenz.jl"), 
                  joinpath(@__DIR__, "src/examples"), credit = false, postprocess = hideall)
# Literate.markdown(joinpath(@__DIR__, "../examples/observables/observables.jl"), 
#                   joinpath(@__DIR__, "src/examples"), credit = false, postprocess = hideall)

makedocs(
    sitename = "WebAssemblyCompiler",
    # modules = [WebAssemblyCompiler],
    repo = Remotes.GitHub("tshort", "WebAssemblyCompiler.jl"),
    remotes = nothing,
    # linkcheck = true,
    format = Documenter.HTML(
        assets = ["assets/custom.css", "assets/favicon.ico"],
        prettyurls = true, # haskey(ENV, "GITHUB_ACTIONS"),
        canonical = "https://tshort.github.io/WebAssemblyCompiler.jl/",
        # format = HTML(repolink = "https://github.com/tshort/WebAssemblyCompiler.jl"),
    ),
    pages = Any[
        "Introduction" => "index.md",
        "Examples" => Any[
           "JS interop"    => "examples/basics.md",
           "Lorenz model" => "examples/lorenz.md",
        #    "Observables" => "examples/observables.md",
        ],
        "api.md",
        "notes.md"
    ])

deploydocs(
    repo = "github.com/tshort/WebAssemblyCompiler.jl",
    target = "build",
    branch = "gh-pages",
    devbranch = "main", 
    versions = ["stable" => "v^", "v#.#" ],
)