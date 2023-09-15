using Test
using WebAssemblyCompiler

using NodeCall
# NodeCall.initialize(node_args = ["--experimental-wasm-gc", "--experimental-wasm-stringref"]);
NodeCall.initialize(node_args = ["--experimental-wasm-gc"]);

# jsfunctions(fun, tt) = jsfunctions(((fun, tt...),))

function jsfunctions(funs...)
    wpath = tempname() * ".wasm"
    jspath = wpath * ".js"
    compile(funs..., filepath = wpath, experimental = false)
    jsexports = read(jspath, String)
    js = """
    $jsexports
    var funs = {};
    (async () => {
        const fs = require('fs');
        const wasmBuffer = fs.readFileSync('$wpath');
        const { instance } = await WebAssembly.instantiate(wasmBuffer, jsexports);
        funs = instance.exports;
    })();
    """
    p = node_eval(js)
    @await p
    return node"funs"
end

