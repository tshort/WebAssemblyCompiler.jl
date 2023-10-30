#=
The `fix!` methods take a set of Observables, walk their connections, and return a set of methods that will update the Observables provided.
These methods unroll calls to the listeners of each Observable to make it easier to statically compile.
=#

using Observables

fix!(os::AbstractObservable...) = fix!(Set{AbstractObservable}(), os...)

function fix!(ctx::Set{AbstractObservable}, x...)
end

function fix!(ctx::Set{AbstractObservable}, observables::Observable...)
    setfuns = []
    notifies = []
    for observable in observables
        observable in ctx && continue
        push!(ctx, observable)
        push!(setfuns, (makeset(ctx, observable), typeof(observable.val)))
    end
    return setfuns
end
function makeset(ctx::Set{AbstractObservable}, o::Observable)
    listeners = tuple((fix!(ctx, l[2]) for l in o.listeners)...)
    return val -> begin
        o.val = Observables.to_value(val)
        nnotify(o, listeners...)
    end
end
function fix!(ctx::Set{AbstractObservable}, oa::Observables.OnAny)
    return OnAnyHolder(oa.f, tuple(oa.args...))
    return val -> begin
        f(valargs(args...)...)
        return Consume(false)
    end
end
mutable struct OnAnyHolder{F,A}
    f::F
    args::A
end
function (x::OnAnyHolder)(val)
    x.f(valargs(x.args...)...)
    return Consume(false)
end

function fix!(ctx::Set{AbstractObservable}, mc::Observables.MapCallback)
    set! = makeset(ctx, mc.result)
    result = mc.result
    resultlisteners = tuple((fix!(ctx, l[2]) for l in result.listeners)...)
    return MapCallbackHolder(mc.result, mc.f, tuple(mc.args...), resultlisteners)
end

mutable struct MapCallbackHolder{O,F,A,L}
    result::O
    f::F
    args::A
    listeners::L
end
function (x::MapCallbackHolder)(val)
    x.result.val = x.f(valargs(x.args...)...)
    nnotify(x.result, x.listeners...)
    return Consume(false)
end

@inline valargs() = ()
@inline valargs(x) = (Observables.to_value(x),)
@inline valargs(x, xs...) = (Observables.to_value(x), valargs(xs...)...)

@inline nnotify(o::Observable) = nothing
@inline nnotify(::Nothing) = nothing
@inline function nnotify(o::Observable, f)
    result = f(o.val)
    result.x && return true
    return false
end
@inline function nnotify(o::Observable, f, fs...)
    nnotify(o, f)
    nnotify(o, fs...)
    return false
end

# a = Observable(2)
# b = map(x -> 2x, a)
# c = map(x -> 2x, b)
# d = map((x,y) -> x + y, a, b)
# x = Observable(3)
# y = map((b,x) -> b * x, b, x)
# onany((a,b) -> display(a+b), a, b)

# fs = fix!(a, x)
# @show fs[1][1](5)
# @show a
# @show b
# @show c
# @show d
# @show fs[2][1](10)
# @show x
# @show y
