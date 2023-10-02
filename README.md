# WebAssemblyCompiler

[![Build Status](https://github.com/tshort/WebAssemblyCompiler.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/tshort/WebAssemblyCompiler.jl/actions/workflows/CI.yml?query=branch%3Amain)

## API

* `compile`

## API for Browser/Javascript Interoperability

* `@jscall`
* `JS.object()`
* `JS.eval()`
* `JS.console_log()`

### Experimental API's

* `JS.sethtml`
* `JS.getelementbyid`
* `JS.h`
* `JS.escape`
* `JS.@esc_str`

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

* Multidimensional arrays--Wait on the new Array/Memory/MemoryRef work

Broken and hard:

* `sin`--Uses `Int128`.
* Anything involving pointers--need to use overlays to intercept the code and replace with something else.


### Things to try

* [ ] Pick a DiffEq example to try


