# Notes

* WebAssembly's Tuples and Structs cannot be indexed dynamically. Only fixed integer indexing works. So, Tuples are mapped as follows:
  - NTuple -> WebAssembly's Fixed Array
  - Tuple -> WebAssembly's Tuple or Struct. The Struct will GC. WebAssembly's Tuple is more for handling multiple return values. The only option for dynamic indexing is some sort of table lookup.  

* There is no equivalent of stack-allocated Tuples for StaticArrays. There are Fixed Arrays that are heap allocated. Maybe the browser can convert some of those to stack values. [Bumper](https://github.com/MasonProtter/Bumper.jl) could substitute for stack allocation.

* You can't get a pointer from GC heap-allocated arrays. You can't reinterpret or use pointer operations. You can have a buffer and pull in individual values and reinterpret those. That's slow, though.

* Exception handling doesn't work. The compiler doesn't currently handle PhiC nodes or Upsilon nodes in the SSA IR. Binaryen and WebAssembly support try, catch, and throw, so there's no technical reason this can't be supported.

* Similarly error handling isn't attempted. Overlays are used to bypass error code to make things compile.

* The compiler includes some known bandaids and rough spots.

* In `compile_block`, the handling of `QuoteNode`s and `Core.Const` wrappers is uneven. Handling is included in a spotty fashio, but a more consistent approach would be better.

* On the WebAssembly side, on-the-fly type detection doesn't work. Heap objects are not stored with type information. It would be possible to add type info to all types. [Guile Hoot](https://gitlab.com/spritely/guile-hoot) does this by adding a type hash to every struct.

* Union's are not supported, and the path to supporting them is unclear. WebAssembly's type system doesn't have anything like that, and it also doesn't allow re-interpeting content easily.

* Several intrinsics are not supported. Some are challenging.

* Several of the existing intrinsics only support basic types (Int32, Int64, etc.). Better handling of these would be nice.

* String support is still limited. JavaScript is used to concatenate using `string(...)`. JavaScript uses UTF16 for strings, and Julia's String uses UTF8. WebAssembly supports different string encodings and conversions. Right now, Strings are left as JavaScript strings. No character-level operations are supported. In the future, it may be best to match Julia's UTF8 format, but then strings would need to be converted when exchanged with JavaScript. Maybe different string options could be implemented.

* Symbols are currently converted straight to strings. That allows basic operations to work, including comparisons. This simple approach may cause issues for some code.

* Binaryen doesn't do any auto-vectorization. WebAssembly has basic SIMD types, but none are supported by WebAssemblyCompiler. Options to improve this situation include:
  * Write a Binaryen pass to do auto-vectorization.
  * For loops with `@simd`, try to vectorize those.
  * Add support for basic SIMD types.

* LoopVectorization doesn't work. It's LLVM specific.

## Comparing Approaches to Generating WebAssembly

[StaticCompiler](https://github.com/tshort/StaticCompiler.jl) can also generate WebAssembly from Julia code. Some of the advantages of that approach include:
* LLVM generates fast code.
* The package is simple ([GPUCompiler](https://github.com/JuliaGPU/GPUCompiler.jl) and Julia's compiler does all the work).

The main disadvantages of StaticCompiler are:
* No GC built in.
* No clear path to include libjulia capability, so no GC, and everything must be manually allocated ([StaticTools](https://github.com/brenhinkeller/StaticTools.jl)).
* No global variables.
* The Julia compiler doesn't make a good cross compiler. For example, indexes into structs sometimes use the host index and sometimes the target index ([discussions](https://github.com/JuliaGPU/GPUCompiler.jl/issues/486#)).

The compiler in this project is better in some ways, including:
* Support for WebAssembly GC (structs, strings, arrays, ...).
* Good interop with JavaScript.
* Can tailor compilation to WebAssembly better.
* Hacking the compiler is easier.

The downsides of this approach are:
* Code isn't as good as LLVM's. The biggest issue may be no autovectorization.
* WebAssembly's type system is limited. This should improve in the future.
  * No nested structs or arrays of structs; nesting boxes everything; use [StructArrays](https://github.com/JuliaArrays/StructArrays.jl), [ComponentArrays](https://github.com/jonniedie/ComponentArrays.jl), [ValueShapes](https://github.com/oschulz/ValueShapes.jl), or other Julia packages to organize nested data using flat arrays.
  * All structs are boxed.
* Browser support for WASM-GC is just beginning.
* More bugs.

## TODO

Here is a list of some things that are not implemented.

### SSA IR / exception handling

* PhiC nodes
* Upsilon nodes

### Intrinsics / Builtins

* Several

### Types

* String concatenation
* Unions
* svec

### JS integration
  - Structs to objects

### libjulia

* IO

### Tests

* Updated NodeCall

### Other

* unsafe_copyto! - needs overlay
* Split up tests

