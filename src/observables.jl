using Observables

fix!(o::Observable) = fix!(Set{Observable}(), o)

function fix!(ctx::Set{Observable}, o::Observable{T}) where T
    o in ctx && return
    @show o
    push!(ctx, o)
    ls = Observables.listeners(o)
    for i in eachindex(ls) 
        ls[i] = ls[i].first => fix!(ctx, ls[i].second, o.val)
    end
    return
end

function fix!(ctx::Set{Observable}, f::Observables.MapCallback, val::T) where T
    fix!(ctx, f.result)
    @show f
    return f
    # for a in f.args
    #     fix!(ctx, a)
    # end
    # return FunctionWrappers.FunctionWrapper{Any, Tuple{T}}(f)
end

function fix!(ctx::Set{Observable}, f::Function, val::T) where T
    rettype = code_typed(f, Tuple{T})[1][1].rettype
    if rettype != Consume
        f = x -> (f(x); Consume(false))
    end
    # return FunctionWrappers.FunctionWrapper{Any, Tuple{T}}(f)
    return f
end

function fix!(ctx::Set{Observable}, x...)
end

#=
Everything is frozen here, so could we unroll this?
It gives a new meaning to `comptime`.
Instead of running after we have types, we mean after it has values, too.
We could compile specific code for each notification.
It seems like `eval` could work.
=#

@inline function Base.notify(observable::AbstractObservable)
    val = observable[]
    for (_, f) in Observables.listeners(observable)::Vector{Pair{Int, Any}}
        result = f(val)
        if result.x
            return true
        end
    end
    return false
end

@inline function (mc::MapCallback)(value)
    mc.result[] = mc.f(map(to_value, mc.args)...)
    return Consume(false)
end

@testitem "Observables" begin
using Test
using WebAssemblyCompiler

#=
Needs:

* _compile for functions in arrays or structs
  - Can't really trigger compilation because it doesn't know the input types. 
  - Actually, do we need this at all?
  - It might be nice to have helpers for other cases where we have an array of functions.

* _compile for observables triggers fix!. 
  - Can _compile(o) or fix!(o) trigger compilation of methods? 
    - It knows the input types, and it follows the path of execution.
=#

#=
Tangent:

Could we use `meta` to direct our compiler to do things?
=#
function ffun(x)
Expr(:meta, :unroll,
quote
    for (_, f) in Observables.listeners(observable)::Vector{Pair{Int, Any}}
        result = f(val)
        if result.x
            return true
        end
    end
end)
2x
end
#=
Another Approach:

Use a function to generate a function.

Where do we compile the listeners? Here?
=#
function makenotify(observable::AbstractObservable)
    ls = Observables.listeners(observable)
    invocations = Any[]
    for (_, f) in listeners
        push!(invocations, :(f(val)))
        push!(invocations, :(result.x && return true))
    end
    return eval(quote
        o -> begin
            val = o[]
            $(invocations...)
            return false
        end
    end)
end


a = Observable(0.0)
b = map(sin, a)
c = map(x -> round(Int, x), b)
d = map(x -> 2x, c)

fix!(a)
end


function top(x)
    inside(x) = 2x
    inside(3x)
end
