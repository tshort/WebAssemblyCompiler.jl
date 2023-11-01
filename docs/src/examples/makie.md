```@meta
EditURL = "makie.jl"
```

# Sum of Sines Demo using Makie

Plot with Makie in the browser with interactivity. Adapted from [this demo](https://github.com/garrekstemo/InteractivePlotExamples.jl/blob/main/examples/sum_of_sines.jl).

````@example makie
using WebAssemblyCompiler     # prep some input #hideall   #hide
using WebAssemblyCompiler.JS: h   #hide
const W = WebAssemblyCompiler   #hide
   #hide
const names = []   #hide
   #hide
function numform(description; jl = description, value = 1, args...)   #hide
    push!(names, jl)   #hide
    # push!(os, Observable(value))   #hide
    h.div."field"(   #hide
        h.label."label"(   #hide
          description   #hide
        ),   #hide
        h.div."control"(   #hide
            h.input(;type = "range", value, step = "any", oninput = "document.wasm.$jl(this.value)", args...)   #hide
        ),   #hide
    )   #hide
end   #hide
   #hide
html = h.div(   #hide
    h.div."columns is-vcentered"(   #hide
        h.div."column is-3"(   #hide
            h.form(   #hide
                numform("a₁", jl = "k1", value = 1.0, min = 0.0, max = 2.5),   #hide
                numform("ω₁", jl = "k2", value = 1.0, min = 1.0, max = 6.0),   #hide
                numform("δ₁", jl = "k3", value = 0.0, min = 0.0, max = 7.0),   #hide
                numform("a₂", jl = "k4", value = 1.0, min = 0.0, max = 2.5),   #hide
                numform("ω₂", jl = "k5", value = 3.0, min = 1.0, max = 6.0),   #hide
                numform("δ₂", jl = "k6", value = 0.5, min = 0.0, max = 7.0),   #hide
            )   #hide
        ),   #hide
        h.div."column"(   #hide
            h.div(id = "plot")   #hide
        )   #hide
    ),   #hide
)   #hide
````
!!! warning "Technology demonstration"
    This uses results compiled using 
    [`examples/makie/makie.jl`](https://github.com/tshort/WebAssemblyCompiler.jl/blob/main/examples/makie/makie.jl).
    That code does not compile out of the box.
    It uses dev'd versions of Observables and Makie.
    These contain hacks to make them more amenable to static compilation.
    The Makie backend uses SVG and is rather simplistic. 
    The purpose of this demo is to show that this is feasible.


```@raw html
<script src="makie.wasm.js"></script>
<script>
    // Weird hack to load noUISlider: https://stackoverflow.com/a/3363588
    // https://github.com/JuliaDocs/Documenter.jl/issues/12471
    window.__define = window.define;
    window.__require = window.require;
    window.define = undefined;
    window.require = undefined;
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/15.7.1/nouislider.min.js" integrity="sha512-UOJe4paV6hYWBnS0c9GnIRH8PLm2nFK22uhfAvsTIqd3uwnWsVri1OPn5fJYdLtGY3wB11LGHJ4yPU1WFJeBYQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
    window.define = window.__define;
    window.require = window.__require;
    window.__define = undefined;
    window.__require = undefined;
</script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/15.7.1/nouislider.css" integrity="sha512-MKxcSu/LDtbIYHBNAWUQwfB3iVoG9xeMCm32QV5hZ/9lFaQZJVaXfz9aFa0IZExWzCpm7OWvp9zq9gVip/nLMg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script type="module">
setTimeout(function() {
  var x = document.getElementById("plot")
  if (x.innerHTML === "") {
      x.innerHTML = "<strong>Unsupported browser.</strong> Chrome v119 or Firefox v120 or better should work."
  }
}, 1000)
export async function load_wasm() {
  const response = await fetch('makie.wasm');
  const bytes = await response.arrayBuffer();
  const { instance } = await WebAssembly.instantiate(bytes, jsexports);
  const { basics } = instance.exports;
  return instance.exports;
}
document.wasm = await load_wasm();
document.wasm.k4(1.5);
</script>
<style>
/********** Range Input Styles **********/
/*Range Reset*/
input[type="range"] {
   -webkit-appearance: none;
    appearance: none;
    background: transparent;
    cursor: pointer;
    width: 15rem;
}

/* Removes default focus */
input[type="range"]:focus {
  outline: none;
}

/***** Chrome, Safari, Opera and Edge Chromium styles *****/
/* slider track */
input[type="range"]::-webkit-slider-runnable-track {
   background-color: #053a5f;
   border-radius: 0.5rem;
   height: 0.5rem;  
}

/* slider thumb */
input[type="range"]::-webkit-slider-thumb {
  -webkit-appearance: none; /* Override default look */
   appearance: none;
   margin-top: -12px; /* Centers thumb on the track */

   /*custom styles*/
   background-color: #5cd5eb;
   height: 2rem;
   width: 1rem;
}

input[type="range"]:focus::-webkit-slider-thumb {   
  border: 1px solid #053a5f;
  outline: 3px solid #053a5f;
  outline-offset: 0.125rem; 
}

/******** Firefox styles ********/
/* slider track */
input[type="range"]::-moz-range-track {
   background-color: #053a5f;
   border-radius: 0.5rem;
   height: 0.5rem;
}

/* slider thumb */
input[type="range"]::-moz-range-thumb {
   border: none; /*Removes extra border that FF applies*/
   border-radius: 0; /*Removes default border-radius that FF applies*/

   /*custom styles*/
   background-color: #5cd5eb;
   height: 2rem;
   width: 1rem;
}

input[type="range"]:focus::-moz-range-thumb {
  border: 1px solid #053a5f;
  outline: 3px solid #053a5f;
  outline-offset: 0.125rem; 
}
</style>

```
