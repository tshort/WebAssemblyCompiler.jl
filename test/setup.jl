using NodeCall
NodeCall.initialize(node_args = ["--experimental-wasm-gc"]);

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

