# API

## Main API

`compile` is the main method exported by WebAssemblyCompiler.

```@docs
compile
```

Debugging is often needed when trying to fix code to make it compile.

You can enable debugging output using:

    const WebAssemblyCompiler._DEBUG_ = true

Outputs include:
* Julia IR for each method compiled
* WebAssembly code generated for each statement

## JavaScript interoperability

WebAssemblyCompiler provides several utilities to ease interoperability with the browser.
The main way to call JavaScript methods is with `@jscall` (exported):

```@docs
@jscall
```

Objects on the JavaScript side are accessed using the `Externref` type (exported):

```@docs
Externref
```

The module `JS` provides several utility functions to help with browser interoperability.
The `JS` module is exported, but its methods are not.

```@autodocs
Modules = [WebAssemblyCompiler.JS]
Order   = [:function, :macro, :type]
```

## Overlays

It is common to need to swap out problematic parts of code when compiling to WebAssembly.
The compilation pipeline uses `Base.Experimental.@overlay` to methods to be redefined. 
Here is an example of redefining `Base.log10`:

```
using Base.Experimental: @overlay
@overlay WebAssemblyCompiler.MT Base.log10(x::Float64) = @jscall("(x) => Math.log10(x)", Float64, Tuple{Float64}, x)
```

`WebAssemblyCompiler.MT` is the MethodTable that is used during compilation.

Redefinitions built into WebAssemblyCompiler are defined in 
[quirks.jl](https://github.com/tshort/WebAssemblyCompiler.jl/blob/main/src/quirks.jl).
Many math functions are replaced by JavaScript versions.
Many error functions are also replaced.

## Mixtape support

Overlays are the most common way to manipulate code for compilation.
More advanced manipulation is possible with [Mixtape](https://github.com/JuliaCompilerPlugins/Mixtape.jl) support built in.

Mixtape support is considered experimental and not part of the official API.
This support has not been tested extensively.

Mixtape is enabled using the following methods and types (none are exported):

```@docs
WebAssemblyCompiler.CompilationContext 
WebAssemblyCompiler.allow 
WebAssemblyCompiler.transform 
```

## Binaryen utilities

Binaryen binary utilities from [Binaryen_jll](https://github.com/JuliaBinaryWrappers/Binaryen_jll.jl) 
such as `wasm-dis` are available in `WebAssemblyCompiler.Bin`.

This is not official API in terms of semver. 
Each release of WebAssemblyCompiler targets a specific version of Binaryen. 
There are no compatibility guarantees between versions of Binaryen. 
These are unlikely to change though.

## LibBinaryen

The C interface to Binaryen is provided through `WebAssemblyCompiler.LibBinaryen`. 

This is not official API in terms of semver. 
Each release of WebAssemblyCompiler targets a specific version of Binaryen. 
There are no compatibility guarantees between versions of Binaryen.

