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
* BLAS and all other C dependencies

WebAssemblyCompiler supports [overlays](@ref Overlays) and other ways to fix up code when compiling.

Once compiled to WebAssembly, you can integrate that into web apps in many ways.
The examples in these docs are made with:
* [Literate.jl](https://fredrikekre.github.io/Literate.jl/v2/)--The Julia files in [/examples](https://github.com/tshort/WebAssemblyCompiler.jl/tree/main/examples/) can run standalone, or they can be used with [Franklin](https://franklinjl.org/) or [Documenter](https://documenter.juliadocs.org/stable/) (as done here).
* [mdpad](https://mdpad.netlify.app/)--This small JavaScript package provides features for single-page web apps, including auto-updates of inputs and address-bar handling.
* [Bulma](https://bulma.io/)--Any CSS framework should work. Because Documenter uses a theme based on Bulma, that is used for styling web apps.

The web apps are very Julia focused. Not much JavaScript is needed.
