using Binaryen
using Binaryen.LibBinaryen
using Test
using NodeCall
NodeCall.initialize();

jsfunctions(fun, tt) = jsfunctions(((fun, tt...),))

function jsfunctions(funs)
    wpath = tempname() * ".wasm"
    compile(funs, filepath = wpath)
    js = """
    var funs = {};
    (async () => {
        const fs = require('fs');
        const wasmBuffer = fs.readFileSync('$wpath');
        const {instance} = await WebAssembly.instantiate(wasmBuffer, {ext: {sin: x => Math.sin(x), twox: x => 2*x}});
        funs = instance.exports;
    })();
    """
    p = node_eval(js)
    @await p
    return node"funs"
end


@testset "Julia compiler" begin

    function f1(x,y)
        a = x + y
        a + 1
    end
    # compile(f1, (Float64,Float64); filepath = "j.wasm")
    jsfun = jsfunctions(f1, (Float64,Float64))
    @test f1(3.0, 4.0) == jsfun.f1(3.0, 4.0)
    jsfun = jsfunctions(f1, (Int32,Int32))
    @test f1(3, 4) == jsfun.f1(3, 4)
    jsfun = jsfunctions(f1, (Float64,Int32))
    @test f1(3, 4) == jsfun.f1(3, 4)

    function f2(x,y)
        a = x + y
        a > 2 ? a + 1 : 2a
    end
    jsfun = jsfunctions(f2, (Float64,Float64))
    @test f2(3.0, 4.0) == jsfun.f2(3.0, 4.0)
    @test f2(-3.0, 4.0) == jsfun.f2(-3.0, 4.0)
    jsfun = jsfunctions(f2, (Int32,Int32))
    @test f2(3, 4) == jsfun.f2(3, 4)
    @test f2(-3, 4) == jsfun.f2(-3, 4)

    jsfun = jsfunctions(((f1, Float64, Float64),
                        (f2, Float64, Float64)))
    @test f1(3.0, 4.0) == jsfun.f1(3.0, 4.0)
    @test f2(3.0, 4.0) == jsfun.f2(3.0, 4.0)
    

    function f3(x,y)
        if x > 1.0
            a = x + y
        else
            a = x + y + 3
        end
        a
    end
    jsfun = jsfunctions(f3, (Float64,Float64))
    @test f3(0.0, 4.0) == jsfun.f3(0.0, 4.0)
    @test f3(2.0, 4.0) == jsfun.f3(2.0, 4.0)

    function f4(x,y)
        if x > 1.0
            a = x + 1.0
            b = 3.0
        else
            a = y + 2.0
            b = 4.0
        end
        a + b
    end
    jsfun = jsfunctions(f4, (Float64,Float64))
    @test f4(0.0, 4.0) == jsfun.f4(0.0, 4.0)
    @test f4(2.0, 4.0) == jsfun.f4(2.0, 4.0)

    function f5(x,y)
        a = 0.0
        while a < 4.0
            a = a + x
        end
        a + y
    end
    jsfun = jsfunctions(f5, (Float64,Float64))
    @test f5(1.0, 4.0) == jsfun.f5(1.0, 4.0)
    @test f5(5.0, 4.0) == jsfun.f5(5.0, 4.0)

    function f6(x,y)
        a = x + y
        b = ccall(:sin, Float64, (Float64,), a)
        b + 1
    end
    compile(f6, (Float64,Float64); filepath = "j.wasm")
    run(`$(Binaryen.Bin.wasmdis()) j.wasm -o j.wat`)
    jsfun = jsfunctions(f6, (Float64,Float64))
    @test  jsfun.f6(3.0, 4.0) ≈ sin(7.0) + 1

    @noinline twox(x) = 2x
    function f7(x,y)
        x + twox(y)
    end
    compile(f7, (Float64,Float64); filepath = "j.wasm")
    run(`$(Binaryen.Bin.wasmdis()) j.wasm -o j.wat`)
    jsfun = jsfunctions(f7, (Float64,Float64))
    @test f7(3.0, 4.0) == jsfun.f7(3.0, 4.0)

end

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
    BinaryenAddFunctionExport(mod, "adder", "adder")
    # Print it out
    # BinaryenModulePrint(mod)
    out = BinaryenModuleAllocateAndWrite(mod, C_NULL)
    
    write("t.wasm", unsafe_wrap(Vector{UInt8}, Ptr{UInt8}(out.binary), (out.binaryBytes,)))
    Libc.free(out.binary)  

    # Clean up the mod, which owns all the objects we created above
    BinaryenModuleDispose(mod)

    js = """
    var funs = {};
    (async () => {
        const fs = require('fs');
        const wasmBuffer = fs.readFileSync('t.wasm');
        const {instance} = await WebAssembly.instantiate(wasmBuffer);
        funs.adder = instance.exports.adder;
    })();
    """

    p = node_eval(js)
    @await p
    @test node"funs.adder(5,6)" == 11

    run(`$(Binaryen.Bin.wasmdis()) t.wasm -o t.wat`)
    wat = read("t.wat", String)
    @test contains(wat, raw"func $0 (param $0 i32) (param $1 i32) (result i32)")

end

