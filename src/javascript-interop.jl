export @jscall

"""
    @jscall(fun, rettype, tt, args...)

Call a JavaScript function `fun`. 
`fun` is a string and normally includes the JavaScript function definition.
For now, this is a straight passthrough to `Base.llvmcall`.
All `@jscall` definitions are imported from JavaScript.

`rettype`, `tt`, ang `args...` all follow the `Base.llvmcall` format.
`tt` is a Tuple type (not a regular Tuple).

Examples:
    

`@jscall` is used extensively in [quirks.jl](https://github.com/tshort/WebAssemblyCompiler.jl/blob/main/src/javascript-interop.jl) and 
[javascript-interop.jl](https://github.com/tshort/WebAssemblyCompiler.jl/blob/main/src/javascript-interop.jl).

"""
macro jscall(fun, rettype, tt, args...)
    esc(:(Base.llvmcall($fun, $rettype, $tt, $(args...))))
end

export JS

module JS
using ..WebAssemblyCompiler: Externref, Box, @jscall

arraynew(n) = @jscall("n => Array(n)", Externref, Tuple{Int32}, n)
## Use setindex! instead?? If so, need an ArrayRef type?
_set(jsa::Externref, i::Integer, x::T) where T = @jscall("(v, i, x) => v[i] = x", Nothing, Tuple{Externref, Int32, T}, jsa, Int32(i - 1), x)
_set(jsa::Externref, str::String, x::T) where T = @jscall("(v, i, x) => v[i] = x", Nothing, Tuple{Externref, String, T}, jsa, str, x)
_get(jsa::Externref, i::Integer, ::Type{T}) where T = @jscall("(v, i) => v[i]", T, Tuple{Externref, Int32}, jsa, Int32(i - 1))
_get(jsa::Externref, str::String, ::Type{T}) where T = @jscall("(v, i) => v[i]", T, Tuple{Externref, String}, jsa, str)

struct TypedArray{T} end

TypedArray{Float64}(n) = @jscall("n => new Float64Array(n)", Externref, Tuple{Int32}, n)
TypedArray{Float32}(n) = @jscall("n => new Float32Array(n)", Externref, Tuple{Int32}, n)

objectnew() = @jscall("() => ({})", Externref, Tuple{})

"""
Applies JavaScript's `console.log` to show `x` in the browser log. Returns nothing.
"""
console_log(x::Externref) = @jscall("(x) => console.log(x)", Nothing, Tuple{Externref}, x)
console_log(x::T) where {T <: Union{Int32, Float32, Float64, String}} = @jscall("x => console.log(x)", Nothing, Tuple{T}, x)
console_log(x::Symbol) = @jscall("x => console.log(x)", Nothing, Tuple{String}, x)
console_log(x) = console_log(object(x))

"""
Returns a DOM object based on `document.getElementById(x)`.
"""
getelementbyid(x) = @jscall("(x) => document.getElementById(x)", Externref, Tuple{String}, x)
"""
Sets the innerHTML of the DOM object `ref` to `str`.
"""
sethtml(ref::Externref, str::String) = @jscall("(x, str) => x.innerHTML = str", Nothing, Tuple{Externref, String}, ref, str)
sethtml(id::String, str::String) = sethtml(getelementbyid(id), str)

"""
Evaluate the JavaScript string `x`. Returns a JavaScript object.
"""
eval(x::String) = @jscall("(x) => eval(x)", Externref, Tuple{String}, x)

array_to_string(x::Externref) = @jscall("(x) => x.join(\"\")", String, Tuple{Externref}, x)
# array_to_string(x::Array) = join(x, "")
array_to_string(x::Vector) = array_to_string(object(x))


"""
    object(x)

Return a JavaScript object representing the Julia object `x`.
This is useful for transfering arrays, named tuples, and other objects to JavaScript.
"""
object(x::Union{Int32, Float32, Float64, String, Symbol, Externref}) = x
# object(x::Char) = string(x)

function object(v::Vector{Any})
    jsa = arraynew(Int32(length(v)))
    for (i, x) in enumerate(v)
        if x isa Box{Float64}
            _set(jsa, i, x.x)
        elseif x isa Box{Int32}
            _set(jsa, i, x.x)
        elseif x isa Box{String}
            _set(jsa, i, x.x)
        elseif x isa Box{Int64}
            _set(jsa, i, Int32(x.x))
        # elseif x isa Box{Symbol}
        #     _set(jsa, i, x.x)
        # elseif x isa Box{Char}
            # _set(jsa, i, x.x)
        elseif x isa Vector{Any}
            _set(jsa, i, object(x))
        end
    end
    return jsa
