# API

## Main API

```@docs
compile
```


## JavaScript interoperability


```@docs
@jscall
Externref
```


```@autodocs
Modules = [WebAssemblyCompiler.JS]
Order   = [:function, :macro, :type]
```

## Overlays

## MixTape support



## Binaryen utilities

Binaryen binary utilities from [Binaryen_jll](https://github.com/JuliaBinaryWrappers/Binaryen_jll.jl) 
such as `wasm-dis` are available in `WebAssemblyCompiler.Bin`.

This is not official API in terms of semver. 
Each release of WebAssemblyCompiler targets a specific version of Binaryen. 
There are no compatibility guarantees between versions of Binaryen. 
These are unlikely to change, though.

## LibBinaryen

The C interface to Binaryen is provided through `WebAssemblyCompiler.LibBinaryen`. 

This is not official API in terms of semver. 
Each release of WebAssemblyCompiler targets a specific version of Binaryen. 
There are no compatibility guarantees between versions of Binaryen.

