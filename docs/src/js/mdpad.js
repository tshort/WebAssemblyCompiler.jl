//
// `mdpad`
// 
// `mdpad` enables simpler single-page apps.
// 
// With `mdpad` active, the page recalculates when the user updates
// any of the form elements.
// 
// The page author provides two JavaScript functions:
//   * `mdpad_init()` -- This runs right after the page loads. This is 
//     normally used for setting up input items or loading data.
//   * `mdpad_update()` -- This runs whenever the user changes any form 
//     elements. This is normally used to make calculations based on the
//     inputs and update any output fields.
// Both of these functions are optional.
//
// `mdpad` does the following:
//   - Run `mdpad_init()` after the page loads if it exists.
//   - If `mdpad_update` exists,
//     - Add event listeners to form elements to check for changes. 
//     - When a form element changes, take all form elements with a `mdpad`
//       attribute, and create variables within `mdpad` with that same name. 
//       Then, run `mdpad_update()`.
//
// `mdpad` returns an object `api` with several function used for setup. 
//   * `mdpad.api.calculate()` -- run a page calculation. 
//   * `mdpad.api.enable_url()` -- adjust the URL as inputs are changed. (default)
//   * `mdpad.api.disable_url()` -- disable this feature.
//   * `mdpad.api.enable_replace_url()` -- don't keep history of changes.
//   * `mdpad.api.disable_replace_url()` -- keep history of changes. (default)
//   * `mdpad.api.update_defaults(x)` -- update variable defaults for `mdpad` based on `x`.
//   * `mdpad.api.update_forms()` -- update all forms based on defaults
//
// `mdpad` also houses the variables created from forms with `mdpad`-labeled inputs.
//  Defaults for variables are taken from initial values of inputs, but this
//  can be changed with `mdpad.api.update_defaults(x)`.


mdpad = function() {

// exported settings
var use_url = true;
var replace_url = false;

var variable_defaults = {};

function enable_url() {
    use_url = true;
} 
function disable_url() {
    use_url = false;
} 
function enable_replace_url() {
    replace_url = true;
} 
function disable_replace_url() {
    replace_url = false;
} 

function ready(fn) {
    if (document.readyState != "loading"){
        fn();
    } else {
        document.addEventListener("DOMContentLoaded", fn);
    }
}

// when the DOM loads, register document events that check for changes to form elements
ready(async function() {
    await init();
    await update_forms();
    await calculate();
    await setup_listeners();
})

function update_defaults(x) {
    variable_defaults = Object.assign({}, x);    
}

async function init() {
    if ("mdpad_init" in window)
        await mdpad_init();
    await calculate_forms();
    update_defaults(mdpad);
}

async function update_forms() {
    if (use_url) {
        var url = new URL(window.location);
        var params = new URLSearchParams(url.search); 
        // restore defaults
        Object.keys(variable_defaults).forEach(function(key) { 
            var el = document.querySelector("[mdpad=" + key + "]");
            if (el)
                set_element_value(el, variable_defaults[key]);
        });
        // fill in values from the URL
        url.searchParams.forEach(function(value, key) { 
            var el = document.querySelector("[mdpad=" + key + "]");
            if (el)
                set_element_value(el, value);
        });
    }
}

async function setup_listeners() {
    if (!("mdpad_update" in window)) return;
    document.addEventListener("keyup", function (event) {
        if (event.target.matches("input, textarea, datalist, button") &&
            event.target.getAttribute("mdpad") && event.key == "Enter") {
                update_element(event.target);
                calculate();
            }
        }, false);
    document.addEventListener("change", function (event) {
        if (event.target.matches("select, input, textarea, datalist") &&
            event.target.getAttribute("mdpad")) {
                update_element(event.target);
                calculate();
            }
        }, false);
    window.addEventListener('popstate', function(event) {
        update_forms();
        calculate();
    }, true);
}

function update_element(el) {
    name = el.getAttribute("mdpad");
    if (name && use_url) {
        var url = new URL(window.location);
        var params = new URLSearchParams(url.search); 
        params.set(name, element_value(el));
        if (replace_url) {
            window.history.replaceState({}, '', `${location.pathname}?${params}`);
        } else {
            window.history.pushState({}, '', `${location.pathname}?${params}`);
        }
    }
}

function set_element_value(el, value) {
    if (el.type == "checkbox") {
        el.checked = bool(value);
    } else if (el.type == "radio") {
        document.querySelectorAll("[mdpad=" + el.getAttribute("mdpad") + "]").forEach((el) => {
            el.checked = el.value == value;
        })
    } else {
        el.value = value;
    }
}

function bool(x) {
    if (x == "false") return false;
    return Boolean(x);
}

function element_value(x) {
    if (x.type == "text") {
        return x.value;
    } else if (x.type == "number") {
        var val = Number(x.value);
        if (x.min && val < Number(x.min)) {
            var minval = Number(x.min);
            set_element_value(x, minval);
            val = minval; 
        }
        if (x.max && val > Number(x.max)) {
            var maxval = Number(x.max);
            set_element_value(x, maxval);
            val = maxval; 
        }
        return val;
    } else if (x.type == "radio" && x.checked) {
        return x.value;
    } else if (x.type == "checkbox") {
        return x.checked;
    } else if (x.nodeName.toLowerCase() == "select") {
        return x[x.selectedIndex].value
    } else if (x.nodeName.toLowerCase() == "textarea") {
        return x.value;
    }
    return undefined
}

async function read_form(x, i, a) {
    // Send commands to javascript to turn form elements into javascript global variables.
    var name = x.getAttribute("mdpad");
    if (name) {
        var val = element_value(x);
        if (typeof val !== 'undefined') 
            mdpad[name] = val; 
    }
}

async function calculate_forms() {  // update data from each form element
    document.querySelectorAll("input, select, textarea, datalist").forEach(read_form);
}

async function calculate() {  // page calculation
    await calculate_forms();
    if ("mdpad_update" in window)
        await mdpad_update();
}

return {
    api: {
        calculate:calculate,
        set_element_value:set_element_value,
        enable_url:enable_url,
        disable_url:disable_url,
        enable_replace_url:enable_replace_url,
        disable_replace_url:disable_replace_url,
        update_defaults:update_defaults,
        update_forms:update_forms,
    },
}

}();