end

# function object(v::Vector{T}) where T <: Union{Int64, Int32, UInt64, UInt32, Float64, Float32, Char, Bool, UInt8, Int8}
function object(v::Vector{T}) where T <: Union{Float64, Float32}
    jsa = TypedArray{T}(Int32(length(v)))
    for (i, x) in enumerate(v)
        _set(jsa, i, x)
    end
    return jsa
end

using Unrolled

@inline @generated function object(nt::NamedTuple)
    ks = fieldnames(nt)
    res = Expr(:block)
    push!(res.args, :(jso = objectnew()))
    for k in ks
        sk = String(k)
        qk = QuoteNode(k)
        push!(res.args, :(_set(jso, $sk, object(getfield(nt, $qk)))))
    end
    push!(res.args, :(return jso))
    return res
end

function object(tpl::Tuple)
    n = length(tpl)
    jsa = arraynew(Int32(n))
    _setjsa(jsa, 1, tpl...)
    return jsa
end

@inline _setjsa(jsa, i) = nothing
@inline _setjsa(jsa, i, x) = _set(jsa, i, x)
@inline function _setjsa(jsa, i, x, xs...)
    _setjsa(jsa, i, x)
    _setjsa(jsa, i + 1, xs...)
end

# Simple IO buffer for printing to strings
struct IOBuff <: IO
    x::Vector{Any}
end
IOBuff() = IOBuff(Any[])

Base.isreadable(io::IOBuff) = false
Base.iswritable(io::IOBuff) = true

Base.take!(b::IOBuff) = array_to_string(b.x)

@inline Base.print(io::IOBuff, a::String)  = push!(io.x, a)
@inline Base.print(io::IOBuff, a)  = push!(io.x, a)
@inline Base.print(io::IOBuff, a, b)  = (push!(io.x, a); push!(io.x, b))
@inline Base.print(io::IOBuff, a, b, c...)  = (push!(io.x, a); push!(io.x, b); print(io, c...))


@inline _string(x...) = array_to_string(JS.object(Any[x...]))
@inline _string(x) = x
@inline _string(x::Symbol) = string("", x)  # cheating here, but how do we make this better?


"""
    Node(tag::String, attrs::NamedTuple, children::Tuple)

Should not often be used directly.  See `?JS.h`.
"""
struct Node{A <: NamedTuple, C <: Tuple}
    tag::String
    attrs::A
    children::C
end
tag(o::Node) = getfield(o, :tag)
attrs(o::Node) = getfield(o, :attrs)
children(o::Node) = getfield(o, :children)

attrs(kw::AbstractDict) = NamedTuple(kw)

(o::Node)(x...; kw...) = Node(tag(o), (;attrs(o)..., attrs(kw)...), (children(o)..., x...))

Base.:(==)(a::Node, b::Node) = all(f(a) == f(b) for f in (tag, attrs, children))

# methods that pass through to attrs(o)
Base.propertynames(o::Node) = propertynames(attrs(o))

Base.get(o::Node, name, val) = length(attrs(o)) > 0 ? 
    hasfield(typeof(attrs(o)), Symbol(name)) ? 
    getindex(attrs(o), Symbol(name)) : 
    val : 
    ""
Base.haskey(o::Node, name) = haskey(attrs(o), Symbol(name))
Base.keys(o::Node) = keys(attrs(o))

# append classes
Base.getproperty(o::Node, class::String) = o(class = string(Base.get(o, :class, ""), " ", class))
Base.getproperty(o::Node, class::Symbol) = o(class = string(Base.get(o, :class, ""), " ", class))

# methods that pass through to children(o)
Base.lastindex(o::Node) = lastindex(children(o))
# Base.getindex(o::Node, i::Union{Integer, AbstractVector{<:Integer}, Colon}) = children(o)[i]
# Base.setindex!(o::Node, x, i::Union{Integer, AbstractVector{<:Integer}, Colon}) = setindex!(children(o), x, i)
Base.length(o::Node) = length(children(o))
Base.iterate(o::Node) = iterate(children(o))
Base.iterate(o::Node, state) = iterate(children(o), state)
# Base.push!(o::Node, x) = push!(children(o), x)
# Base.append!(o::Node, x) = append!(children(o), x)

