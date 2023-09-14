export async function run(x) {
    const response = await fetch('fjs12.wasm');
    const bytes = await response.arrayBuffer();
    const { instance } = await WebAssembly.instantiate(bytes, {Math: {
                sin: x => Math.sin(x), 
                cos: x => Math.cos(x), 
                tan: x => Math.tan(x), 
                asin: x => Math.asin(x), 
                acos: x => Math.acos(x), 
                atan: x => Math.atan(x), 
                },
             console: {
                log: x => console.log(x),
                error: x => console.error(x),
             },
             js: {
                "x => console.log(x)": x => console.log(x),
             },
             ext: {
                arraynew: n => new Array(n),
                objectnew: () => ({}),
                set: (v, i, x) => v[i] = x,
                get: (v, i) => v[i],
                jseval: (x) => eval(x),
                getelementbyid: (x) => document.getElementById(x),
                sethtml: (x, str) => x.innerHTML = str,
                array_to_string: (x) => x.join(""),
                console_log: x => console.log(x),
                twox: x => 2*x
                }});

    const { fjs12 } = instance.exports;

    return fjs12(x)

}

