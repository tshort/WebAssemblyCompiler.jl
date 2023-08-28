# Adapted from https://github.com/tpapp/PushVectors.jl
# Copyright (c) 2018: Tamas K. Papp.
# MIT license.
# https://github.com/tpapp/PushVectors.jl/blob/master/LICENSE.md

struct Buffer{T} <: AbstractVector{T} end
mutable struct FakeArrayWrapper{T} <: AbstractVector{T}
    "Vector used for storage."
    parent::Buffer{T}
    "Number of elements held by `parent`."
    len::Int32
end


mutable struct ArrayWrapper{T} <: AbstractVector{T}
    "Vector used for storage."
    parent::Vector{T}
    "Number of elements held by `parent`."
    len::Int32
end

"""
    ArrayWrapper{T}(sizehint = 4)

Create a `ArrayWrapper` for elements typed `T`, with no initial elements. `sizehint`
determines the initial allocated size.
"""
function ArrayWrapper{T}(sizehint::Integer = 4) where {T}
    sizehint ≥ 0 || throw(DomainError(sizehint, "Invalid initial size."))
    ArrayWrapper{T}(Vector{T}(undef, sizehint), 0)
end

@inline Base.length(v::ArrayWrapper) = v.len

@inline Base.size(v::ArrayWrapper) = (v.len, )

function Base.sizehint!(v::ArrayWrapper, n)
    if length(v.parent) < n || n ≥ v.len
        resize!(v.parent, n)
    end
    nothing
end

@inline function Base.getindex(v::ArrayWrapper, i)
    @boundscheck checkbounds(v, i)
    @inbounds v.parent[i]
end

@inline function Base.setindex!(v::ArrayWrapper, x, i)
    @boundscheck checkbounds(v, i)
    @inbounds v.parent[i] = x
end

function Base.push!(v::ArrayWrapper, x)
    v.len += 1
    if v.len > length(v.parent)
        resize!(v.parent, v.len * 2)
    end
    v.parent[v.len] = x
    v
end

Base.empty!(v::ArrayWrapper) = (v.len = 0; v)

function Base.append!(v::ArrayWrapper, xs)
    ι_xs = eachindex(xs)        # allow generalized indexing
    l = length(ι_xs)
    if l ≤ 4
        for x in xs
            push!(v, x)
        end
    else
        L = l + v.len
        if length(v.parent) < L
            resize!(v.parent, nextpow(2, nextpow(2, L)))
        end
        @inbounds copyto!(v.parent, v.len + 1, xs, first(ι_xs), l)
        v.len += l
    end
    v
end

"""
    finish!(v)

Shrink the buffer `v` to its current content and return that vector.

!!! NOTE
    Consequences are undefined if you modify `v` after this.
"""
finish!(v::ArrayWrapper) = resize!(v.parent, v.len)