#-----------------------------------------------------------------------------# h
"""
    h(tag, children...; kw...)
    h.tag(children...; kw...)
    h.tag."classes"(children...; kw...)

Create an html node with the given `tag`, `children`, and `kw` attributes.

### Examples

    h.div("child", class="myclass", id="myid")
    # <div class="myclass" id="myid">child</div>

    h.div."myclass"("content")
    # <div class="myclass">content</div>

Adapted from [Cobweb](https://github.com/JuliaComputing/Cobweb.jl).
`h` uses the same API as `Cobweb.h`, except for `getindex` with symbols.
For `WebAssemblyCompiler.h`, the following are equivalent:

    h.div."myclass"("content")
    h.div.myclass("content")

"""
@inline h(tag, children...; attrs...) = Node(tag, NamedTuple(attrs), children)


@inline Base.getproperty(::typeof(h), tag::Symbol) = h(_string(tag))
@inline Base.getproperty(::typeof(h), tag::String) = h(tag)
Base.propertynames(::typeof(h)) = HTML5_TAGS

#-----------------------------------------------------------------------------# @h
const HTML5_TAGS = [:a,:abbr,:address,:area,:article,:aside,:audio,:b,:base,:bdi,:bdo,:blockquote,:body,:br,:button,:canvas,:caption,:cite,:code,:col,:colgroup,:data,:datalist,:dd,:del,:details,:dfn,:dialog,:div,:dl,:dt,:em,:embed,:fieldset,:figcaption,:figure,:footer,:form,:h1,:h2,:h3,:h4,:h5,:h6,:head,:header,:hgroup,:hr,:html,:i,:iframe,:img,:input,:ins,:kbd,:label,:legend,:li,:link,:main,:map,:mark,:math,:menu,:menuitem,:meta,:meter,:nav,:noscript,:object,:ol,:optgroup,:option,:output,:p,:param,:picture,:pre,:progress,:q,:rb,:rp,:rt,:rtc,:ruby,:s,:samp,:script,:section,:select,:slot,:small,:source,:span,:strong,:style,:sub,:summary,:sup,:svg,:table,:tbody,:td,:template,:textarea,:tfoot,:th,:thead,:time,:title,:tr,:track,:u,:ul,:var,:video,:wbr]

#-----------------------------------------------------------------------------# escape
escape_chars = ['&' => "&amp;", '"' => "&quot;", ''' => "&#39;", '<' => "&lt;", '>' => "&gt;"]

function escape(x; patterns = escape_chars)
    for pat in patterns
        x = replace(x, pat)
    end
    return x
end

unescape(x::AbstractString) = escape(x; patterns = reverse.(escape_chars))

macro esc_str(str)
    escape(str)
end

#-----------------------------------------------------------------------------# show (html)
@inline function print_opening_tag(io::IO, o::Node; self_close::Bool = false)
    print(io, "<", tag(o))
    # _printattrs(io, pairs(attrs(o))...)
    for (k,v) in pairs(attrs(o))
        v == "true" ? print(io, " ", k) : v != "false" && print(io, " ", k, "=\"", v, "\"")
        # print(io, " ", k, "=\"", v, "\"")
    end
    self_close && Symbol(tag(o)) ∉ VOID_ELEMENTS &&  length(children(o)) == 0 ?
        print(io, " />") :
        print(io, ">")
    nothing
end

@inline _printattrs(io) = nothing
@inline function _printattrs(io, x)
    # k = string(x[1])
    k = x[1]
    v = x[2]
    v == "true" ? print(io, " ", k) : v != "false" && print(io, " ", k, "=\"", v, "\"")
end
@inline function _printattrs(io, x, others...)
    _printattrs(io, x)
    _printattrs(io, others...)
end

@inline function Base.show(io::IO, o::Node)
    p(args...) = print(io, args...)
    print_opening_tag(io, o)
    _printchildren(io, children(o)...)
    p("</", tag(o), ">")
    nothing
end

_printchildren(io) = nothing
_printchildren(io, x) = print(io, x)
@inline function _printchildren(io, x, others...)
    print(io, x)
    _printchildren(io, others...)
    nothing
end

Base.show(io::IO, ::MIME"text/html", node::Node) = show(io, node)
Base.show(io::IO, ::MIME"text/xml", node::Node) = show(io, node)
Base.show(io::IO, ::MIME"application/xml", node::Node) = show(io, node)

function sethtml(id, n::Node)
    io = IOBuff()
    print(io, n)
    str = take!(io)
    sethtml(id, str)
    nothing
end

function _string(n::Node)   # Base.string won't work because we override it
    io = IOBuff()
    print(io, n)
    take!(io)
end
@inline Base.print(io::JS.IOBuff, a::Node) = show(io, a)

end