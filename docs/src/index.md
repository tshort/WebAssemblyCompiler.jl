### Compile Julia code to WebAssembly

This package uses [Binaryen](https://github.com/WebAssembly/binaryen/) to compile Julia's IR to WebAssembly.

!!! warning "Experimental and in progress"
    This code is experimental. Expect to find errors or failures when compiling Julia code.

    This uses not-yet-final features of WebAssembly. 
    A bleeding-edge browser is needed. 
    As of now, only Chrome dev version 119 or higher works.
    In Chrome's chrome://flags/, the following flags need to be enabled:
    * Experimental WebAssembly 
    * WebAssembly Garbage Collection
    * WebAssembly Stringref

WebAssemblyCompiler supports many Julia constructs, including:

* Vector{T} where T is a bitstype and Vector{Any}
* Strings
* Symbols
* Mutable and immutable structs
* Tuples and NamedTuples
* Global variables
* Varargs and keyword arguments

Heap allocation is handled by WebAssembly's garbage collector (see [wasm-GC](https://github.com/WebAssembly/gc)).

Interoperability with JavaScript is quite good. Julia code can run JavaScript functions and exchange objects. This functionality allows Julia to interact with the browsers DOM.

Code must be type stable (no dynamic dispatches). In addition, several Julia constructs are not supported, including:

* Multi-dimensional arrays (waiting on the [Memory type PR](https://github.com/JuliaLang/julia/pull/51319))
* Pointers
* Union types
* Exception handling
* Errors
* Some integer types (Int16, Int128, ...)
* Dict's (at least some uses of [Dictionaries.jl](https://github.com/andyferris/Dictionaries.jl) work based on light testing)

WebAssemblyCompiler supports [overlays](@ref Overlays) and other ways to fix up code when compiling.



