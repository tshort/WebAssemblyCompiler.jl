WebAssembly compiler processed Julia IR code to generate WebAssembly. Every `invoke` function call is compiled. Binaryen is used to compile code. Binaryen's "relooper" is used to convert Julia's IR in SSA form to WebAssembly code. Each "block" is compiled separately. 

Here are the key contents for the source.

* `compiler.jl`--The main file that defines `compile` (exported) which calls `compile_method` which calls `compile_method_body`.

* `compile_block.jl`--`compile_block` is the key function that compiles Julia IR. It's one giant if-elseif function that evaluates each line of IR code.

* `_compile.jl`--`_compile` compiles specific objects to WebAssembly.

* `utilities.jl`--Defines several helpers, including:
  - `matchcall`, `matchgr`, `matchforeigncall`: match IR for use by `compile_block`
  - `roottype`, `basetype`: type lookups to account for SSA stuff
  - `getglobal`: get and/or create a global variable
  - `gettype`: get and/or create the WebAssembly type based on the Julia type

* `types.jl`--Defines the main context variable to hold state (`CompilerContext`). Defines `Externref` for interoperation with the browser (exported).

These files define the AbstractInterpreter used as part of compilation. This comes from StaticCompiler.

* `interpreter.jl`--The AbstractInterpreter.
* `mixtape.jl`--Mixtape functionality for manipulating Julia IR.

These files define extensions that help when compiling common code.

* `javascript-interop.jl`--Defines module `JS` for interoperation with the browser. Key methods include:
  - `@jscall`--call JavaScript (exported)
  - `JS.object`--convert a Julia object to JavaScript
  - `JS.console_log`--log results to the browser console
  - `JS.sethtml`--set HTML at the given id
  - `JS.getelementbyid`--get the Externref that's the DOM element at the given id
  - `JS.h`--hyperscript-style generation of HTML nodes

* `quirks.jl`--Uses overlays to redefine several key functions. Key parts redefined include:
  - Error functions
  - Basic math functions to use JavaScript versions (reduces WebAssembly size, and not all Julia functions can currently be compiled)
  - Basic string functions

Other:

* `array.jl`--Includes a wrapper to implement arrays. 
