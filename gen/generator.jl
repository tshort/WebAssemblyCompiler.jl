using Clang.Generators
using Binaryen_jll  # replace this with your jll package

cd(@__DIR__)

include_dir = normpath(Binaryen_jll.artifact_dir, "include")

options = load_options(joinpath(@__DIR__, "generator.toml"))

# add compiler flags, e.g. "-DXXXXXXXXX"
args = get_default_args()  # Note you must call this function firstly and then append your own flags
push!(args, "-I$include_dir")
push!(args, "-fparse-all-comments")

headers = [joinpath(include_dir, "binaryen-c.h")]

# create context
ctx = create_context(headers, args, options)

# run generator
build!(ctx)