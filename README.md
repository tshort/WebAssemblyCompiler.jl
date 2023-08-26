# Binaryen

[![Build Status](https://github.com/tshort/Binaryen.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/tshort/Binaryen.jl/actions/workflows/CI.yml?query=branch%3Amain)



## TODO

### SSA IR

* [ ] PhiC nodes
* [ ] Upsilon nodes

### Intrinsics / Builtins

* [ ] Several

### Important

* [x] Recursively compile calls to `invoke`
* [x] foreigncall
* [x] Global variables
* [x] Multiple functions

### Types

* [x] WASM arrays (more like buffers)
* [ ] Julia arrays
* [x] Structs
* [x] Tuples
* [ ] Strings
* [ ] Unions
* [ ] Symbols
* [ ] svec
* [x] General type generator
* [ ] Replicate Julia's type tree with Binaryen's TypeBuilder?

### libjulia

* [ ] IO
* [ ] Approach?
    * [ ] Compile parts of libjulia itself to WASM
    * [ ] Replicate functionality (current thinking)

### Tests

* [ ] Integrate some of Julia's tests
* [x] Get `@test` to work

### Other

* [x] Binaryen optimization

### Things Working and Things Broken

Working:

* `exp`
* `log` and siblings
* `acos`
* Global and dynamically allocated vectors
* Global and dynamically allocated structs
* Passing strings to/from JS
* Import and use of JS functions, including Math.sin, etc.

Broken but feasible:

* Resizable arrays
* Multidimensional arrays
* String operations

Broken and hard:

* `sin`--Uses `Int128`.
* Anything involving pointers--need to use overlays to intercept the code and replace with something else.


### Things to try

* [ ] Pick a DiffEq example to try


## Approaches to Generating WebAssembly

[StaticCompiler](https://github.com/tshort/StaticCompiler.jl) can also generate WebAssembly from Julia code. Some of the advantages of that approach include:
* LLVM generates fast code.
* The package is simple (GPUCompiler and Julia's compiler does all the work).
The main disadvantages of StaticCompiler are:
* No GC built in.
* No clear path to include libjulia capability, so no GC, and everything must be manually allocated ([StaticTools](https://github.com/brenhinkeller/StaticTools.jl)).
* The Julia compiler doesn't make a good cross compiler. For example indexes into structs sometimes use the host index and sometimes the target index.

The compiler in this project is better in some ways, including:
* Support for WebAssembly GC (structs, strings, arrays, ...).
* Better interop with JavaScript (eventually).
* Can tailor compilation to WebAssembly better.
* Hacking the compiler is easier.
The downsides of this approach are:
* Code isn't as good as LLVM.
* WebAssembly's type system is limited. This should improve in the future.
  * No nested structs or arrays of structs; nesting boxes everything; use [StructArrays](https://github.com/JuliaArrays/StructArrays.jl), [ComponentArrays](https://github.com/jonniedie/ComponentArrays.jl), [ValueShapes](https://github.com/oschulz/ValueShapes.jl), or other Julia packages to organize nested data using flat arrays.
  * All structs are boxed.
* Browser support for WASM-GC is just beginning.

## Notes

* WebAssembly's Tuples and Structs cannot be indexed dynamically. Only fixed integer indexing works. One strategy is to map Tuples as follows:
  - NTuple -> WebAssembly's Fixed Array
  - Tuple -> WebAssembly's Tuple or Struct. Struct will GC. Tuple is more for handling multiple return values. The only option for dynamic indexing is some sort of table lookup.  

* There is no equivalent of Tuples for StaticArrays. There are Fixed Arrays that are heap allocated. Maybe the browser can convert some of those to stack values. Something like [Bumper](https://github.com/MasonProtter/Bumper.jl) could substitute for stack allocation.

* You can't get a pointer from GC heap-allocated arrays. No reinterpretation or pointer operations. You can have a buffer and pull in individual values and reinterpret those.