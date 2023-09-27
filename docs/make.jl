push!(LOAD_PATH,"../src/")
using Documenter
using WebAssemblyCompiler

if haskey(ENV, "GITHUB_ACTIONS")
    ENV["JULIA_DEBUG"] = "Documenter"
end

deployconfig = Documenter.auto_detect_deploy_system()
Documenter.post_status(deployconfig; type="pending", repo="github.com/tshort/WebAssemblyCompiler.jl.git")
using Literate

Literate.markdown("../examples/basics/basics.jl", "src/examples", credit = false, execute = true)
# Literate.markdown("../examples/lorentz/lorentz.jl", "src/examples", credit = false, execute = true)

makedocs(
    sitename = "WebAssemblyCompiler",
    # modules = [WebAssemblyCompiler],
    format = Documenter.HTML(
        assets = ["assets/custom.css", "assets/favicon.ico"],
        prettyurls = true, # haskey(ENV, "GITHUB_ACTIONS"),
        canonical = "https://fredrikekre.github.io/Literate.jl/v2",
    ),
    pages = Any[
        "index.md",
        "Examples" => Any[
           "examples/basics.md",
           "examples/lorentz.md",
        ],
        "api.md"])

# Documenter can also automatically deploy documentation to gh-pages.
# See "Hosting Documentation" and deploydocs() in the Documenter manual
# for more information.
#=deploydocs(
    repo = "<repository url>"
)=#
