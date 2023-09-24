export @jscall

macro jscall(fun, rettype, tt, args...)
    esc(:(Base.llvmcall($fun, $rettype, $tt, $(args...))))
end

export JS

module JS
using ..WebAssemblyCompiler: Externref, Box, @jscall

arraynew(n) = @jscall("n => Array(n)", Externref, Tuple{Int32}, n)
## Use setindex! instead?? If so, need an ArrayRef type?
set(jsa::Externref, i::Integer, x::T) where T = @jscall("(v, i, x) => v[i] = x", Nothing, Tuple{Externref, Int32, T}, jsa, Int32(i - 1), x)
set(jsa::Externref, str::String, x::T) where T = @jscall("(v, i, x) => v[i] = x", Nothing, Tuple{Externref, String, T}, jsa, str, x)
get(jsa::Externref, i::Integer, ::Type{T}) where T = @jscall("(v, i) => v[i]", T, Tuple{Externref, Int32}, jsa, Int32(i - 1))
get(jsa::Externref, str::String, ::Type{T}) where T = @jscall("(v, i) => v[i]", T, Tuple{Externref, String}, jsa, str)

struct TypedArray{T} end

TypedArray{Float64}(n) = @jscall("n => new Float64Array(n)", Externref, Tuple{Int32}, n)
TypedArray{Float32}(n) = @jscall("n => new Float32Array(n)", Externref, Tuple{Int32}, n)

objectnew() = @jscall("() => ({})", Externref, Tuple{})

console_log(x::Externref) = @jscall("(x) => console.log(x)", Nothing, Tuple{Externref}, x)
console_log(x::T) where {T <: Union{Int32, Float32, Float64, String}} = @jscall("x => console.log(x)", Nothing, Tuple{T}, x)
console_log(x::Symbol) = @jscall("x => console.log(x)", Nothing, Tuple{String}, x)
console_log(x) = console_log(object(x))

getelementbyid(x) = @jscall("(x) => document.getElementById(x)", Externref, Tuple{String}, x)
sethtml(ref::Externref, str::String) = @jscall("(x, str) => x.innerHTML = str", Nothing, Tuple{Externref, String}, ref, str)
sethtml(id::String, str::String) = sethtml(getelementbyid(id), str)

eval(x::String) = @jscall("(x) => eval(x)", Externref, Tuple{String}, x)

array_to_string(x::Externref) = @jscall("(x) => x.join(\"\")", String, Tuple{Externref}, x)
# array_to_string(x::Array) = join(x, "")
array_to_string(x::Vector) = array_to_string(object(x))

object(x::Union{Int32, Float32, Float64, String, Symbol, Externref}) = x
# object(x::Char) = string(x)

function object(v::Vector{Any})
    jsa = arraynew(Int32(length(v)))
    for (i, x) in enumerate(v)
        if x isa Box{Float64}
            set(jsa, i, x.x)
        elseif x isa Box{Int32}
            set(jsa, i, x.x)
        elseif x isa Box{String}
            set(jsa, i, x.x)
        elseif x isa Box{Int64}
            set(jsa, i, Int32(x.x))
        # elseif x isa Box{Symbol}
        #     set(jsa, i, x.x)
        # elseif x isa Box{Char}
            # set(jsa, i, x.x)
        elseif x isa Vector{Any}
            set(jsa, i, object(x))
        end
    end
    return jsa
end

# function object(v::Vector{T}) where T <: Union{Int64, Int32, UInt64, UInt32, Float64, Float32, Char, Bool, UInt8, Int8}
function object(v::Vector{T}) where T <: Union{Float64, Float32}
    jsa = TypedArray{T}(Int32(length(v)))
    for (i, x) in enumerate(v)
        set(jsa, i, x)
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
        push!(res.args, :(set(jso, $sk, object(getfield(nt, $qk)))))
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
@inline _setjsa(jsa, i, x) = set(jsa, i, x)
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

string(x...) = array_to_string(JS.object(Any[x...]))
string(x) = x


"""
    Node(tag::String, attrs::Dictionary{String,String}, children::Vector)

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

# append classes
Base.getproperty(o::Node, class::String) = o(class = string(get(o, :class, ""), " ", class))
Base.getproperty(o::Node, class::Symbol) = o(class = string(get(o, :class, ""), " ", class))

# methods that pass through to attrs(o)
Base.propertynames(o::Node) = propertynames(attrs(o))
# Base.getproperty(o::Node, name::Symbol) = attrs(o)[name]
# Base.setproperty!(o::Node, name::Symbol, x) = set!(attrs(o), string(name), string(x))
Base.get(o::Node, name, val) = length(attrs(o)) > 0 ? 
    hasfield(typeof(attrs(o)), Symbol(name)) ? 
    getindex(attrs(o), Symbol(name)) : 
    string(val) : 
    ""
Base.haskey(o::Node, name) = haskey(attrs(o), Symbol(name))
Base.keys(o::Node) = keys(attrs(o))

# methods that pass through to children(o)
Base.lastindex(o::Node) = lastindex(children(o))
Base.getindex(o::Node, i::Union{Integer, AbstractVector{<:Integer}, Colon}) = children(o)[i]
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
"""
@inline h(tag, children...; attrs...) = Node(tag, NamedTuple(attrs), children)


Base.getproperty(::typeof(h), tag::Symbol) = h(string(tag))
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
end

_printattrs(io) = nothing
function _printattrs(io, x)
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
end

_printchildren(io) = nothing
_printchildren(io, x) = print(io, x)
@inline function _printchildren(io, x, others...)
    print(io, x)
    _printchildren(io, others...)
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

function string(n::Node)   # Base.string won't work because we override it
    io = IOBuff()
    print(io, n)
    take!(io)
end
@inline Base.print(io::JS.IOBuff, a::Node) = show(io, a)

end