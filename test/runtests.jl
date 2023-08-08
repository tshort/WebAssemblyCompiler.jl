using Binaryen
using Binaryen.LibBinaryen
using Test

function f(x,y)
    a = x + y
    a + 1.0
end

mod = compile(f, (Float64,Float64))

BinaryenModulePrint(mod)

@testset "LibBinaryen" begin
    # adapted from https://github.com/WebAssembly/binaryen/blob/main/test/example/c-api-hello-world.c
    # Apache License
    mod = BinaryenModuleCreate()
  
    # Create a function type for  i32 (i32, i32)
    ii = [BinaryenTypeInt32(), BinaryenTypeInt32()]
    params = BinaryenTypeCreate(ii, 2)
    results = BinaryenTypeInt32()
  
    # Get the 0 and 1 arguments, and add them
    x = BinaryenLocalGet(mod, 0, BinaryenTypeInt32())
    y = BinaryenLocalGet(mod, 1, BinaryenTypeInt32())
    add = BinaryenBinary(mod, BinaryenAddInt32(), x, y)
  
    # Create the add function
    # Note: no additional local variables
    # Note: no basic blocks here, we are an AST. The function body is just an
    # expression node.
    adder = BinaryenAddFunction(mod, "adder", params, results, C_NULL, 0, add)
  
    # Print it out
    BinaryenModulePrint(mod)
  
    # Clean up the mod, which owns all the objects we created above
    BinaryenModuleDispose(mod)
end
