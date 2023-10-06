@static if VERSION ≥ v"1.9-"
    const CCCallInfo = Core.Compiler.CallInfo
else
    const CCCallInfo = Any
end    
    
function update!(ctx::CompilerContext, x, localtype = nothing)
    # TODO: check the type of x, compare that with the wasm type of localtype, and if they differ,
    #       convert one to the other. Hopefully, this is mainly Int32 -> Int64. 
    push!(ctx.body, x)
    if localtype !== nothing
        push!(ctx.locals, gettype(ctx, localtype))
        ctx.localidx += 1
    end
    _DEBUG_ && BinaryenExpressionPrint(x)
    return nothing
end

function setlocal!(ctx, idx, x; set = true, drop = false)
    T = ssatype(ctx, idx)
    if T != Union{} && set  # && T != Nothing && set # && T != Any
        ctx.varmap[idx] = ctx.localidx
        x = BinaryenLocalSet(ctx.mod, ctx.localidx, x)
        update!(ctx, x, T)
    else
        if drop
            x = BinaryenDrop(ctx.mod, x)
        end
        _DEBUG_ && BinaryenExpressionPrint(x)
        push!(ctx.body, x)
    end
end
function binaryfun(ctx, idx, bfuns, a, b; adjustsizes = true)
    ctx.varmap[idx] = ctx.localidx
    Ta = roottype(ctx, a)
    Tb = roottype(ctx, b)
    _a = _compile(ctx, a)
    _b = _compile(ctx, b)
    if adjustsizes && sizeof(Ta) !== sizeof(Tb)   # try to make the sizes the same, at least for Integers
        if sizeof(Ta) == 4
            _b = BinaryenUnary(ctx.mod, BinaryenWrapInt64(), _b)
        elseif sizeof(Ta) == 8
            _b = BinaryenUnary(ctx.mod, Tb <: Signed ? BinaryenExtendSInt32() : BinaryenExtendUInt32(), _b)
        end
    end
    x = BinaryenBinary(ctx.mod,
                       sizeof(Ta) < 8 && length(bfuns) > 1 ? bfuns[2]() : bfuns[1](),
                       _a,
                       _b)
    setlocal!(ctx, idx, x)
end
function unaryfun(ctx, idx, bfuns, a)
    x = BinaryenUnary(ctx.mod,
                      sizeof(roottype(ctx, a)) < 8 && length(bfuns) > 1 ? bfuns[2]() : bfuns[1](),
                      _compile(ctx, a))
    setlocal!(ctx, idx, x)
end
function binaryenfun(ctx, idx, bfun, args...; passall = false)
    x = bfun(ctx.mod, (passall ? a : _compile(ctx, a) for a in args)...)
    setlocal!(ctx, idx, x)
end


