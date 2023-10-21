#=
The `fix!` methods take a set of Observables, walk their connections, and return a set of methods that will update the Observables provided.
These methods unroll calls to the listeners of each Observable to make it easier to statically compile.
=#

using Observables

fix!(os::AbstractObservable...) = fix!(Set{AbstractObservable}(), os...)

function fix!(ctx::Set{AbstractObservable}, mc::Observables.MapCallback, val)
    set! = makenotify(ctx, mc.result).set![1]
    newargs = [:(Observables.to_value($a)) for a in mc.args]
    e = quote
        _ -> begin
            $set!($(mc.f)($(newargs...)))
            return Consume(false)
        end
    end
    return eval(e)
end
function fix!(ctx::Set{AbstractObservable}, oa::Observables.OnAny, val)
    newargs = [:(Observables.to_value($a)) for a in oa.args]
    e = quote
        _ -> begin
            $(oa.f)($(newargs...))
            return Consume(false)
        end
    end
    return eval(e)
end
function fix!(ctx::Set{AbstractObservable}, f::Function, val::T) where T
    rettype = code_typed(f, Tuple{T})[1][1].rettype
    if rettype != Consume
        f = x -> (f(x); Consume(false))
    end
    return f
end

function fix!(ctx::Set{AbstractObservable}, x...)
end

function fix!(ctx::Set{AbstractObservable}, observables::Observable...)
    setfuns = []
    notifies = []
    for observable in observables
        observable in ctx && continue
        push!(ctx, observable)
        mn = makenotify(ctx, observable)
        push!(setfuns,  mn.set!)
        push!(notifies, mn.notify)
    end
    return (; setfuns, notifies)
end

function makenotify(ctx::Set{AbstractObservable}, observable::Observable{T}) where T
    listeners = Observables.listeners(observable)
    invocations = Any[]
    for (_, f) in listeners
        newf = fix!(ctx, f, observable.val)
        push!(invocations, :(result = $newf(val)))
        push!(invocations, :(result.x && return true))
    end
    e = quote
        () -> begin
            val = $observable[]
            $(invocations...)
            return false
        end
    end
    nnotify = eval(e)
    set! = (val) -> begin
        if observable.ignore_equal_values
            isequal(observable.val, val) && return false
        end
        observable.val = val
        return nnotify()
    end
    return (notify = (nnotify,), set! = (set!, T))
end
