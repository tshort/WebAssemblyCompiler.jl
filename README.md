# Binaryen

[![Build Status](https://github.com/tshort/Binaryen.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/tshort/Binaryen.jl/actions/workflows/CI.yml?query=branch%3Amain)



## TODO

### SSA IR

* [ ] P nodes
* [ ] PhiC nodes
* [ ] Upsilon nodes

### Intrinsics / Builtins

* [ ] Several

### Important

* [x] Recursively compile calls to `invoke`
* [x] foreigncall
* [ ] Global variables
* [x] Multiple functions

### Types

* [ ] Arrays
* [ ] Structs
* [ ] Tuples
* [ ] Strings
* [ ] Unions
* [ ] Symbols
* [ ] svec
* [ ] General type generator
* [ ] Replicate Julia's type tree with Binaryen's TypeBuilder?

### libjulia

* [ ] IO
* [ ] Approach?
    * [ ] Compile parts of libjulia itself to WASM
    * [ ] Replicate functionality (current thinking)

### Tests

* [ ] Integrate some of Julia's tests
* [ ] Get `@test` to work

### Other

* [ ] Binaryen optimization

### Things to try

* [ ] Pick a DiffEq example to try
* [ ] sin