# Compile one block of code
function compile_block(ctx::CompilerContext, cfg::Core.Compiler.CFG, phis, idx)
    idxs = cfg.blocks[idx].stmts
    ci = ctx.ci
    ctx.body = BinaryenExpressionRef[]
    for idx in idxs
        node = ci.code[idx]
        _DEBUG_ && @show idx 
        _DEBUG_ && @show node

        if node isa Union{Core.GotoNode, Core.GotoIfNot, Core.PhiNode, Nothing}
            # do nothing

        elseif node == Core.ReturnNode()
            update!(ctx, BinaryenUnreachable(ctx.mod))

        elseif node isa Core.ReturnNode
            val = node.val isa GlobalRef ? Core.eval(node.val.mod, node.val.name) : 
                  node.val isa Core.Const ? node.val.val :
                  node.val
            update!(ctx, BinaryenReturn(ctx.mod, roottype(ctx, val) == Nothing ? C_NULL : _compile(ctx, val)))

        elseif node isa Core.PiNode
            fromT = roottype(ctx, node.val)
            toT = ssatype(ctx, idx)
            x = _compile(ctx, node.val)
            if fromT == Any # Need to cast to the right value
                x = BinaryenRefCast(ctx.mod, x, gettype(ctx, toT))
            end
            setlocal!(ctx, idx, x)

        ## Intrinsics ##

        elseif matchgr(node, :neg_int) do a
                T = roottype(ctx, a)
                binaryfun(ctx, idx, (BinaryenSubInt64, BinaryenSubInt32), T(0), a)
            end

        elseif matchgr(node, :neg_float) do a
                unaryfun(ctx, idx, (BinaryenNegFloat64, BinaryenNegFloat32), a)
            end

        elseif matchgr(node, :add_int) do a, b
                binaryfun(ctx, idx, (BinaryenAddInt64, BinaryenAddInt32), a, b)
            end

        elseif matchgr(node, :sub_int) do a, b
                binaryfun(ctx, idx, (BinaryenSubInt64, BinaryenSubInt32), a, b)
            end

        elseif matchgr(node, :mul_int) do a, b
                binaryfun(ctx, idx, (BinaryenMulInt64, BinaryenMulInt32), a, b)
            end

        elseif matchgr(node, :sdiv_int) do a, b
                binaryfun(ctx, idx, (BinaryenDivSInt64, BinaryenDivSInt32), a, b)
            end

        elseif matchgr(node, :checked_sdiv_int) do a, b
                binaryfun(ctx, idx, (BinaryenDivSInt64, BinaryenDivSInt32), a, b)
            end

        elseif matchgr(node, :udiv_int) do a, b
                binaryfun(ctx, idx, (BinaryenDivUInt64, BinaryenDivUInt32), a, b)
            end

        elseif matchgr(node, :checked_udiv_int) do a, b
                binaryfun(ctx, idx, (BinaryenDivUInt64, BinaryenDivUInt32), a, b)
            end

        elseif matchgr(node, :srem_int) do a, b
                binaryfun(ctx, idx, (BinaryenRemSInt64, BinaryenRemSInt32), a, b)
            end

        elseif matchgr(node, :checked_srem_int) do a, b    # LIES - it isn't checked
                binaryfun(ctx, idx, (BinaryenRemSInt64, BinaryenRemSInt32), a, b)
            end

        elseif matchgr(node, :urem_int) do a, b
                binaryfun(ctx, idx, (BinaryenRemUInt64, BinaryenRemUInt32), a, b)
            end

        elseif matchgr(node, :add_float) do a, b
                binaryfun(ctx, idx, (BinaryenAddFloat64, BinaryenAddFloat32), a, b)
            end

        elseif matchgr(node, :add_float_fast) do a, b
                binaryfun(ctx, idx, (BinaryenAddFloat64, BinaryenAddFloat32), a, b)
            end

        elseif matchgr(node, :sub_float) do a, b
                binaryfun(ctx, idx, (BinaryenSubFloat64, BinaryenSubFloat32), a, b)
            end

        elseif matchgr(node, :mul_float) do a, b
                binaryfun(ctx, idx, (BinaryenMulFloat64, BinaryenMulFloat32), a, b)
            end

        elseif matchgr(node, :mul_float_fast) do a, b
                binaryfun(ctx, idx, (BinaryenMulFloat64, BinaryenMulFloat32), a, b)
            end

        elseif matchgr(node, :muladd_float) do a, b, c
                ab = BinaryenBinary(ctx.mod,
                                    sizeof(roottype(ctx, a)) < 8 ? BinaryenMulFloat32() : BinaryenMulFloat64(),
                                    _compile(ctx, a),
                                    _compile(ctx, b))
                binaryfun(ctx, idx, (BinaryenAddFloat64, BinaryenAddFloat32), c, Pass(ab), adjustsizes = false)
            end

        elseif matchgr(node, :fma_float) do a, b, c
                ab = BinaryenBinary(ctx.mod,
                                    sizeof(roottype(ctx, a)) < 8 ? BinaryenMulFloat32() : BinaryenMulFloat64(),
                                    _compile(ctx, a),
                                    _compile(ctx, b))
                binaryfun(ctx, idx, (BinaryenAddFloat64, BinaryenAddFloat32), Pass(ab), c)
            end

        elseif matchgr(node, :div_float) do a, b
                binaryfun(ctx, idx, (BinaryenDivFloat64, BinaryenDivFloat32), a, b)
            end

        elseif matchgr(node, :div_float_fast) do a, b
                binaryfun(ctx, idx, (BinaryenDivFloat64, BinaryenDivFloat32), a, b)
            end

        elseif matchgr(node, :eq_int) do a, b
                binaryfun(ctx, idx, (BinaryenEqInt64, BinaryenEqInt32), a, b)
            end

        elseif matchgr(node, :(===)) do a, b
                if roottype(ctx, a) <: Integer
                    binaryfun(ctx, idx, (BinaryenEqInt64, BinaryenEqInt32), a, b)
                elseif roottype(ctx, a) <: AbstractFloat
                    binaryfun(ctx, idx, (BinaryenEqFloat64, BinaryenEqFloat32), a, b)
                elseif roottype(ctx, a) <: Union{String, Symbol}
                    x = BinaryenStringEq(ctx.mod, BinaryenStringEqEqual(), _compile(ctx, a), _compile(ctx, b))
                    setlocal!(ctx, idx, x)
                else
                    x = BinaryenRefEq(ctx.mod, _compile(ctx, a), _compile(ctx, b))
                    setlocal!(ctx, idx, x)
                end    
            end

        elseif matchgr(node, :ne_int) do a, b
                binaryfun(ctx, idx, (BinaryenNeInt64, BinaryenNeInt32), a, b)
            end

        elseif matchgr(node, :slt_int) do a, b
                binaryfun(ctx, idx, (BinaryenLtSInt64, BinaryenLtSInt32), a, b)
            end

        elseif matchgr(node, :ult_int) do a, b
                binaryfun(ctx, idx, (BinaryenLtUInt64, BinaryenLtUInt32), a, b)
            end

        elseif matchgr(node, :sle_int) do a, b
                binaryfun(ctx, idx, (BinaryenLeSInt64, BinaryenLeSInt32), a, b)
            end

        elseif matchgr(node, :ule_int) do a, b
                binaryfun(ctx, idx, (BinaryenLeUInt64, BinaryenLeUInt32), a, b)
            end

        elseif matchgr(node, :eq_float) do a, b
                binaryfun(ctx, idx, (BinaryenEqFloat64, BinaryenEqFloat32), a, b)
            end

        elseif matchgr(node, :fpiseq) do a, b
                binaryfun(ctx, idx, (BinaryenEqFloat64, BinaryenEqFloat32), a, b)
            end

        elseif matchgr(node, :ne_float) do a, b
                binaryfun(ctx, idx, (BinaryenNeFloat64, BinaryenNeFloat32), a, b)
            end

        elseif matchgr(node, :lt_float) do a, b
                binaryfun(ctx, idx, (BinaryenLtFloat64, BinaryenLtFloat32), a, b)
            end

        elseif matchgr(node, :le_float) do a, b
                binaryfun(ctx, idx, (BinaryenLeFloat64, BinaryenLeFloat32), a, b)
            end

        elseif matchgr(node, :and_int) do a, b
                binaryfun(ctx, idx, (BinaryenAndInt64, BinaryenAndInt32), a, b)
            end

        elseif matchgr(node, :or_int) do a, b
                binaryfun(ctx, idx, (BinaryenOrInt64, BinaryenOrInt32), a, b)
            end

        elseif matchgr(node, :xor_int) do a, b
                binaryfun(ctx, idx, (BinaryenXorInt64, BinaryenXorInt32), a, b)
            end

        elseif matchgr(node, :shl_int) do a, b
                binaryfun(ctx, idx, (BinaryenShlInt64, BinaryenShlInt32), a, b)
            end

        elseif matchgr(node, :lshr_int) do a, b
                binaryfun(ctx, idx, (BinaryenShrUInt64, BinaryenShrUInt32), a, b)
            end

        elseif matchgr(node, :ashr_int) do a, b
                binaryfun(ctx, idx, (BinaryenShrSInt64, BinaryenShrSInt32), a, b)
            end

        elseif matchgr(node, :ctpop_int) do a, b
                binaryfun(ctx, idx, (BinaryenPopcntInt64, BinaryenPopcntInt32), a, b)
            end

        elseif matchgr(node, :ctpop_int) do a, b
                binaryfun(ctx, idx, (BinaryenPopcntInt64, BinaryenPopcntInt32), a, b)
            end

        elseif matchgr(node, :copysign_float) do a, b
                binaryfun(ctx, idx, (BinaryenCopySignInt64, BinaryenCopySignInt32), a, b)
            end

        elseif matchgr(node, :not_int) do a
                Ta = roottype(ctx, a)
                if sizeof(Ta) == 8
                    x = BinaryenBinary(ctx.mod, BinaryenXorInt64(), _compile(ctx, a), _compile(ctx, Int64(-1)))
                    if ssatype(ctx, idx) <: Bool
                        x = BinaryenBinary(ctx.mod, BinaryenAndInt64(), x, _compile(ctx, UInt64(1)))
                    end
                else
                    x = BinaryenBinary(ctx.mod, BinaryenXorInt32(), _compile(ctx, a), _compile(ctx, Int32(-1)))
                    if ssatype(ctx, idx) <: Bool
                        x = BinaryenBinary(ctx.mod, BinaryenAndInt32(), x, _compile(ctx, UInt32(1)))
                    end
                end
                setlocal!(ctx, idx, x)
            end

        elseif matchgr(node, :ctlz_int) do a
                unaryfun(ctx, idx, (BinaryenClzInt64, BinaryenClzInt32), a)
        end

        elseif matchgr(node, :cttz_int) do a
                unaryfun(ctx, idx, (BinaryenCtzInt64, BinaryenCtzInt32), a)
        end

        ## I'm not sure these are right
        elseif matchgr(node, :sext_int) do a, b
                t = (roottype(ctx, a), roottype(ctx, b))
                sizeof(t[1]) == 8 && sizeof(t[2]) == 1 ? unaryfun(ctx, idx, (BinaryenExtendS8Int64,), b) :
                sizeof(t[1]) == 8 && sizeof(t[2]) == 2 ? unaryfun(ctx, idx, (BinaryenExtendS16Int64,), b) :
                sizeof(t[1]) == 8 && sizeof(t[2]) == 4 ? unaryfun(ctx, idx, (BinaryenExtendSInt32,), b) :
                sizeof(t[1]) == 4 && sizeof(t[2]) == 1 ? unaryfun(ctx, idx, (BinaryenExtendS8Int32,), b) :
                sizeof(t[1]) == 4 && sizeof(t[2]) == 2 ? unaryfun(ctx, idx, (BinaryenExtendS16Int32,), b) :
                error("Unsupported `sext_int` types $t")
            end

        elseif matchgr(node, :zext_int) do a, b
                t = (roottype(ctx, a), roottype(ctx, b))
                sizeof(t[1]) == 4 && sizeof(t[2]) <= 4 ? b :
                sizeof(t[1]) == 8 && sizeof(t[2]) <= 4 ? unaryfun(ctx, idx, (BinaryenExtendUInt32,), b) :
                error("Unsupported `zext_int` types $t")
            end

        elseif matchgr(node, :trunc_int) do a, b
                t = (roottype(ctx, a), roottype(ctx, b))
                t == (Int32, Int64) ? unaryfun(ctx, idx, (BinaryenWrapInt64,), b) :
                t == (Int32, UInt64) ? unaryfun(ctx, idx, (BinaryenWrapInt64,), b) :
                t == (UInt32, UInt64) ? unaryfun(ctx, idx, (BinaryenWrapInt64,), b) :
                t == (UInt32, Int64) ? unaryfun(ctx, idx, (BinaryenWrapInt64,), b) :
                t == (UInt8, UInt64) ? unaryfun(ctx, idx, (BinaryenWrapInt64,), b) :
                t == (UInt8, Int64) ? unaryfun(ctx, idx, (BinaryenWrapInt64,), b) :
                error("Unsupported `trunc_int` types $t")
            end

        elseif matchgr(node, :flipsign_int) do a, b
                Ta = eltype(roottype(ctx, a))
                Tb = eltype(roottype(ctx, b))
                # check the sign of b
                if sizeof(Ta) == 8
                    isnegative = BinaryenUnary(ctx.mod, BinaryenWrapInt64(), BinaryenBinary(ctx.mod, BinaryenShrUInt64(), _compile(ctx, b), _compile(ctx, UInt64(63))))
                    x = BinaryenIf(ctx.mod, isnegative, 
                                   BinaryenBinary(ctx.mod, BinaryenMulInt64(), _compile(ctx, a), _compile(ctx, Int64(-1))), 
                                   _compile(ctx, a))                                
                else
                    isnegative = BinaryenBinary(ctx.mod, BinaryenShrUInt32(), _compile(ctx, b), _compile(ctx, UInt32(31)))
                    x = BinaryenIf(ctx.mod, isnegative, 
                                   BinaryenBinary(ctx.mod, BinaryenMulInt32(), _compile(ctx, a), _compile(ctx, Int32(-1))), 
                                   _compile(ctx, a))                                
                end
                setlocal!(ctx, idx, x)
            end

        elseif matchgr(node, :fptoui) do a, b
                t = (roottype(ctx, a), roottype(ctx, b))
                t == (UInt64, Float32) ? unaryfun(ctx, idx, (BinaryenTruncSatUFloat32ToInt64,), b) :
                t == (UInt64, Float64) ? unaryfun(ctx, idx, (BinaryenTruncSatUFloat64ToInt64,), b) :
                t == (UInt32, Float32) ? unaryfun(ctx, idx, (BinaryenTruncSatUFloat32ToInt32,), b) :
                t == (UInt32, Float64) ? unaryfun(ctx, idx, (BinaryenTruncSatUFloat64ToInt32,), b) :
                error("Unsupported `fptoui` types")
            end

        elseif matchgr(node, :fptosi) do a, b
                t = (roottype(ctx, a), roottype(ctx, b))
                t == (Int64, Float32) ? unaryfun(ctx, idx, (BinaryenTruncSatSFloat32ToInt64,), b) :
                t == (Int64, Float64) ? unaryfun(ctx, idx, (BinaryenTruncSatSFloat64ToInt64,), b) :
                t == (Int32, Float32) ? unaryfun(ctx, idx, (BinaryenTruncSatSFloat32ToInt32,), b) :
                t == (Int32, Float64) ? unaryfun(ctx, idx, (BinaryenTruncSatSFloat64ToInt32,), b) :
                error("Unsupported `fptosi` types")
            end

        elseif matchgr(node, :uitofp) do a, b
                t = (roottype(ctx, a), roottype(ctx, b))
                t == (Float64, UInt32) ? unaryfun(ctx, idx, (BinaryenConvertUInt32ToFloat64,), b) :
                t == (Float64, UInt64) ? unaryfun(ctx, idx, (BinaryenConvertUInt64ToFloat64,), b) :
                t == (Float32, UInt32) ? unaryfun(ctx, idx, (BinaryenConvertUInt32ToFloat32,), b) :
                t == (Float32, UInt64) ? unaryfun(ctx, idx, (BinaryenConvertUInt64ToFloat32,), b) :
                error("Unsupported `uitofp` types")
            end

        elseif matchgr(node, :sitofp) do a, b
                t = (roottype(ctx, a), roottype(ctx, b))
                t == (Float64, Int32) ? unaryfun(ctx, idx, (BinaryenConvertSInt32ToFloat64,), b) :
                t == (Float64, Int64) ? unaryfun(ctx, idx, (BinaryenConvertSInt64ToFloat64,), b) :
                t == (Float32, Int32) ? unaryfun(ctx, idx, (BinaryenConvertSInt32ToFloat32,), b) :
                t == (Float32, Int64) ? unaryfun(ctx, idx, (BinaryenConvertSInt64ToFloat32,), b) :
                error("Unsupported `sitofp` types")
            end

        elseif matchgr(node, :fptrunc) do a, b
                t = (roottype(ctx, a), roottype(ctx, b))
                t == (Float32, Float64) ? unaryfun(ctx, idx, (BinaryenDemoteFloat64,), b) :
                error("Unsupported `fptrunc` types")
            end

        elseif matchgr(node, :fpext) do a, b
                t = (roottype(ctx, a), roottype(ctx, b))
                t == (Float64, Float32) ? unaryfun(ctx, idx, (BinaryenPromoteFloat32,), b) :
                error("Unsupported `fpext` types")
            end

        elseif matchgr(node, :ifelse) do cond, a, b
                binaryenfun(ctx, idx, BinaryenIf, cond, a, b)
            end

        elseif matchgr(node, :abs_float) do a
                unaryfun(ctx, idx, (BinaryenAbsFloat64, BinaryenAbsFloat32), a)
            end

        elseif matchgr(node, :ceil_llvm) do a
                unaryfun(ctx, idx, (BinaryenCeilFloat64, BinaryenCeilFloat32), a)
            end

        elseif matchgr(node, :floor_llvm) do a
                unaryfun(ctx, idx, (BinaryenFloorFloat64, BinaryenFloorFloat32), a)
            end

        elseif matchgr(node, :trunc_llvm) do a
                unaryfun(ctx, idx, (BinaryenTruncFloat64, BinaryenTruncFloat32), a)
            end

        elseif matchgr(node, :rint_llvm) do a
                unaryfun(ctx, idx, (BinaryenNearestFloat64, BinaryenNearestFloat32), a)
            end

        elseif matchgr(node, :sqrt_llvm) do a
                unaryfun(ctx, idx, (BinaryenSqrtFloat64, BinaryenSqrtFloat32), a)
            end

        elseif matchgr(node, :sqrt_llvm_fast) do a
                unaryfun(ctx, idx, (BinaryenSqrtFloat64, BinaryenSqrtFloat32), a)
            end

        elseif matchgr(node, :have_fma) do a
                setlocal!(ctx, idx, _compile(ctx, Int32(0)))
            end

        elseif matchgr(node, :bitcast) do t, val
                T = roottype(ctx, t)
                Tval =  roottype(ctx, val)
                T == Float64 && Tval <: Integer ? unaryfun(ctx, idx, (BinaryenReinterpretInt64,), val) :
                T == Float32 && Tval <: Integer ? unaryfun(ctx, idx, (BinaryenReinterpretInt32,), val) :
                T <: Integer && sizeof(T) == 8 && Tval <: AbstractFloat ? unaryfun(ctx, idx, (BinaryenReinterpretFloat64,), val) :
                T <: Integer && sizeof(T) == 4 && Tval <: AbstractFloat ? unaryfun(ctx, idx, (BinaryenReinterpretFloat32,), val) :
                T <: Integer && Tval <: Integer ? setlocal!(ctx, idx, _compile(ctx, val)) :
                # T <: Integer && Tval :: Char    ? unaryfun(ctx, idx, (BinaryenReinterpretInt32,), val) :
                error("Unsupported `bitcast` types, ($T, $Tval)")
            end

        ## TODO
        # ADD_I(cglobal, 2) \

        ## Builtins / key functions ##

        elseif matchgr(node, :arrayref) do bool, arraywrapper, i
                buffer = getbuffer(ctx, arraywrapper)
                # signed = eT <: Signed && sizeof(eT) < 4
                signed = false
                ## subtract one from i for zero-based indexing in WASM
                i = BinaryenBinary(ctx.mod, BinaryenAddInt32(), _compile(ctx, I32(i)), _compile(ctx, Int32(-1)))
                binaryenfun(ctx, idx, BinaryenArrayGet, buffer, i, gettype(ctx, roottype(ctx, arraywrapper)), Pass(signed))
            end

        elseif matchgr(node, :arrayset) do bool, arraywrapper, val, i
                buffer = getbuffer(ctx, arraywrapper)
                i = BinaryenBinary(ctx.mod, BinaryenAddInt32(), _compile(ctx, I32(i)), _compile(ctx, Int32(-1)))
                x = _compile(ctx, val)
                aT = eltype(roottype(ctx, arraywrapper))
                if aT == Any  # Box if needed
                    x = box(ctx, x, roottype(ctx, val))
                end         
                x = BinaryenArraySet(ctx.mod, buffer, i, x)
                update!(ctx, x)
            end

        elseif matchgr(node, :arraylen) do arraywrapper
                x = BinaryenStructGet(ctx.mod, 1, _compile(ctx, arraywrapper), C_NULL, false)
                if sizeof(Int) == 8 # extend to Int64
                    unaryfun(ctx, idx, (BinaryenExtendUInt32,), x)
                else
                    setlocal!(ctx, idx, x)
                end
            end

        elseif matchgr(node, :arraysize) do arraywrapper, n
                x = BinaryenStructGet(ctx.mod, 1, _compile(ctx, arraywrapper), C_NULL, false)
                if sizeof(Int) == 8 # extend to Int64
                    unaryfun(ctx, idx, (BinaryenExtendUInt32,), x)
                else
                    setlocal!(ctx, idx, x)
                end
            end

        elseif matchforeigncall(node, :jl_alloc_array_1d) do args
                elT = eltype(args[1])
                size = _compile(ctx, I32(args[6]))
                arraytype = BinaryenTypeGetHeapType(gettype(ctx, Buffer{elT}))
                buffer = BinaryenArrayNew(ctx.mod, arraytype, size, _compile(ctx, arraydefault(elT)))
                wrappertype = BinaryenTypeGetHeapType(gettype(ctx, FakeArrayWrapper{elT}))
                binaryenfun(ctx, idx, BinaryenStructNew, [buffer, size], UInt32(2), wrappertype; passall = true)
            end

        elseif matchforeigncall(node, :jl_array_grow_end) do args
                arraywrapper = args[5]
                elT = eltype(roottype(ctx, args[5]))
                arraytype = gettype(ctx, Buffer{elT})
                arrayheaptype = BinaryenTypeGetHeapType(arraytype)
                arraywrappertype = gettype(ctx, Vector{elT})
                _arraywrapper = _compile(ctx, arraywrapper)
                buffer = getbuffer(ctx, args[5])
                bufferlen = BinaryenArrayLen(ctx.mod, buffer)
                extralen = _compile(ctx, I32(args[6]))
                arraylen = BinaryenStructGet(ctx.mod, 1, _arraywrapper, C_NULL, false)
                newlen = BinaryenBinary(ctx.mod, BinaryenAddInt32(), arraylen, extralen)
                newbufferlen = BinaryenBinary(ctx.mod, BinaryenMulInt32(), newlen, _compile(ctx, I32(2)))
                neednewbuffer = BinaryenBinary(ctx.mod, BinaryenLeUInt32(), arraylen, newlen)
                newbufferget = BinaryenLocalGet(ctx.mod, ctx.localidx, arraytype)
                newbufferblock = [
                    BinaryenLocalSet(ctx.mod, ctx.localidx, BinaryenArrayNew(ctx.mod, arrayheaptype, newbufferlen, _compile(ctx, arraydefault(elT)))),
                    BinaryenArrayCopy(ctx.mod, newbufferget, _compile(ctx, I32(0)), buffer, _compile(ctx, I32(0)), _compile(ctx, arraylen)),
                    BinaryenStructSet(ctx.mod, 0, _arraywrapper, newbufferget),
                ]
                push!(ctx.locals, arraytype)
                ctx.localidx += 1
                x = BinaryenIf(ctx.mod, neednewbuffer,
                               BinaryenBlock(ctx.mod, "newbuff", newbufferblock, length(newbufferblock), BinaryenTypeAuto()), 
                               C_NULL)
                update!(ctx, x)
                x = BinaryenStructSet(ctx.mod, 1, _arraywrapper, newlen)
                update!(ctx, x)
            end

        elseif matchforeigncall(node, :jl_array_del_end) do args
                arraywrapper = _compile(ctx, args[5])
                i = _compile(ctx, I32(args[6]))
                arraylen = BinaryenStructGet(ctx.mod, 1, arraywrapper, C_NULL, false)
                newlen = BinaryenBinary(ctx.mod, BinaryenSubInt32(), arraylen, i)
                x = BinaryenStructSet(ctx.mod, 1, arraywrapper, newlen)
                update!(ctx, x)
            end

        elseif matchforeigncall(node, :_jl_array_copy) do args
                srcbuffer = getbuffer(ctx, args[5])
                destbuffer = getbuffer(ctx, args[6])
                n = args[7]
                x = BinaryenArrayCopy(ctx.mod, destbuffer, _compile(ctx, I32(0)), srcbuffer, _compile(ctx, I32(0)), _compile(ctx, n))
                update!(ctx, x)
            end

        elseif matchforeigncall(node, :_jl_array_copyto) do args
                destbuffer = getbuffer(ctx, args[5])
                doffs = _compile(ctx, args[6])
                srcbuffer = getbuffer(ctx, args[7])
                soffs = _compile(ctx, args[8])
                n = _compile(ctx, args[9])
                x = BinaryenArrayCopy(ctx.mod, destbuffer, doffs, srcbuffer, soffs, n)
                update!(ctx, x)
                setlocal!(ctx, idx, _compile(ctx, args[5]))
            end

        elseif matchgr(node, :getfield) || matchcall(node, getfield)
            x = node.args[2]
            index = node.args[3]
            T = basetype(ctx, x)
            if T <: NTuple
                # unsigned = eltype(T) <: Unsigned
                unsigned = true
                ## subtract one from i for zero-based indexing in WASM
                i = BinaryenBinary(ctx.mod, BinaryenAddInt32(), 
                                   _compile(ctx, I32(index)), 
                                   _compile(ctx, Int32(-1)))
                binaryenfun(ctx, idx, BinaryenArrayGet, _compile(ctx, x), Pass(i), gettype(ctx, eltype(T)), Pass(!unsigned))
            elseif roottype(ctx, index) <: Integer
                # if length(node.args) == 3   # 2-arg version
                    eT = Base.datatype_fieldtypes(T)[index]
                    # unsigned = eT <: Unsigned
                    unsigned = true
                    binaryenfun(ctx, idx, BinaryenStructGet, UInt32(index - 1), _compile(ctx, x), gettype(ctx, eT), !unsigned, passall = true)
                # else   # 3-arg version
                # end
            else
                field = index
                nT = T <: Type ? DataType : T     # handle Types
                index = UInt32(findfirst(x -> x == field.value, fieldnames(nT)) - 1)
                eT = Base.datatype_fieldtypes(nT)[index + 1]
                # unsigned = eT <: Unsigned
                unsigned = true
                binaryenfun(ctx, idx, BinaryenStructGet, index, _compile(ctx, x), gettype(ctx, eT), !unsigned, passall = true)
            end
    
        ## 3-arg version of getfield for integer field access
        elseif matchgr(node, :getfield) do x, index, bool
                T = roottype(ctx, x)
                if T <: NTuple
                    # unsigned = eltype(T) <: Unsigned
                    unsigned = true
                    ## subtract one from i for zero-based indexing in WASM
                    i = BinaryenBinary(ctx.mod, BinaryenAddInt32(), 
                                       _compile(ctx, I32(index)), 
                                       _compile(ctx, Int32(-1)))

                    binaryenfun(ctx, idx, BinaryenArrayGet, _compile(ctx, x), Pass(i), gettype(ctx, eltype(T)), Pass(!unsigned))
                else
                    eT = Base.datatype_fieldtypes(T)[_compile(ctx, index)]
                    # unsigned = eT <: Unsigned
                    unsigned = true
                    binaryenfun(ctx, idx, BinaryenStructGet, UInt32(index - 1), _compile(ctx, x), gettype(ctx, eT), !unsigned, passall = true)
                end
            end

        elseif matchgr(node, :setfield!) do x, field, value
                if field isa QuoteNode && field.value isa Symbol
                    T = roottype(ctx, x)
                    index = UInt32(findfirst(x -> x == field.value, fieldnames(T)) - 1)
                elseif field isa Integer
                    index = UInt32(field)
                else
                    error("setfield! indexing with $field is not supported in $node.")
                end
                x = BinaryenStructSet(ctx.mod, index, _compile(ctx, x), _compile(ctx, value))
                update!(ctx, x)
            end
        

        elseif node isa Expr && (node.head == :new || (node.head == :call && node.args[1] isa GlobalRef && node.args[1].name == :tuple))
            nargs = UInt32(length(node.args) - 1)
            args = [_compile(ctx, x) for x in node.args[2:end]]
            jtype = ssatype(ctx, idx)
            if jtype isa GlobalRef
                jtype = jtype.mod.eval(jtype.name)
            end
            type = BinaryenTypeGetHeapType(gettype(ctx, jtype))
            # BinaryenModuleSetTypeName(ctx.mod, type, string(jtype))
            if jtype <: NTuple
                values = [_compile(ctx, v) for v in node.args[2:end]]
                N = Int32(length(node.args) - 1)
                binaryenfun(ctx, idx, BinaryenArrayNewFixed, type, values, N; passall = true)
            else
                x = BinaryenStructNew(ctx.mod, args, nargs, type)
                binaryenfun(ctx, idx, BinaryenStructNew, args, nargs, type; passall = true)
                # for (i,name) in enumerate(fieldnames(jtype))
                #     BinaryenModuleSetFieldName(ctx.mod, type, i - 1, string(name))
                # end
            end

        elseif node isa Expr && node.head == :call && node.args[1] isa GlobalRef && node.args[1].name == :tuple
            ## need to cover NTuple case -> fixed array
            T = ssatype(ctx, idx)
            if T <: NTuple
                arraytype = BinaryenTypeGetHeapType(gettype(ctx, typeof(x)))
                values = [_compile(ctx, v) for v in node.args[2:end]]
                N = _compile(ctx, Int32(length(node.args) - 1))
                binaryenfun(ctx, idx, BinaryenArrayNewFixed, arraytype, values, N; passall = true)
            else
                nargs = UInt32(length(node.args) - 1)
                args = [_compile(ctx, x) for x in node.args[2:end]]
                jtype = node.args[1]
                type = BinaryenTypeGetHeapType(gettype(ctx, jtype))
                x = BinaryenStructNew(ctx.mod, args, nargs, type)
                binaryenfun(ctx, idx, BinaryenStructNew, args, nargs, type; passall = true)
            end

        elseif node isa Expr && node.head == :call && 
               ((node.args[1] isa GlobalRef && node.args[1].name == :llvmcall) ||
                node.args[1] == Core.Intrinsics.llvmcall)
            jscode = node.args[2]
            internalfun = jscode[1] == '$'
            jlrettype = eval(node.args[3])
            rettype = gettype(ctx, jlrettype)
            if jlrettype == Nothing
                rettype = gettype(ctx, Union{})
            end
            typeparameters = node.args[4].parameters
            name = internalfun ? jscode[2:end] : validname(string(jscode, jlrettype, typeparameters...))
            sig = node.args[5:end]
            jparams = [gettype(ctx, T) for T in typeparameters]
            bparams = BinaryenTypeCreate(jparams, length(jparams))
            args = [_compile(ctx, x) for x in sig]
            if !internalfun
                if !haskey(ctx.imports, name)
                    BinaryenAddFunctionImport(ctx.mod, name, "js", jscode, bparams, rettype)
                    ctx.imports[name] = jscode
                elseif ctx.imports[name] != name
                    # error("Mismatch in llvmcall import for $name: $sig vs. $(ctx.imports[name]).")
                end
            end
            x = BinaryenCall(ctx.mod, name, args, length(args), rettype)
            if jlrettype == Nothing
                push!(ctx.body, x)
            else
                setlocal!(ctx, idx, x)
            end

        elseif node isa Expr && node.head == :invoke
            T = node.args[1].specTypes.parameters[1]
            if isa(DomainError, T) ||
               isa(InexactError, T) ||
               isa(ArgumentError, T) ||
               isa(OverflowError, T) ||
               isa(AssertionError, T) ||
               isa(Base.throw_domerr_powbysq, T) ||
               isa(Core.throw_inexacterror, T) ||
               isa(Base.Math.throw_complex_domainerror, T)
                # skip errors
                continue
            end
            origsig = node.args[1].specTypes
            argtypes = [basetype(ctx, x) for x in node.args[2:end]]
            # Get the specialized method for this invocation
            TT = Tuple{argtypes...}
            match = Base._which(TT)
            # mi = Core.Compiler.specialize_method(match; preexisting=true)
            mi = Core.Compiler.specialize_method(match)
            sig = mi.specTypes
            newci = Base.code_typed_by_type(mi.specTypes, interp = StaticInterpreter())[1][1]
            newsig = newci.parent.specTypes
            # Filter out unused arguments (slotflag & 0x08)
            used = argsused(newci)
            s = node.args[1].def.sig
            if newci.parent.def.isva     # varargs
                jargs = node.args[2:length(used)][used[1:end-1]]   # up to the last arg which is a vararg
                args = [_compile(ctx, x) for x in jargs]
                n = length(newci.slottypes[end].parameters)
                push!(args, _compile(ctx, tuple((x for x in node.args[end-n+1:end])...)))
                np = newsig.parameters
                newsig = Tuple{np[1:end-n]..., Tuple{np[end-n+1:end]...}}
            else
                jargs = node.args[2:end][used]
                args = [_compile(ctx, x) for x in jargs]
            end
            if haskey(ctx.names, newsig)
                name = ctx.names[newsig]
            else
                _DEBUG_ && @show newsig
                _DEBUG_ && @show newci
                name = validname(string("julia_", node.args[1].def.name, newsig.parameters[2:end]...))[1:min(end,255)]
                ctx.sigs[name] = newsig
                ctx.names[newsig] = name
                newci.parent.specTypes = newsig
                compile_method(CompilerContext(ctx, newci))
            end
            # `set` controls whether a local variable is set to the return value.
            # ssarettype == Any normally means that the return type isn't used.
            # It can sometimes be Any if the method really does return Any, 
            # so compare against the real return type. 
            wrettype = gettype(ctx, newci.rettype == Nothing ? Union{} : newci.rettype)
            ssarettype = ssatype(ctx, idx)
            drop = ssarettype == Any && newci.rettype != Nothing
            set = ssarettype != Nothing && (ssarettype != Any || ssarettype == newci.rettype)
            setlocal!(ctx, idx, BinaryenCall(ctx.mod, name, args, length(args), wrettype); set, drop)

        elseif node isa Expr && node.head == :call && node.args[1] isa GlobalRef && node.args[1].name == :isa    # val isa T
            T = node.args[3]
            wT = gettype(ctx, T)   # do I need heap type here?
            val = _compile(ctx, node.args[2])
            x = BinaryenRefTest(ctx.mod, val, wT)
            setlocal!(ctx, idx, x)

        # DECLARE_BUILTIN(applicable);
        # DECLARE_BUILTIN(_apply_iterate);
        # DECLARE_BUILTIN(_apply_pure);
        # DECLARE_BUILTIN(apply_type);
        # DECLARE_BUILTIN(_call_in_world);
        # DECLARE_BUILTIN(_call_in_world_total);
        # DECLARE_BUILTIN(_call_latest);
        # DECLARE_BUILTIN(replacefield);
        # DECLARE_BUILTIN(const_arrayref);
        # DECLARE_BUILTIN(_expr);
        # DECLARE_BUILTIN(fieldtype);
        # DECLARE_BUILTIN(is);
        # DECLARE_BUILTIN(isa);
        # DECLARE_BUILTIN(isdefined);
        # DECLARE_BUILTIN(issubtype);
        # DECLARE_BUILTIN(modifyfield);
        # DECLARE_BUILTIN(nfields);
        # DECLARE_BUILTIN(sizeof);
        # DECLARE_BUILTIN(svec);
        # DECLARE_BUILTIN(swapfield);
        # DECLARE_BUILTIN(throw);
        # DECLARE_BUILTIN(typeassert);
        # DECLARE_BUILTIN(_typebody);
        # DECLARE_BUILTIN(typeof);
        # DECLARE_BUILTIN(_typevar);
        # DECLARE_BUILTIN(donotdelete);
        # DECLARE_BUILTIN(compilerbarrier);
        # DECLARE_BUILTIN(getglobal);
        # DECLARE_BUILTIN(setglobal);
        # DECLARE_BUILTIN(finalizer);
        # DECLARE_BUILTIN(_compute_sparams);
        # DECLARE_BUILTIN(_svec_ref);

        ## Other ##

        elseif node isa GlobalRef
            setlocal!(ctx, idx, getglobal(ctx, node.mod, node.name))
            
        elseif node isa Expr
            # ignore other expressions for now
            # println("----------------------------------------------------------------")
            # @show idx node
            # dump(node)
            # println("----------------------------------------------------------------")

        else
            error("Unsupported Julia construct $node")
        end
    end
    if haskey(phis, idx)
        for (i, var) in phis[idx]
            push!(ctx.body, BinaryenLocalSet(ctx.mod, ctx.varmap[i], _compile(ctx, var)))
        end
    end
    body = BinaryenBlock(ctx.mod, "body", ctx.body, length(ctx.body), BinaryenTypeAuto())
    return body
end

