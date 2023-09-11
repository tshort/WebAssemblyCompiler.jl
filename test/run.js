export async function run(x) {
    const response = await fetch('fa13.wasm');
    const bytes = await response.arrayBuffer();
    const { instance } = await WebAssembly.instantiate(bytes, {Math: {
                sin: x => Math.sin(x), 
                cos: x => Math.cos(x), 
                tan: x => Math.tan(x), 
                acos: x => Math.acos(x), 
                },
             console: {
                log: x => console.log(x),
                error: x => console.error(x),
             },
             ext: {
                jsarraynew: n => new Array(n),
                jsarraysetf64: (v, i, x) => v[i] = x,
                jsarrayseti32: (v, i, x) => v[i] = x,
                print_array_to_string: (x) => x.join(""),
                console_log: x => console.log(x),
                console_log_str: x => console.log(x),
                twox: x => 2*x
                }});

    const { fa13 } = instance.exports;

    return fa13(x)

}

