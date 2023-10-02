export async function run(x) {
    const response = await fetch('fjs12.wasm');
    const bytes = await response.arrayBuffer();
    const { instance } = await WebAssembly.instantiate(bytes, jsexports);
    const { fjs12 } = instance.exports;
    return fjs12(x)

}

