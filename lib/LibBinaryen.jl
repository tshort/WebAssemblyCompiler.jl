module LibBinaryen

using Binaryen_jll
export Binaryen_jll

using CEnum

"""
Expression ids (call to get the value of each; you can cache them)
"""
const BinaryenExpressionId = UInt32

"""
BinaryenIndex

Used for internal indexes and list sizes.
"""
const BinaryenIndex = UInt32

"""
Core types (call to get the value of each; you can cache them, they
never change)
"""
const BinaryenType = Csize_t

function BinaryenTypeNone()
    ccall((:BinaryenTypeNone, libbinaryen), BinaryenType, ())
end

function BinaryenTypeInt32()
    ccall((:BinaryenTypeInt32, libbinaryen), BinaryenType, ())
end

function BinaryenTypeInt64()
    ccall((:BinaryenTypeInt64, libbinaryen), BinaryenType, ())
end

function BinaryenTypeFloat32()
    ccall((:BinaryenTypeFloat32, libbinaryen), BinaryenType, ())
end

function BinaryenTypeFloat64()
    ccall((:BinaryenTypeFloat64, libbinaryen), BinaryenType, ())
end

function BinaryenTypeVec128()
    ccall((:BinaryenTypeVec128, libbinaryen), BinaryenType, ())
end

function BinaryenTypeFuncref()
    ccall((:BinaryenTypeFuncref, libbinaryen), BinaryenType, ())
end

function BinaryenTypeExternref()
    ccall((:BinaryenTypeExternref, libbinaryen), BinaryenType, ())
end

function BinaryenTypeAnyref()
    ccall((:BinaryenTypeAnyref, libbinaryen), BinaryenType, ())
end

function BinaryenTypeEqref()
    ccall((:BinaryenTypeEqref, libbinaryen), BinaryenType, ())
end

function BinaryenTypeI31ref()
    ccall((:BinaryenTypeI31ref, libbinaryen), BinaryenType, ())
end

function BinaryenTypeStructref()
    ccall((:BinaryenTypeStructref, libbinaryen), BinaryenType, ())
end

function BinaryenTypeArrayref()
    ccall((:BinaryenTypeArrayref, libbinaryen), BinaryenType, ())
end

function BinaryenTypeStringref()
    ccall((:BinaryenTypeStringref, libbinaryen), BinaryenType, ())
end

function BinaryenTypeStringviewWTF8()
    ccall((:BinaryenTypeStringviewWTF8, libbinaryen), BinaryenType, ())
end

function BinaryenTypeStringviewWTF16()
    ccall((:BinaryenTypeStringviewWTF16, libbinaryen), BinaryenType, ())
end

function BinaryenTypeStringviewIter()
    ccall((:BinaryenTypeStringviewIter, libbinaryen), BinaryenType, ())
end

function BinaryenTypeNullref()
    ccall((:BinaryenTypeNullref, libbinaryen), BinaryenType, ())
end

function BinaryenTypeNullExternref()
    ccall((:BinaryenTypeNullExternref, libbinaryen), BinaryenType, ())
end

function BinaryenTypeNullFuncref()
    ccall((:BinaryenTypeNullFuncref, libbinaryen), BinaryenType, ())
end

function BinaryenTypeUnreachable()
    ccall((:BinaryenTypeUnreachable, libbinaryen), BinaryenType, ())
end

"""
    BinaryenTypeAuto()

Not a real type. Used as the last parameter to BinaryenBlock to let
the API figure out the type instead of providing one.
"""
function BinaryenTypeAuto()
    ccall((:BinaryenTypeAuto, libbinaryen), BinaryenType, ())
end

function BinaryenTypeCreate(valueTypes, numTypes)
    ccall((:BinaryenTypeCreate, libbinaryen), BinaryenType, (Ptr{BinaryenType}, BinaryenIndex), valueTypes, numTypes)
end

function BinaryenTypeArity(t)
    ccall((:BinaryenTypeArity, libbinaryen), UInt32, (BinaryenType,), t)
end

function BinaryenTypeExpand(t, buf)
    ccall((:BinaryenTypeExpand, libbinaryen), Cvoid, (BinaryenType, Ptr{BinaryenType}), t, buf)
end

function BinaryenNone()
    ccall((:BinaryenNone, libbinaryen), BinaryenType, ())
end

function BinaryenInt32()
    ccall((:BinaryenInt32, libbinaryen), BinaryenType, ())
end

function BinaryenInt64()
    ccall((:BinaryenInt64, libbinaryen), BinaryenType, ())
end

function BinaryenFloat32()
    ccall((:BinaryenFloat32, libbinaryen), BinaryenType, ())
end

function BinaryenFloat64()
    ccall((:BinaryenFloat64, libbinaryen), BinaryenType, ())
end

function BinaryenUndefined()
    ccall((:BinaryenUndefined, libbinaryen), BinaryenType, ())
end

"""
Packed types (call to get the value of each; you can cache them)
"""
const BinaryenPackedType = UInt32

function BinaryenPackedTypeNotPacked()
    ccall((:BinaryenPackedTypeNotPacked, libbinaryen), BinaryenPackedType, ())
end

function BinaryenPackedTypeInt8()
    ccall((:BinaryenPackedTypeInt8, libbinaryen), BinaryenPackedType, ())
end

function BinaryenPackedTypeInt16()
    ccall((:BinaryenPackedTypeInt16, libbinaryen), BinaryenPackedType, ())
end

"""
Heap types
"""
const BinaryenHeapType = Csize_t

function BinaryenHeapTypeExt()
    ccall((:BinaryenHeapTypeExt, libbinaryen), BinaryenHeapType, ())
end

function BinaryenHeapTypeFunc()
    ccall((:BinaryenHeapTypeFunc, libbinaryen), BinaryenHeapType, ())
end

function BinaryenHeapTypeAny()
    ccall((:BinaryenHeapTypeAny, libbinaryen), BinaryenHeapType, ())
end

function BinaryenHeapTypeEq()
    ccall((:BinaryenHeapTypeEq, libbinaryen), BinaryenHeapType, ())
end

function BinaryenHeapTypeI31()
    ccall((:BinaryenHeapTypeI31, libbinaryen), BinaryenHeapType, ())
end

function BinaryenHeapTypeStruct()
    ccall((:BinaryenHeapTypeStruct, libbinaryen), BinaryenHeapType, ())
end

function BinaryenHeapTypeArray()
    ccall((:BinaryenHeapTypeArray, libbinaryen), BinaryenHeapType, ())
end

function BinaryenHeapTypeString()
    ccall((:BinaryenHeapTypeString, libbinaryen), BinaryenHeapType, ())
end

function BinaryenHeapTypeStringviewWTF8()
    ccall((:BinaryenHeapTypeStringviewWTF8, libbinaryen), BinaryenHeapType, ())
end

function BinaryenHeapTypeStringviewWTF16()
    ccall((:BinaryenHeapTypeStringviewWTF16, libbinaryen), BinaryenHeapType, ())
end

function BinaryenHeapTypeStringviewIter()
    ccall((:BinaryenHeapTypeStringviewIter, libbinaryen), BinaryenHeapType, ())
end

function BinaryenHeapTypeNone()
    ccall((:BinaryenHeapTypeNone, libbinaryen), BinaryenHeapType, ())
end

function BinaryenHeapTypeNoext()
    ccall((:BinaryenHeapTypeNoext, libbinaryen), BinaryenHeapType, ())
end

function BinaryenHeapTypeNofunc()
    ccall((:BinaryenHeapTypeNofunc, libbinaryen), BinaryenHeapType, ())
end

function BinaryenHeapTypeIsBasic(heapType)
    ccall((:BinaryenHeapTypeIsBasic, libbinaryen), Bool, (BinaryenHeapType,), heapType)
end

function BinaryenHeapTypeIsSignature(heapType)
    ccall((:BinaryenHeapTypeIsSignature, libbinaryen), Bool, (BinaryenHeapType,), heapType)
end

function BinaryenHeapTypeIsStruct(heapType)
    ccall((:BinaryenHeapTypeIsStruct, libbinaryen), Bool, (BinaryenHeapType,), heapType)
end

function BinaryenHeapTypeIsArray(heapType)
    ccall((:BinaryenHeapTypeIsArray, libbinaryen), Bool, (BinaryenHeapType,), heapType)
end

function BinaryenHeapTypeIsBottom(heapType)
    ccall((:BinaryenHeapTypeIsBottom, libbinaryen), Bool, (BinaryenHeapType,), heapType)
end

function BinaryenHeapTypeGetBottom(heapType)
    ccall((:BinaryenHeapTypeGetBottom, libbinaryen), BinaryenHeapType, (BinaryenHeapType,), heapType)
end

function BinaryenHeapTypeIsSubType(left, right)
    ccall((:BinaryenHeapTypeIsSubType, libbinaryen), Bool, (BinaryenHeapType, BinaryenHeapType), left, right)
end

function BinaryenStructTypeGetNumFields(heapType)
    ccall((:BinaryenStructTypeGetNumFields, libbinaryen), BinaryenIndex, (BinaryenHeapType,), heapType)
end

function BinaryenStructTypeGetFieldType(heapType, index)
    ccall((:BinaryenStructTypeGetFieldType, libbinaryen), BinaryenType, (BinaryenHeapType, BinaryenIndex), heapType, index)
end

function BinaryenStructTypeGetFieldPackedType(heapType, index)
    ccall((:BinaryenStructTypeGetFieldPackedType, libbinaryen), BinaryenPackedType, (BinaryenHeapType, BinaryenIndex), heapType, index)
end

function BinaryenStructTypeIsFieldMutable(heapType, index)
    ccall((:BinaryenStructTypeIsFieldMutable, libbinaryen), Bool, (BinaryenHeapType, BinaryenIndex), heapType, index)
end

function BinaryenArrayTypeGetElementType(heapType)
    ccall((:BinaryenArrayTypeGetElementType, libbinaryen), BinaryenType, (BinaryenHeapType,), heapType)
end

function BinaryenArrayTypeGetElementPackedType(heapType)
    ccall((:BinaryenArrayTypeGetElementPackedType, libbinaryen), BinaryenPackedType, (BinaryenHeapType,), heapType)
end

function BinaryenArrayTypeIsElementMutable(heapType)
    ccall((:BinaryenArrayTypeIsElementMutable, libbinaryen), Bool, (BinaryenHeapType,), heapType)
end

function BinaryenSignatureTypeGetParams(heapType)
    ccall((:BinaryenSignatureTypeGetParams, libbinaryen), BinaryenType, (BinaryenHeapType,), heapType)
end

function BinaryenSignatureTypeGetResults(heapType)
    ccall((:BinaryenSignatureTypeGetResults, libbinaryen), BinaryenType, (BinaryenHeapType,), heapType)
end

function BinaryenTypeGetHeapType(type)
    ccall((:BinaryenTypeGetHeapType, libbinaryen), BinaryenHeapType, (BinaryenType,), type)
end

function BinaryenTypeIsNullable(type)
    ccall((:BinaryenTypeIsNullable, libbinaryen), Bool, (BinaryenType,), type)
end

function BinaryenTypeFromHeapType(heapType, nullable)
    ccall((:BinaryenTypeFromHeapType, libbinaryen), BinaryenType, (BinaryenHeapType, Bool), heapType, nullable)
end

function BinaryenInvalidId()
    ccall((:BinaryenInvalidId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenNopId()
    ccall((:BinaryenNopId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenBlockId()
    ccall((:BinaryenBlockId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenIfId()
    ccall((:BinaryenIfId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenLoopId()
    ccall((:BinaryenLoopId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenBreakId()
    ccall((:BinaryenBreakId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenSwitchId()
    ccall((:BinaryenSwitchId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenCallId()
    ccall((:BinaryenCallId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenCallIndirectId()
    ccall((:BinaryenCallIndirectId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenLocalGetId()
    ccall((:BinaryenLocalGetId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenLocalSetId()
    ccall((:BinaryenLocalSetId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenGlobalGetId()
    ccall((:BinaryenGlobalGetId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenGlobalSetId()
    ccall((:BinaryenGlobalSetId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenLoadId()
    ccall((:BinaryenLoadId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenStoreId()
    ccall((:BinaryenStoreId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenAtomicRMWId()
    ccall((:BinaryenAtomicRMWId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenAtomicCmpxchgId()
    ccall((:BinaryenAtomicCmpxchgId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenAtomicWaitId()
    ccall((:BinaryenAtomicWaitId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenAtomicNotifyId()
    ccall((:BinaryenAtomicNotifyId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenAtomicFenceId()
    ccall((:BinaryenAtomicFenceId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenSIMDExtractId()
    ccall((:BinaryenSIMDExtractId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenSIMDReplaceId()
    ccall((:BinaryenSIMDReplaceId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenSIMDShuffleId()
    ccall((:BinaryenSIMDShuffleId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenSIMDTernaryId()
    ccall((:BinaryenSIMDTernaryId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenSIMDShiftId()
    ccall((:BinaryenSIMDShiftId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenSIMDLoadId()
    ccall((:BinaryenSIMDLoadId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenSIMDLoadStoreLaneId()
    ccall((:BinaryenSIMDLoadStoreLaneId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenMemoryInitId()
    ccall((:BinaryenMemoryInitId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenDataDropId()
    ccall((:BinaryenDataDropId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenMemoryCopyId()
    ccall((:BinaryenMemoryCopyId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenMemoryFillId()
    ccall((:BinaryenMemoryFillId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenConstId()
    ccall((:BinaryenConstId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenUnaryId()
    ccall((:BinaryenUnaryId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenBinaryId()
    ccall((:BinaryenBinaryId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenSelectId()
    ccall((:BinaryenSelectId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenDropId()
    ccall((:BinaryenDropId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenReturnId()
    ccall((:BinaryenReturnId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenMemorySizeId()
    ccall((:BinaryenMemorySizeId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenMemoryGrowId()
    ccall((:BinaryenMemoryGrowId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenUnreachableId()
    ccall((:BinaryenUnreachableId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenPopId()
    ccall((:BinaryenPopId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenRefNullId()
    ccall((:BinaryenRefNullId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenRefIsNullId()
    ccall((:BinaryenRefIsNullId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenRefFuncId()
    ccall((:BinaryenRefFuncId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenRefEqId()
    ccall((:BinaryenRefEqId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenTableGetId()
    ccall((:BinaryenTableGetId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenTableSetId()
    ccall((:BinaryenTableSetId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenTableSizeId()
    ccall((:BinaryenTableSizeId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenTableGrowId()
    ccall((:BinaryenTableGrowId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenTryId()
    ccall((:BinaryenTryId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenThrowId()
    ccall((:BinaryenThrowId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenRethrowId()
    ccall((:BinaryenRethrowId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenTupleMakeId()
    ccall((:BinaryenTupleMakeId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenTupleExtractId()
    ccall((:BinaryenTupleExtractId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenI31NewId()
    ccall((:BinaryenI31NewId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenI31GetId()
    ccall((:BinaryenI31GetId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenCallRefId()
    ccall((:BinaryenCallRefId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenRefTestId()
    ccall((:BinaryenRefTestId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenRefCastId()
    ccall((:BinaryenRefCastId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenBrOnId()
    ccall((:BinaryenBrOnId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenStructNewId()
    ccall((:BinaryenStructNewId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenStructGetId()
    ccall((:BinaryenStructGetId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenStructSetId()
    ccall((:BinaryenStructSetId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenArrayNewId()
    ccall((:BinaryenArrayNewId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenArrayNewDataId()
    ccall((:BinaryenArrayNewDataId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenArrayNewElemId()
    ccall((:BinaryenArrayNewElemId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenArrayNewFixedId()
    ccall((:BinaryenArrayNewFixedId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenArrayGetId()
    ccall((:BinaryenArrayGetId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenArraySetId()
    ccall((:BinaryenArraySetId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenArrayLenId()
    ccall((:BinaryenArrayLenId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenArrayCopyId()
    ccall((:BinaryenArrayCopyId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenArrayFillId()
    ccall((:BinaryenArrayFillId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenArrayInitDataId()
    ccall((:BinaryenArrayInitDataId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenArrayInitElemId()
    ccall((:BinaryenArrayInitElemId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenRefAsId()
    ccall((:BinaryenRefAsId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenStringNewId()
    ccall((:BinaryenStringNewId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenStringConstId()
    ccall((:BinaryenStringConstId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenStringMeasureId()
    ccall((:BinaryenStringMeasureId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenStringEncodeId()
    ccall((:BinaryenStringEncodeId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenStringConcatId()
    ccall((:BinaryenStringConcatId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenStringEqId()
    ccall((:BinaryenStringEqId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenStringAsId()
    ccall((:BinaryenStringAsId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenStringWTF8AdvanceId()
    ccall((:BinaryenStringWTF8AdvanceId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenStringWTF16GetId()
    ccall((:BinaryenStringWTF16GetId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenStringIterNextId()
    ccall((:BinaryenStringIterNextId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenStringIterMoveId()
    ccall((:BinaryenStringIterMoveId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenStringSliceWTFId()
    ccall((:BinaryenStringSliceWTFId, libbinaryen), BinaryenExpressionId, ())
end

function BinaryenStringSliceIterId()
    ccall((:BinaryenStringSliceIterId, libbinaryen), BinaryenExpressionId, ())
end

"""
External kinds (call to get the value of each; you can cache them)
"""
const BinaryenExternalKind = UInt32

function BinaryenExternalFunction()
    ccall((:BinaryenExternalFunction, libbinaryen), BinaryenExternalKind, ())
end

function BinaryenExternalTable()
    ccall((:BinaryenExternalTable, libbinaryen), BinaryenExternalKind, ())
end

function BinaryenExternalMemory()
    ccall((:BinaryenExternalMemory, libbinaryen), BinaryenExternalKind, ())
end

function BinaryenExternalGlobal()
    ccall((:BinaryenExternalGlobal, libbinaryen), BinaryenExternalKind, ())
end

function BinaryenExternalTag()
    ccall((:BinaryenExternalTag, libbinaryen), BinaryenExternalKind, ())
end

"""
Features. Call to get the value of each; you can cache them. Use bitwise
operators to combine and test particular features.
"""
const BinaryenFeatures = UInt32

function BinaryenFeatureMVP()
    ccall((:BinaryenFeatureMVP, libbinaryen), BinaryenFeatures, ())
end

function BinaryenFeatureAtomics()
    ccall((:BinaryenFeatureAtomics, libbinaryen), BinaryenFeatures, ())
end

function BinaryenFeatureBulkMemory()
    ccall((:BinaryenFeatureBulkMemory, libbinaryen), BinaryenFeatures, ())
end

function BinaryenFeatureMutableGlobals()
    ccall((:BinaryenFeatureMutableGlobals, libbinaryen), BinaryenFeatures, ())
end

function BinaryenFeatureNontrappingFPToInt()
    ccall((:BinaryenFeatureNontrappingFPToInt, libbinaryen), BinaryenFeatures, ())
end

function BinaryenFeatureSignExt()
    ccall((:BinaryenFeatureSignExt, libbinaryen), BinaryenFeatures, ())
end

function BinaryenFeatureSIMD128()
    ccall((:BinaryenFeatureSIMD128, libbinaryen), BinaryenFeatures, ())
end

function BinaryenFeatureExceptionHandling()
    ccall((:BinaryenFeatureExceptionHandling, libbinaryen), BinaryenFeatures, ())
end

function BinaryenFeatureTailCall()
    ccall((:BinaryenFeatureTailCall, libbinaryen), BinaryenFeatures, ())
end

function BinaryenFeatureReferenceTypes()
    ccall((:BinaryenFeatureReferenceTypes, libbinaryen), BinaryenFeatures, ())
end

function BinaryenFeatureMultivalue()
    ccall((:BinaryenFeatureMultivalue, libbinaryen), BinaryenFeatures, ())
end

function BinaryenFeatureGC()
    ccall((:BinaryenFeatureGC, libbinaryen), BinaryenFeatures, ())
end

function BinaryenFeatureMemory64()
    ccall((:BinaryenFeatureMemory64, libbinaryen), BinaryenFeatures, ())
end

function BinaryenFeatureRelaxedSIMD()
    ccall((:BinaryenFeatureRelaxedSIMD, libbinaryen), BinaryenFeatures, ())
end

function BinaryenFeatureExtendedConst()
    ccall((:BinaryenFeatureExtendedConst, libbinaryen), BinaryenFeatures, ())
end

function BinaryenFeatureStrings()
    ccall((:BinaryenFeatureStrings, libbinaryen), BinaryenFeatures, ())
end

function BinaryenFeatureMultiMemories()
    ccall((:BinaryenFeatureMultiMemories, libbinaryen), BinaryenFeatures, ())
end

function BinaryenFeatureAll()
    ccall((:BinaryenFeatureAll, libbinaryen), BinaryenFeatures, ())
end

mutable struct BinaryenModule end

const BinaryenModuleRef = Ptr{BinaryenModule}

function BinaryenModuleCreate()
    ccall((:BinaryenModuleCreate, libbinaryen), BinaryenModuleRef, ())
end

function BinaryenModuleDispose(_module)
    ccall((:BinaryenModuleDispose, libbinaryen), Cvoid, (BinaryenModuleRef,), _module)
end

"""
    BinaryenLiteral

Literals. These are passed by value.
"""
struct BinaryenLiteral
    data::NTuple{24, UInt8}
end

function Base.getproperty(x::Ptr{BinaryenLiteral}, f::Symbol)
    f === :type && return Ptr{Csize_t}(x + 0)
    f === :i32 && return Ptr{Int32}(x + 8)
    f === :i64 && return Ptr{Int64}(x + 8)
    f === :f32 && return Ptr{Cfloat}(x + 8)
    f === :f64 && return Ptr{Cdouble}(x + 8)
    f === :v128 && return Ptr{NTuple{16, UInt8}}(x + 8)
    f === :func && return Ptr{Ptr{Cchar}}(x + 8)
    return getfield(x, f)
end

function Base.getproperty(x::BinaryenLiteral, f::Symbol)
    r = Ref{BinaryenLiteral}(x)
    ptr = Base.unsafe_convert(Ptr{BinaryenLiteral}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{BinaryenLiteral}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

function BinaryenLiteralInt32(x)
    ccall((:BinaryenLiteralInt32, libbinaryen), BinaryenLiteral, (Int32,), x)
end

function BinaryenLiteralInt64(x)
    ccall((:BinaryenLiteralInt64, libbinaryen), BinaryenLiteral, (Int64,), x)
end

function BinaryenLiteralFloat32(x)
    ccall((:BinaryenLiteralFloat32, libbinaryen), BinaryenLiteral, (Cfloat,), x)
end

function BinaryenLiteralFloat64(x)
    ccall((:BinaryenLiteralFloat64, libbinaryen), BinaryenLiteral, (Cdouble,), x)
end

function BinaryenLiteralVec128(x)
    ccall((:BinaryenLiteralVec128, libbinaryen), BinaryenLiteral, (Ptr{UInt8},), x)
end

function BinaryenLiteralFloat32Bits(x)
    ccall((:BinaryenLiteralFloat32Bits, libbinaryen), BinaryenLiteral, (Int32,), x)
end

function BinaryenLiteralFloat64Bits(x)
    ccall((:BinaryenLiteralFloat64Bits, libbinaryen), BinaryenLiteral, (Int64,), x)
end

"""
Expressions

Some expressions have a BinaryenOp, which is the more
specific operation/opcode.

Some expressions have optional parameters, like Return may not
return a value. You can supply a NULL pointer in those cases.

For more information, see wasm.h
"""
const BinaryenOp = Int32

function BinaryenClzInt32()
    ccall((:BinaryenClzInt32, libbinaryen), BinaryenOp, ())
end

function BinaryenCtzInt32()
    ccall((:BinaryenCtzInt32, libbinaryen), BinaryenOp, ())
end

function BinaryenPopcntInt32()
    ccall((:BinaryenPopcntInt32, libbinaryen), BinaryenOp, ())
end

function BinaryenNegFloat32()
    ccall((:BinaryenNegFloat32, libbinaryen), BinaryenOp, ())
end

function BinaryenAbsFloat32()
    ccall((:BinaryenAbsFloat32, libbinaryen), BinaryenOp, ())
end

function BinaryenCeilFloat32()
    ccall((:BinaryenCeilFloat32, libbinaryen), BinaryenOp, ())
end

function BinaryenFloorFloat32()
    ccall((:BinaryenFloorFloat32, libbinaryen), BinaryenOp, ())
end

function BinaryenTruncFloat32()
    ccall((:BinaryenTruncFloat32, libbinaryen), BinaryenOp, ())
end

function BinaryenNearestFloat32()
    ccall((:BinaryenNearestFloat32, libbinaryen), BinaryenOp, ())
end

function BinaryenSqrtFloat32()
    ccall((:BinaryenSqrtFloat32, libbinaryen), BinaryenOp, ())
end

function BinaryenEqZInt32()
    ccall((:BinaryenEqZInt32, libbinaryen), BinaryenOp, ())
end

function BinaryenClzInt64()
    ccall((:BinaryenClzInt64, libbinaryen), BinaryenOp, ())
end

function BinaryenCtzInt64()
    ccall((:BinaryenCtzInt64, libbinaryen), BinaryenOp, ())
end

function BinaryenPopcntInt64()
    ccall((:BinaryenPopcntInt64, libbinaryen), BinaryenOp, ())
end

function BinaryenNegFloat64()
    ccall((:BinaryenNegFloat64, libbinaryen), BinaryenOp, ())
end

function BinaryenAbsFloat64()
    ccall((:BinaryenAbsFloat64, libbinaryen), BinaryenOp, ())
end

function BinaryenCeilFloat64()
    ccall((:BinaryenCeilFloat64, libbinaryen), BinaryenOp, ())
end

function BinaryenFloorFloat64()
    ccall((:BinaryenFloorFloat64, libbinaryen), BinaryenOp, ())
end

function BinaryenTruncFloat64()
    ccall((:BinaryenTruncFloat64, libbinaryen), BinaryenOp, ())
end

function BinaryenNearestFloat64()
    ccall((:BinaryenNearestFloat64, libbinaryen), BinaryenOp, ())
end

function BinaryenSqrtFloat64()
    ccall((:BinaryenSqrtFloat64, libbinaryen), BinaryenOp, ())
end

function BinaryenEqZInt64()
    ccall((:BinaryenEqZInt64, libbinaryen), BinaryenOp, ())
end

function BinaryenExtendSInt32()
    ccall((:BinaryenExtendSInt32, libbinaryen), BinaryenOp, ())
end

function BinaryenExtendUInt32()
    ccall((:BinaryenExtendUInt32, libbinaryen), BinaryenOp, ())
end

function BinaryenWrapInt64()
    ccall((:BinaryenWrapInt64, libbinaryen), BinaryenOp, ())
end

function BinaryenTruncSFloat32ToInt32()
    ccall((:BinaryenTruncSFloat32ToInt32, libbinaryen), BinaryenOp, ())
end

function BinaryenTruncSFloat32ToInt64()
    ccall((:BinaryenTruncSFloat32ToInt64, libbinaryen), BinaryenOp, ())
end

function BinaryenTruncUFloat32ToInt32()
    ccall((:BinaryenTruncUFloat32ToInt32, libbinaryen), BinaryenOp, ())
end

function BinaryenTruncUFloat32ToInt64()
    ccall((:BinaryenTruncUFloat32ToInt64, libbinaryen), BinaryenOp, ())
end

function BinaryenTruncSFloat64ToInt32()
    ccall((:BinaryenTruncSFloat64ToInt32, libbinaryen), BinaryenOp, ())
end

function BinaryenTruncSFloat64ToInt64()
    ccall((:BinaryenTruncSFloat64ToInt64, libbinaryen), BinaryenOp, ())
end

function BinaryenTruncUFloat64ToInt32()
    ccall((:BinaryenTruncUFloat64ToInt32, libbinaryen), BinaryenOp, ())
end

function BinaryenTruncUFloat64ToInt64()
    ccall((:BinaryenTruncUFloat64ToInt64, libbinaryen), BinaryenOp, ())
end

function BinaryenReinterpretFloat32()
    ccall((:BinaryenReinterpretFloat32, libbinaryen), BinaryenOp, ())
end

function BinaryenReinterpretFloat64()
    ccall((:BinaryenReinterpretFloat64, libbinaryen), BinaryenOp, ())
end

function BinaryenConvertSInt32ToFloat32()
    ccall((:BinaryenConvertSInt32ToFloat32, libbinaryen), BinaryenOp, ())
end

function BinaryenConvertSInt32ToFloat64()
    ccall((:BinaryenConvertSInt32ToFloat64, libbinaryen), BinaryenOp, ())
end

function BinaryenConvertUInt32ToFloat32()
    ccall((:BinaryenConvertUInt32ToFloat32, libbinaryen), BinaryenOp, ())
end

function BinaryenConvertUInt32ToFloat64()
    ccall((:BinaryenConvertUInt32ToFloat64, libbinaryen), BinaryenOp, ())
end

function BinaryenConvertSInt64ToFloat32()
    ccall((:BinaryenConvertSInt64ToFloat32, libbinaryen), BinaryenOp, ())
end

function BinaryenConvertSInt64ToFloat64()
    ccall((:BinaryenConvertSInt64ToFloat64, libbinaryen), BinaryenOp, ())
end

function BinaryenConvertUInt64ToFloat32()
    ccall((:BinaryenConvertUInt64ToFloat32, libbinaryen), BinaryenOp, ())
end

function BinaryenConvertUInt64ToFloat64()
    ccall((:BinaryenConvertUInt64ToFloat64, libbinaryen), BinaryenOp, ())
end

function BinaryenPromoteFloat32()
    ccall((:BinaryenPromoteFloat32, libbinaryen), BinaryenOp, ())
end

function BinaryenDemoteFloat64()
    ccall((:BinaryenDemoteFloat64, libbinaryen), BinaryenOp, ())
end

function BinaryenReinterpretInt32()
    ccall((:BinaryenReinterpretInt32, libbinaryen), BinaryenOp, ())
end

function BinaryenReinterpretInt64()
    ccall((:BinaryenReinterpretInt64, libbinaryen), BinaryenOp, ())
end

function BinaryenExtendS8Int32()
    ccall((:BinaryenExtendS8Int32, libbinaryen), BinaryenOp, ())
end

function BinaryenExtendS16Int32()
    ccall((:BinaryenExtendS16Int32, libbinaryen), BinaryenOp, ())
end

function BinaryenExtendS8Int64()
    ccall((:BinaryenExtendS8Int64, libbinaryen), BinaryenOp, ())
end

function BinaryenExtendS16Int64()
    ccall((:BinaryenExtendS16Int64, libbinaryen), BinaryenOp, ())
end

function BinaryenExtendS32Int64()
    ccall((:BinaryenExtendS32Int64, libbinaryen), BinaryenOp, ())
end

function BinaryenAddInt32()
    ccall((:BinaryenAddInt32, libbinaryen), BinaryenOp, ())
end

function BinaryenSubInt32()
    ccall((:BinaryenSubInt32, libbinaryen), BinaryenOp, ())
end

function BinaryenMulInt32()
    ccall((:BinaryenMulInt32, libbinaryen), BinaryenOp, ())
end

function BinaryenDivSInt32()
    ccall((:BinaryenDivSInt32, libbinaryen), BinaryenOp, ())
end

function BinaryenDivUInt32()
    ccall((:BinaryenDivUInt32, libbinaryen), BinaryenOp, ())
end

function BinaryenRemSInt32()
    ccall((:BinaryenRemSInt32, libbinaryen), BinaryenOp, ())
end

function BinaryenRemUInt32()
    ccall((:BinaryenRemUInt32, libbinaryen), BinaryenOp, ())
end

function BinaryenAndInt32()
    ccall((:BinaryenAndInt32, libbinaryen), BinaryenOp, ())
end

function BinaryenOrInt32()
    ccall((:BinaryenOrInt32, libbinaryen), BinaryenOp, ())
end

function BinaryenXorInt32()
    ccall((:BinaryenXorInt32, libbinaryen), BinaryenOp, ())
end

function BinaryenShlInt32()
    ccall((:BinaryenShlInt32, libbinaryen), BinaryenOp, ())
end

function BinaryenShrUInt32()
    ccall((:BinaryenShrUInt32, libbinaryen), BinaryenOp, ())
end

function BinaryenShrSInt32()
    ccall((:BinaryenShrSInt32, libbinaryen), BinaryenOp, ())
end

function BinaryenRotLInt32()
    ccall((:BinaryenRotLInt32, libbinaryen), BinaryenOp, ())
end

function BinaryenRotRInt32()
    ccall((:BinaryenRotRInt32, libbinaryen), BinaryenOp, ())
end

function BinaryenEqInt32()
    ccall((:BinaryenEqInt32, libbinaryen), BinaryenOp, ())
end

function BinaryenNeInt32()
    ccall((:BinaryenNeInt32, libbinaryen), BinaryenOp, ())
end

function BinaryenLtSInt32()
    ccall((:BinaryenLtSInt32, libbinaryen), BinaryenOp, ())
end

function BinaryenLtUInt32()
    ccall((:BinaryenLtUInt32, libbinaryen), BinaryenOp, ())
end

function BinaryenLeSInt32()
    ccall((:BinaryenLeSInt32, libbinaryen), BinaryenOp, ())
end

function BinaryenLeUInt32()
    ccall((:BinaryenLeUInt32, libbinaryen), BinaryenOp, ())
end

function BinaryenGtSInt32()
    ccall((:BinaryenGtSInt32, libbinaryen), BinaryenOp, ())
end

function BinaryenGtUInt32()
    ccall((:BinaryenGtUInt32, libbinaryen), BinaryenOp, ())
end

function BinaryenGeSInt32()
    ccall((:BinaryenGeSInt32, libbinaryen), BinaryenOp, ())
end

function BinaryenGeUInt32()
    ccall((:BinaryenGeUInt32, libbinaryen), BinaryenOp, ())
end

function BinaryenAddInt64()
    ccall((:BinaryenAddInt64, libbinaryen), BinaryenOp, ())
end

function BinaryenSubInt64()
    ccall((:BinaryenSubInt64, libbinaryen), BinaryenOp, ())
end

function BinaryenMulInt64()
    ccall((:BinaryenMulInt64, libbinaryen), BinaryenOp, ())
end

function BinaryenDivSInt64()
    ccall((:BinaryenDivSInt64, libbinaryen), BinaryenOp, ())
end

function BinaryenDivUInt64()
    ccall((:BinaryenDivUInt64, libbinaryen), BinaryenOp, ())
end

function BinaryenRemSInt64()
    ccall((:BinaryenRemSInt64, libbinaryen), BinaryenOp, ())
end

function BinaryenRemUInt64()
    ccall((:BinaryenRemUInt64, libbinaryen), BinaryenOp, ())
end

function BinaryenAndInt64()
    ccall((:BinaryenAndInt64, libbinaryen), BinaryenOp, ())
end

function BinaryenOrInt64()
    ccall((:BinaryenOrInt64, libbinaryen), BinaryenOp, ())
end

function BinaryenXorInt64()
    ccall((:BinaryenXorInt64, libbinaryen), BinaryenOp, ())
end

function BinaryenShlInt64()
    ccall((:BinaryenShlInt64, libbinaryen), BinaryenOp, ())
end

function BinaryenShrUInt64()
    ccall((:BinaryenShrUInt64, libbinaryen), BinaryenOp, ())
end

function BinaryenShrSInt64()
    ccall((:BinaryenShrSInt64, libbinaryen), BinaryenOp, ())
end

function BinaryenRotLInt64()
    ccall((:BinaryenRotLInt64, libbinaryen), BinaryenOp, ())
end

function BinaryenRotRInt64()
    ccall((:BinaryenRotRInt64, libbinaryen), BinaryenOp, ())
end

function BinaryenEqInt64()
    ccall((:BinaryenEqInt64, libbinaryen), BinaryenOp, ())
end

function BinaryenNeInt64()
    ccall((:BinaryenNeInt64, libbinaryen), BinaryenOp, ())
end

function BinaryenLtSInt64()
    ccall((:BinaryenLtSInt64, libbinaryen), BinaryenOp, ())
end

function BinaryenLtUInt64()
    ccall((:BinaryenLtUInt64, libbinaryen), BinaryenOp, ())
end

function BinaryenLeSInt64()
    ccall((:BinaryenLeSInt64, libbinaryen), BinaryenOp, ())
end

function BinaryenLeUInt64()
    ccall((:BinaryenLeUInt64, libbinaryen), BinaryenOp, ())
end

function BinaryenGtSInt64()
    ccall((:BinaryenGtSInt64, libbinaryen), BinaryenOp, ())
end

function BinaryenGtUInt64()
    ccall((:BinaryenGtUInt64, libbinaryen), BinaryenOp, ())
end

function BinaryenGeSInt64()
    ccall((:BinaryenGeSInt64, libbinaryen), BinaryenOp, ())
end

function BinaryenGeUInt64()
    ccall((:BinaryenGeUInt64, libbinaryen), BinaryenOp, ())
end

function BinaryenAddFloat32()
    ccall((:BinaryenAddFloat32, libbinaryen), BinaryenOp, ())
end

function BinaryenSubFloat32()
    ccall((:BinaryenSubFloat32, libbinaryen), BinaryenOp, ())
end

function BinaryenMulFloat32()
    ccall((:BinaryenMulFloat32, libbinaryen), BinaryenOp, ())
end

function BinaryenDivFloat32()
    ccall((:BinaryenDivFloat32, libbinaryen), BinaryenOp, ())
end

function BinaryenCopySignFloat32()
    ccall((:BinaryenCopySignFloat32, libbinaryen), BinaryenOp, ())
end

function BinaryenMinFloat32()
    ccall((:BinaryenMinFloat32, libbinaryen), BinaryenOp, ())
end

function BinaryenMaxFloat32()
    ccall((:BinaryenMaxFloat32, libbinaryen), BinaryenOp, ())
end

function BinaryenEqFloat32()
    ccall((:BinaryenEqFloat32, libbinaryen), BinaryenOp, ())
end

function BinaryenNeFloat32()
    ccall((:BinaryenNeFloat32, libbinaryen), BinaryenOp, ())
end

function BinaryenLtFloat32()
    ccall((:BinaryenLtFloat32, libbinaryen), BinaryenOp, ())
end

function BinaryenLeFloat32()
    ccall((:BinaryenLeFloat32, libbinaryen), BinaryenOp, ())
end

function BinaryenGtFloat32()
    ccall((:BinaryenGtFloat32, libbinaryen), BinaryenOp, ())
end

function BinaryenGeFloat32()
    ccall((:BinaryenGeFloat32, libbinaryen), BinaryenOp, ())
end

function BinaryenAddFloat64()
    ccall((:BinaryenAddFloat64, libbinaryen), BinaryenOp, ())
end

function BinaryenSubFloat64()
    ccall((:BinaryenSubFloat64, libbinaryen), BinaryenOp, ())
end

function BinaryenMulFloat64()
    ccall((:BinaryenMulFloat64, libbinaryen), BinaryenOp, ())
end

function BinaryenDivFloat64()
    ccall((:BinaryenDivFloat64, libbinaryen), BinaryenOp, ())
end

function BinaryenCopySignFloat64()
    ccall((:BinaryenCopySignFloat64, libbinaryen), BinaryenOp, ())
end

function BinaryenMinFloat64()
    ccall((:BinaryenMinFloat64, libbinaryen), BinaryenOp, ())
end

function BinaryenMaxFloat64()
    ccall((:BinaryenMaxFloat64, libbinaryen), BinaryenOp, ())
end

function BinaryenEqFloat64()
    ccall((:BinaryenEqFloat64, libbinaryen), BinaryenOp, ())
end

function BinaryenNeFloat64()
    ccall((:BinaryenNeFloat64, libbinaryen), BinaryenOp, ())
end

function BinaryenLtFloat64()
    ccall((:BinaryenLtFloat64, libbinaryen), BinaryenOp, ())
end

function BinaryenLeFloat64()
    ccall((:BinaryenLeFloat64, libbinaryen), BinaryenOp, ())
end

function BinaryenGtFloat64()
    ccall((:BinaryenGtFloat64, libbinaryen), BinaryenOp, ())
end

function BinaryenGeFloat64()
    ccall((:BinaryenGeFloat64, libbinaryen), BinaryenOp, ())
end

function BinaryenAtomicRMWAdd()
    ccall((:BinaryenAtomicRMWAdd, libbinaryen), BinaryenOp, ())
end

function BinaryenAtomicRMWSub()
    ccall((:BinaryenAtomicRMWSub, libbinaryen), BinaryenOp, ())
end

function BinaryenAtomicRMWAnd()
    ccall((:BinaryenAtomicRMWAnd, libbinaryen), BinaryenOp, ())
end

function BinaryenAtomicRMWOr()
    ccall((:BinaryenAtomicRMWOr, libbinaryen), BinaryenOp, ())
end

function BinaryenAtomicRMWXor()
    ccall((:BinaryenAtomicRMWXor, libbinaryen), BinaryenOp, ())
end

function BinaryenAtomicRMWXchg()
    ccall((:BinaryenAtomicRMWXchg, libbinaryen), BinaryenOp, ())
end

function BinaryenTruncSatSFloat32ToInt32()
    ccall((:BinaryenTruncSatSFloat32ToInt32, libbinaryen), BinaryenOp, ())
end

function BinaryenTruncSatSFloat32ToInt64()
    ccall((:BinaryenTruncSatSFloat32ToInt64, libbinaryen), BinaryenOp, ())
end

function BinaryenTruncSatUFloat32ToInt32()
    ccall((:BinaryenTruncSatUFloat32ToInt32, libbinaryen), BinaryenOp, ())
end

function BinaryenTruncSatUFloat32ToInt64()
    ccall((:BinaryenTruncSatUFloat32ToInt64, libbinaryen), BinaryenOp, ())
end

function BinaryenTruncSatSFloat64ToInt32()
    ccall((:BinaryenTruncSatSFloat64ToInt32, libbinaryen), BinaryenOp, ())
end

function BinaryenTruncSatSFloat64ToInt64()
    ccall((:BinaryenTruncSatSFloat64ToInt64, libbinaryen), BinaryenOp, ())
end

function BinaryenTruncSatUFloat64ToInt32()
    ccall((:BinaryenTruncSatUFloat64ToInt32, libbinaryen), BinaryenOp, ())
end

function BinaryenTruncSatUFloat64ToInt64()
    ccall((:BinaryenTruncSatUFloat64ToInt64, libbinaryen), BinaryenOp, ())
end

function BinaryenSplatVecI8x16()
    ccall((:BinaryenSplatVecI8x16, libbinaryen), BinaryenOp, ())
end

function BinaryenExtractLaneSVecI8x16()
    ccall((:BinaryenExtractLaneSVecI8x16, libbinaryen), BinaryenOp, ())
end

function BinaryenExtractLaneUVecI8x16()
    ccall((:BinaryenExtractLaneUVecI8x16, libbinaryen), BinaryenOp, ())
end

function BinaryenReplaceLaneVecI8x16()
    ccall((:BinaryenReplaceLaneVecI8x16, libbinaryen), BinaryenOp, ())
end

function BinaryenSplatVecI16x8()
    ccall((:BinaryenSplatVecI16x8, libbinaryen), BinaryenOp, ())
end

function BinaryenExtractLaneSVecI16x8()
    ccall((:BinaryenExtractLaneSVecI16x8, libbinaryen), BinaryenOp, ())
end

function BinaryenExtractLaneUVecI16x8()
    ccall((:BinaryenExtractLaneUVecI16x8, libbinaryen), BinaryenOp, ())
end

function BinaryenReplaceLaneVecI16x8()
    ccall((:BinaryenReplaceLaneVecI16x8, libbinaryen), BinaryenOp, ())
end

function BinaryenSplatVecI32x4()
    ccall((:BinaryenSplatVecI32x4, libbinaryen), BinaryenOp, ())
end

function BinaryenExtractLaneVecI32x4()
    ccall((:BinaryenExtractLaneVecI32x4, libbinaryen), BinaryenOp, ())
end

function BinaryenReplaceLaneVecI32x4()
    ccall((:BinaryenReplaceLaneVecI32x4, libbinaryen), BinaryenOp, ())
end

function BinaryenSplatVecI64x2()
    ccall((:BinaryenSplatVecI64x2, libbinaryen), BinaryenOp, ())
end

function BinaryenExtractLaneVecI64x2()
    ccall((:BinaryenExtractLaneVecI64x2, libbinaryen), BinaryenOp, ())
end

function BinaryenReplaceLaneVecI64x2()
    ccall((:BinaryenReplaceLaneVecI64x2, libbinaryen), BinaryenOp, ())
end

function BinaryenSplatVecF32x4()
    ccall((:BinaryenSplatVecF32x4, libbinaryen), BinaryenOp, ())
end

function BinaryenExtractLaneVecF32x4()
    ccall((:BinaryenExtractLaneVecF32x4, libbinaryen), BinaryenOp, ())
end

function BinaryenReplaceLaneVecF32x4()
    ccall((:BinaryenReplaceLaneVecF32x4, libbinaryen), BinaryenOp, ())
end

function BinaryenSplatVecF64x2()
    ccall((:BinaryenSplatVecF64x2, libbinaryen), BinaryenOp, ())
end

function BinaryenExtractLaneVecF64x2()
    ccall((:BinaryenExtractLaneVecF64x2, libbinaryen), BinaryenOp, ())
end

function BinaryenReplaceLaneVecF64x2()
    ccall((:BinaryenReplaceLaneVecF64x2, libbinaryen), BinaryenOp, ())
end

function BinaryenEqVecI8x16()
    ccall((:BinaryenEqVecI8x16, libbinaryen), BinaryenOp, ())
end

function BinaryenNeVecI8x16()
    ccall((:BinaryenNeVecI8x16, libbinaryen), BinaryenOp, ())
end

function BinaryenLtSVecI8x16()
    ccall((:BinaryenLtSVecI8x16, libbinaryen), BinaryenOp, ())
end

function BinaryenLtUVecI8x16()
    ccall((:BinaryenLtUVecI8x16, libbinaryen), BinaryenOp, ())
end

function BinaryenGtSVecI8x16()
    ccall((:BinaryenGtSVecI8x16, libbinaryen), BinaryenOp, ())
end

function BinaryenGtUVecI8x16()
    ccall((:BinaryenGtUVecI8x16, libbinaryen), BinaryenOp, ())
end

function BinaryenLeSVecI8x16()
    ccall((:BinaryenLeSVecI8x16, libbinaryen), BinaryenOp, ())
end

function BinaryenLeUVecI8x16()
    ccall((:BinaryenLeUVecI8x16, libbinaryen), BinaryenOp, ())
end

function BinaryenGeSVecI8x16()
    ccall((:BinaryenGeSVecI8x16, libbinaryen), BinaryenOp, ())
end

function BinaryenGeUVecI8x16()
    ccall((:BinaryenGeUVecI8x16, libbinaryen), BinaryenOp, ())
end

function BinaryenEqVecI16x8()
    ccall((:BinaryenEqVecI16x8, libbinaryen), BinaryenOp, ())
end

function BinaryenNeVecI16x8()
    ccall((:BinaryenNeVecI16x8, libbinaryen), BinaryenOp, ())
end

function BinaryenLtSVecI16x8()
    ccall((:BinaryenLtSVecI16x8, libbinaryen), BinaryenOp, ())
end

function BinaryenLtUVecI16x8()
    ccall((:BinaryenLtUVecI16x8, libbinaryen), BinaryenOp, ())
end

function BinaryenGtSVecI16x8()
    ccall((:BinaryenGtSVecI16x8, libbinaryen), BinaryenOp, ())
end

function BinaryenGtUVecI16x8()
    ccall((:BinaryenGtUVecI16x8, libbinaryen), BinaryenOp, ())
end

function BinaryenLeSVecI16x8()
    ccall((:BinaryenLeSVecI16x8, libbinaryen), BinaryenOp, ())
end

function BinaryenLeUVecI16x8()
    ccall((:BinaryenLeUVecI16x8, libbinaryen), BinaryenOp, ())
end

function BinaryenGeSVecI16x8()
    ccall((:BinaryenGeSVecI16x8, libbinaryen), BinaryenOp, ())
end

function BinaryenGeUVecI16x8()
    ccall((:BinaryenGeUVecI16x8, libbinaryen), BinaryenOp, ())
end

function BinaryenEqVecI32x4()
    ccall((:BinaryenEqVecI32x4, libbinaryen), BinaryenOp, ())
end

function BinaryenNeVecI32x4()
    ccall((:BinaryenNeVecI32x4, libbinaryen), BinaryenOp, ())
end

function BinaryenLtSVecI32x4()
    ccall((:BinaryenLtSVecI32x4, libbinaryen), BinaryenOp, ())
end

function BinaryenLtUVecI32x4()
    ccall((:BinaryenLtUVecI32x4, libbinaryen), BinaryenOp, ())
end

function BinaryenGtSVecI32x4()
    ccall((:BinaryenGtSVecI32x4, libbinaryen), BinaryenOp, ())
end

function BinaryenGtUVecI32x4()
    ccall((:BinaryenGtUVecI32x4, libbinaryen), BinaryenOp, ())
end

function BinaryenLeSVecI32x4()
    ccall((:BinaryenLeSVecI32x4, libbinaryen), BinaryenOp, ())
end

function BinaryenLeUVecI32x4()
    ccall((:BinaryenLeUVecI32x4, libbinaryen), BinaryenOp, ())
end

function BinaryenGeSVecI32x4()
    ccall((:BinaryenGeSVecI32x4, libbinaryen), BinaryenOp, ())
end

function BinaryenGeUVecI32x4()
    ccall((:BinaryenGeUVecI32x4, libbinaryen), BinaryenOp, ())
end

function BinaryenEqVecI64x2()
    ccall((:BinaryenEqVecI64x2, libbinaryen), BinaryenOp, ())
end

function BinaryenNeVecI64x2()
    ccall((:BinaryenNeVecI64x2, libbinaryen), BinaryenOp, ())
end

function BinaryenLtSVecI64x2()
    ccall((:BinaryenLtSVecI64x2, libbinaryen), BinaryenOp, ())
end

function BinaryenGtSVecI64x2()
    ccall((:BinaryenGtSVecI64x2, libbinaryen), BinaryenOp, ())
end

function BinaryenLeSVecI64x2()
    ccall((:BinaryenLeSVecI64x2, libbinaryen), BinaryenOp, ())
end

function BinaryenGeSVecI64x2()
    ccall((:BinaryenGeSVecI64x2, libbinaryen), BinaryenOp, ())
end

function BinaryenEqVecF32x4()
    ccall((:BinaryenEqVecF32x4, libbinaryen), BinaryenOp, ())
end

function BinaryenNeVecF32x4()
    ccall((:BinaryenNeVecF32x4, libbinaryen), BinaryenOp, ())
end

function BinaryenLtVecF32x4()
    ccall((:BinaryenLtVecF32x4, libbinaryen), BinaryenOp, ())
end

function BinaryenGtVecF32x4()
    ccall((:BinaryenGtVecF32x4, libbinaryen), BinaryenOp, ())
end

function BinaryenLeVecF32x4()
    ccall((:BinaryenLeVecF32x4, libbinaryen), BinaryenOp, ())
end

function BinaryenGeVecF32x4()
    ccall((:BinaryenGeVecF32x4, libbinaryen), BinaryenOp, ())
end

function BinaryenEqVecF64x2()
    ccall((:BinaryenEqVecF64x2, libbinaryen), BinaryenOp, ())
end

function BinaryenNeVecF64x2()
    ccall((:BinaryenNeVecF64x2, libbinaryen), BinaryenOp, ())
end

function BinaryenLtVecF64x2()
    ccall((:BinaryenLtVecF64x2, libbinaryen), BinaryenOp, ())
end

function BinaryenGtVecF64x2()
    ccall((:BinaryenGtVecF64x2, libbinaryen), BinaryenOp, ())
end

function BinaryenLeVecF64x2()
    ccall((:BinaryenLeVecF64x2, libbinaryen), BinaryenOp, ())
end

function BinaryenGeVecF64x2()
    ccall((:BinaryenGeVecF64x2, libbinaryen), BinaryenOp, ())
end

function BinaryenNotVec128()
    ccall((:BinaryenNotVec128, libbinaryen), BinaryenOp, ())
end

function BinaryenAndVec128()
    ccall((:BinaryenAndVec128, libbinaryen), BinaryenOp, ())
end

function BinaryenOrVec128()
    ccall((:BinaryenOrVec128, libbinaryen), BinaryenOp, ())
end

function BinaryenXorVec128()
    ccall((:BinaryenXorVec128, libbinaryen), BinaryenOp, ())
end

function BinaryenAndNotVec128()
    ccall((:BinaryenAndNotVec128, libbinaryen), BinaryenOp, ())
end

function BinaryenBitselectVec128()
    ccall((:BinaryenBitselectVec128, libbinaryen), BinaryenOp, ())
end

function BinaryenRelaxedFmaVecF32x4()
    ccall((:BinaryenRelaxedFmaVecF32x4, libbinaryen), BinaryenOp, ())
end

function BinaryenRelaxedFmsVecF32x4()
    ccall((:BinaryenRelaxedFmsVecF32x4, libbinaryen), BinaryenOp, ())
end

function BinaryenRelaxedFmaVecF64x2()
    ccall((:BinaryenRelaxedFmaVecF64x2, libbinaryen), BinaryenOp, ())
end

function BinaryenRelaxedFmsVecF64x2()
    ccall((:BinaryenRelaxedFmsVecF64x2, libbinaryen), BinaryenOp, ())
end

function BinaryenLaneselectI8x16()
    ccall((:BinaryenLaneselectI8x16, libbinaryen), BinaryenOp, ())
end

function BinaryenLaneselectI16x8()
    ccall((:BinaryenLaneselectI16x8, libbinaryen), BinaryenOp, ())
end

function BinaryenLaneselectI32x4()
    ccall((:BinaryenLaneselectI32x4, libbinaryen), BinaryenOp, ())
end

function BinaryenLaneselectI64x2()
    ccall((:BinaryenLaneselectI64x2, libbinaryen), BinaryenOp, ())
end

function BinaryenDotI8x16I7x16AddSToVecI32x4()
    ccall((:BinaryenDotI8x16I7x16AddSToVecI32x4, libbinaryen), BinaryenOp, ())
end

function BinaryenAnyTrueVec128()
    ccall((:BinaryenAnyTrueVec128, libbinaryen), BinaryenOp, ())
end

function BinaryenPopcntVecI8x16()
    ccall((:BinaryenPopcntVecI8x16, libbinaryen), BinaryenOp, ())
end

function BinaryenAbsVecI8x16()
    ccall((:BinaryenAbsVecI8x16, libbinaryen), BinaryenOp, ())
end

function BinaryenNegVecI8x16()
    ccall((:BinaryenNegVecI8x16, libbinaryen), BinaryenOp, ())
end

function BinaryenAllTrueVecI8x16()
    ccall((:BinaryenAllTrueVecI8x16, libbinaryen), BinaryenOp, ())
end

function BinaryenBitmaskVecI8x16()
    ccall((:BinaryenBitmaskVecI8x16, libbinaryen), BinaryenOp, ())
end

function BinaryenShlVecI8x16()
    ccall((:BinaryenShlVecI8x16, libbinaryen), BinaryenOp, ())
end

function BinaryenShrSVecI8x16()
    ccall((:BinaryenShrSVecI8x16, libbinaryen), BinaryenOp, ())
end

function BinaryenShrUVecI8x16()
    ccall((:BinaryenShrUVecI8x16, libbinaryen), BinaryenOp, ())
end

function BinaryenAddVecI8x16()
    ccall((:BinaryenAddVecI8x16, libbinaryen), BinaryenOp, ())
end

function BinaryenAddSatSVecI8x16()
    ccall((:BinaryenAddSatSVecI8x16, libbinaryen), BinaryenOp, ())
end

function BinaryenAddSatUVecI8x16()
    ccall((:BinaryenAddSatUVecI8x16, libbinaryen), BinaryenOp, ())
end

function BinaryenSubVecI8x16()
    ccall((:BinaryenSubVecI8x16, libbinaryen), BinaryenOp, ())
end

function BinaryenSubSatSVecI8x16()
    ccall((:BinaryenSubSatSVecI8x16, libbinaryen), BinaryenOp, ())
end

function BinaryenSubSatUVecI8x16()
    ccall((:BinaryenSubSatUVecI8x16, libbinaryen), BinaryenOp, ())
end

function BinaryenMinSVecI8x16()
    ccall((:BinaryenMinSVecI8x16, libbinaryen), BinaryenOp, ())
end

function BinaryenMinUVecI8x16()
    ccall((:BinaryenMinUVecI8x16, libbinaryen), BinaryenOp, ())
end

function BinaryenMaxSVecI8x16()
    ccall((:BinaryenMaxSVecI8x16, libbinaryen), BinaryenOp, ())
end

function BinaryenMaxUVecI8x16()
    ccall((:BinaryenMaxUVecI8x16, libbinaryen), BinaryenOp, ())
end

function BinaryenAvgrUVecI8x16()
    ccall((:BinaryenAvgrUVecI8x16, libbinaryen), BinaryenOp, ())
end

function BinaryenAbsVecI16x8()
    ccall((:BinaryenAbsVecI16x8, libbinaryen), BinaryenOp, ())
end

function BinaryenNegVecI16x8()
    ccall((:BinaryenNegVecI16x8, libbinaryen), BinaryenOp, ())
end

function BinaryenAllTrueVecI16x8()
    ccall((:BinaryenAllTrueVecI16x8, libbinaryen), BinaryenOp, ())
end

function BinaryenBitmaskVecI16x8()
    ccall((:BinaryenBitmaskVecI16x8, libbinaryen), BinaryenOp, ())
end

function BinaryenShlVecI16x8()
    ccall((:BinaryenShlVecI16x8, libbinaryen), BinaryenOp, ())
end

function BinaryenShrSVecI16x8()
    ccall((:BinaryenShrSVecI16x8, libbinaryen), BinaryenOp, ())
end

function BinaryenShrUVecI16x8()
    ccall((:BinaryenShrUVecI16x8, libbinaryen), BinaryenOp, ())
end

function BinaryenAddVecI16x8()
    ccall((:BinaryenAddVecI16x8, libbinaryen), BinaryenOp, ())
end

function BinaryenAddSatSVecI16x8()
    ccall((:BinaryenAddSatSVecI16x8, libbinaryen), BinaryenOp, ())
end

function BinaryenAddSatUVecI16x8()
    ccall((:BinaryenAddSatUVecI16x8, libbinaryen), BinaryenOp, ())
end

function BinaryenSubVecI16x8()
    ccall((:BinaryenSubVecI16x8, libbinaryen), BinaryenOp, ())
end

function BinaryenSubSatSVecI16x8()
    ccall((:BinaryenSubSatSVecI16x8, libbinaryen), BinaryenOp, ())
end

function BinaryenSubSatUVecI16x8()
    ccall((:BinaryenSubSatUVecI16x8, libbinaryen), BinaryenOp, ())
end

function BinaryenMulVecI16x8()
    ccall((:BinaryenMulVecI16x8, libbinaryen), BinaryenOp, ())
end

function BinaryenMinSVecI16x8()
    ccall((:BinaryenMinSVecI16x8, libbinaryen), BinaryenOp, ())
end

function BinaryenMinUVecI16x8()
    ccall((:BinaryenMinUVecI16x8, libbinaryen), BinaryenOp, ())
end

function BinaryenMaxSVecI16x8()
    ccall((:BinaryenMaxSVecI16x8, libbinaryen), BinaryenOp, ())
end

function BinaryenMaxUVecI16x8()
    ccall((:BinaryenMaxUVecI16x8, libbinaryen), BinaryenOp, ())
end

function BinaryenAvgrUVecI16x8()
    ccall((:BinaryenAvgrUVecI16x8, libbinaryen), BinaryenOp, ())
end

function BinaryenQ15MulrSatSVecI16x8()
    ccall((:BinaryenQ15MulrSatSVecI16x8, libbinaryen), BinaryenOp, ())
end

function BinaryenExtMulLowSVecI16x8()
    ccall((:BinaryenExtMulLowSVecI16x8, libbinaryen), BinaryenOp, ())
end

function BinaryenExtMulHighSVecI16x8()
    ccall((:BinaryenExtMulHighSVecI16x8, libbinaryen), BinaryenOp, ())
end

function BinaryenExtMulLowUVecI16x8()
    ccall((:BinaryenExtMulLowUVecI16x8, libbinaryen), BinaryenOp, ())
end

function BinaryenExtMulHighUVecI16x8()
    ccall((:BinaryenExtMulHighUVecI16x8, libbinaryen), BinaryenOp, ())
end

function BinaryenAbsVecI32x4()
    ccall((:BinaryenAbsVecI32x4, libbinaryen), BinaryenOp, ())
end

function BinaryenNegVecI32x4()
    ccall((:BinaryenNegVecI32x4, libbinaryen), BinaryenOp, ())
end

function BinaryenAllTrueVecI32x4()
    ccall((:BinaryenAllTrueVecI32x4, libbinaryen), BinaryenOp, ())
end

function BinaryenBitmaskVecI32x4()
    ccall((:BinaryenBitmaskVecI32x4, libbinaryen), BinaryenOp, ())
end

function BinaryenShlVecI32x4()
    ccall((:BinaryenShlVecI32x4, libbinaryen), BinaryenOp, ())
end

function BinaryenShrSVecI32x4()
    ccall((:BinaryenShrSVecI32x4, libbinaryen), BinaryenOp, ())
end

function BinaryenShrUVecI32x4()
    ccall((:BinaryenShrUVecI32x4, libbinaryen), BinaryenOp, ())
end

function BinaryenAddVecI32x4()
    ccall((:BinaryenAddVecI32x4, libbinaryen), BinaryenOp, ())
end

function BinaryenSubVecI32x4()
    ccall((:BinaryenSubVecI32x4, libbinaryen), BinaryenOp, ())
end

function BinaryenMulVecI32x4()
    ccall((:BinaryenMulVecI32x4, libbinaryen), BinaryenOp, ())
end

function BinaryenMinSVecI32x4()
    ccall((:BinaryenMinSVecI32x4, libbinaryen), BinaryenOp, ())
end

function BinaryenMinUVecI32x4()
    ccall((:BinaryenMinUVecI32x4, libbinaryen), BinaryenOp, ())
end

function BinaryenMaxSVecI32x4()
    ccall((:BinaryenMaxSVecI32x4, libbinaryen), BinaryenOp, ())
end

function BinaryenMaxUVecI32x4()
    ccall((:BinaryenMaxUVecI32x4, libbinaryen), BinaryenOp, ())
end

function BinaryenDotSVecI16x8ToVecI32x4()
    ccall((:BinaryenDotSVecI16x8ToVecI32x4, libbinaryen), BinaryenOp, ())
end

function BinaryenExtMulLowSVecI32x4()
    ccall((:BinaryenExtMulLowSVecI32x4, libbinaryen), BinaryenOp, ())
end

function BinaryenExtMulHighSVecI32x4()
    ccall((:BinaryenExtMulHighSVecI32x4, libbinaryen), BinaryenOp, ())
end

function BinaryenExtMulLowUVecI32x4()
    ccall((:BinaryenExtMulLowUVecI32x4, libbinaryen), BinaryenOp, ())
end

function BinaryenExtMulHighUVecI32x4()
    ccall((:BinaryenExtMulHighUVecI32x4, libbinaryen), BinaryenOp, ())
end

function BinaryenAbsVecI64x2()
    ccall((:BinaryenAbsVecI64x2, libbinaryen), BinaryenOp, ())
end

function BinaryenNegVecI64x2()
    ccall((:BinaryenNegVecI64x2, libbinaryen), BinaryenOp, ())
end

function BinaryenAllTrueVecI64x2()
    ccall((:BinaryenAllTrueVecI64x2, libbinaryen), BinaryenOp, ())
end

function BinaryenBitmaskVecI64x2()
    ccall((:BinaryenBitmaskVecI64x2, libbinaryen), BinaryenOp, ())
end

function BinaryenShlVecI64x2()
    ccall((:BinaryenShlVecI64x2, libbinaryen), BinaryenOp, ())
end

function BinaryenShrSVecI64x2()
    ccall((:BinaryenShrSVecI64x2, libbinaryen), BinaryenOp, ())
end

function BinaryenShrUVecI64x2()
    ccall((:BinaryenShrUVecI64x2, libbinaryen), BinaryenOp, ())
end

function BinaryenAddVecI64x2()
    ccall((:BinaryenAddVecI64x2, libbinaryen), BinaryenOp, ())
end

function BinaryenSubVecI64x2()
    ccall((:BinaryenSubVecI64x2, libbinaryen), BinaryenOp, ())
end

function BinaryenMulVecI64x2()
    ccall((:BinaryenMulVecI64x2, libbinaryen), BinaryenOp, ())
end

function BinaryenExtMulLowSVecI64x2()
    ccall((:BinaryenExtMulLowSVecI64x2, libbinaryen), BinaryenOp, ())
end

function BinaryenExtMulHighSVecI64x2()
    ccall((:BinaryenExtMulHighSVecI64x2, libbinaryen), BinaryenOp, ())
end

function BinaryenExtMulLowUVecI64x2()
    ccall((:BinaryenExtMulLowUVecI64x2, libbinaryen), BinaryenOp, ())
end

function BinaryenExtMulHighUVecI64x2()
    ccall((:BinaryenExtMulHighUVecI64x2, libbinaryen), BinaryenOp, ())
end

function BinaryenAbsVecF32x4()
    ccall((:BinaryenAbsVecF32x4, libbinaryen), BinaryenOp, ())
end

function BinaryenNegVecF32x4()
    ccall((:BinaryenNegVecF32x4, libbinaryen), BinaryenOp, ())
end

function BinaryenSqrtVecF32x4()
    ccall((:BinaryenSqrtVecF32x4, libbinaryen), BinaryenOp, ())
end

function BinaryenAddVecF32x4()
    ccall((:BinaryenAddVecF32x4, libbinaryen), BinaryenOp, ())
end

function BinaryenSubVecF32x4()
    ccall((:BinaryenSubVecF32x4, libbinaryen), BinaryenOp, ())
end

function BinaryenMulVecF32x4()
    ccall((:BinaryenMulVecF32x4, libbinaryen), BinaryenOp, ())
end

function BinaryenDivVecF32x4()
    ccall((:BinaryenDivVecF32x4, libbinaryen), BinaryenOp, ())
end

function BinaryenMinVecF32x4()
    ccall((:BinaryenMinVecF32x4, libbinaryen), BinaryenOp, ())
end

function BinaryenMaxVecF32x4()
    ccall((:BinaryenMaxVecF32x4, libbinaryen), BinaryenOp, ())
end

function BinaryenPMinVecF32x4()
    ccall((:BinaryenPMinVecF32x4, libbinaryen), BinaryenOp, ())
end

function BinaryenPMaxVecF32x4()
    ccall((:BinaryenPMaxVecF32x4, libbinaryen), BinaryenOp, ())
end

function BinaryenCeilVecF32x4()
    ccall((:BinaryenCeilVecF32x4, libbinaryen), BinaryenOp, ())
end

function BinaryenFloorVecF32x4()
    ccall((:BinaryenFloorVecF32x4, libbinaryen), BinaryenOp, ())
end

function BinaryenTruncVecF32x4()
    ccall((:BinaryenTruncVecF32x4, libbinaryen), BinaryenOp, ())
end

function BinaryenNearestVecF32x4()
    ccall((:BinaryenNearestVecF32x4, libbinaryen), BinaryenOp, ())
end

function BinaryenAbsVecF64x2()
    ccall((:BinaryenAbsVecF64x2, libbinaryen), BinaryenOp, ())
end

function BinaryenNegVecF64x2()
    ccall((:BinaryenNegVecF64x2, libbinaryen), BinaryenOp, ())
end

function BinaryenSqrtVecF64x2()
    ccall((:BinaryenSqrtVecF64x2, libbinaryen), BinaryenOp, ())
end

function BinaryenAddVecF64x2()
    ccall((:BinaryenAddVecF64x2, libbinaryen), BinaryenOp, ())
end

function BinaryenSubVecF64x2()
    ccall((:BinaryenSubVecF64x2, libbinaryen), BinaryenOp, ())
end

function BinaryenMulVecF64x2()
    ccall((:BinaryenMulVecF64x2, libbinaryen), BinaryenOp, ())
end

function BinaryenDivVecF64x2()
    ccall((:BinaryenDivVecF64x2, libbinaryen), BinaryenOp, ())
end

function BinaryenMinVecF64x2()
    ccall((:BinaryenMinVecF64x2, libbinaryen), BinaryenOp, ())
end

function BinaryenMaxVecF64x2()
    ccall((:BinaryenMaxVecF64x2, libbinaryen), BinaryenOp, ())
end

function BinaryenPMinVecF64x2()
    ccall((:BinaryenPMinVecF64x2, libbinaryen), BinaryenOp, ())
end

function BinaryenPMaxVecF64x2()
    ccall((:BinaryenPMaxVecF64x2, libbinaryen), BinaryenOp, ())
end

function BinaryenCeilVecF64x2()
    ccall((:BinaryenCeilVecF64x2, libbinaryen), BinaryenOp, ())
end

function BinaryenFloorVecF64x2()
    ccall((:BinaryenFloorVecF64x2, libbinaryen), BinaryenOp, ())
end

function BinaryenTruncVecF64x2()
    ccall((:BinaryenTruncVecF64x2, libbinaryen), BinaryenOp, ())
end

function BinaryenNearestVecF64x2()
    ccall((:BinaryenNearestVecF64x2, libbinaryen), BinaryenOp, ())
end

function BinaryenExtAddPairwiseSVecI8x16ToI16x8()
    ccall((:BinaryenExtAddPairwiseSVecI8x16ToI16x8, libbinaryen), BinaryenOp, ())
end

function BinaryenExtAddPairwiseUVecI8x16ToI16x8()
    ccall((:BinaryenExtAddPairwiseUVecI8x16ToI16x8, libbinaryen), BinaryenOp, ())
end

function BinaryenExtAddPairwiseSVecI16x8ToI32x4()
    ccall((:BinaryenExtAddPairwiseSVecI16x8ToI32x4, libbinaryen), BinaryenOp, ())
end

function BinaryenExtAddPairwiseUVecI16x8ToI32x4()
    ccall((:BinaryenExtAddPairwiseUVecI16x8ToI32x4, libbinaryen), BinaryenOp, ())
end

function BinaryenTruncSatSVecF32x4ToVecI32x4()
    ccall((:BinaryenTruncSatSVecF32x4ToVecI32x4, libbinaryen), BinaryenOp, ())
end

function BinaryenTruncSatUVecF32x4ToVecI32x4()
    ccall((:BinaryenTruncSatUVecF32x4ToVecI32x4, libbinaryen), BinaryenOp, ())
end

function BinaryenConvertSVecI32x4ToVecF32x4()
    ccall((:BinaryenConvertSVecI32x4ToVecF32x4, libbinaryen), BinaryenOp, ())
end

function BinaryenConvertUVecI32x4ToVecF32x4()
    ccall((:BinaryenConvertUVecI32x4ToVecF32x4, libbinaryen), BinaryenOp, ())
end

function BinaryenLoad8SplatVec128()
    ccall((:BinaryenLoad8SplatVec128, libbinaryen), BinaryenOp, ())
end

function BinaryenLoad16SplatVec128()
    ccall((:BinaryenLoad16SplatVec128, libbinaryen), BinaryenOp, ())
end

function BinaryenLoad32SplatVec128()
    ccall((:BinaryenLoad32SplatVec128, libbinaryen), BinaryenOp, ())
end

function BinaryenLoad64SplatVec128()
    ccall((:BinaryenLoad64SplatVec128, libbinaryen), BinaryenOp, ())
end

function BinaryenLoad8x8SVec128()
    ccall((:BinaryenLoad8x8SVec128, libbinaryen), BinaryenOp, ())
end

function BinaryenLoad8x8UVec128()
    ccall((:BinaryenLoad8x8UVec128, libbinaryen), BinaryenOp, ())
end

function BinaryenLoad16x4SVec128()
    ccall((:BinaryenLoad16x4SVec128, libbinaryen), BinaryenOp, ())
end

function BinaryenLoad16x4UVec128()
    ccall((:BinaryenLoad16x4UVec128, libbinaryen), BinaryenOp, ())
end

function BinaryenLoad32x2SVec128()
    ccall((:BinaryenLoad32x2SVec128, libbinaryen), BinaryenOp, ())
end

function BinaryenLoad32x2UVec128()
    ccall((:BinaryenLoad32x2UVec128, libbinaryen), BinaryenOp, ())
end

function BinaryenLoad32ZeroVec128()
    ccall((:BinaryenLoad32ZeroVec128, libbinaryen), BinaryenOp, ())
end

function BinaryenLoad64ZeroVec128()
    ccall((:BinaryenLoad64ZeroVec128, libbinaryen), BinaryenOp, ())
end

function BinaryenLoad8LaneVec128()
    ccall((:BinaryenLoad8LaneVec128, libbinaryen), BinaryenOp, ())
end

function BinaryenLoad16LaneVec128()
    ccall((:BinaryenLoad16LaneVec128, libbinaryen), BinaryenOp, ())
end

function BinaryenLoad32LaneVec128()
    ccall((:BinaryenLoad32LaneVec128, libbinaryen), BinaryenOp, ())
end

function BinaryenLoad64LaneVec128()
    ccall((:BinaryenLoad64LaneVec128, libbinaryen), BinaryenOp, ())
end

function BinaryenStore8LaneVec128()
    ccall((:BinaryenStore8LaneVec128, libbinaryen), BinaryenOp, ())
end

function BinaryenStore16LaneVec128()
    ccall((:BinaryenStore16LaneVec128, libbinaryen), BinaryenOp, ())
end

function BinaryenStore32LaneVec128()
    ccall((:BinaryenStore32LaneVec128, libbinaryen), BinaryenOp, ())
end

function BinaryenStore64LaneVec128()
    ccall((:BinaryenStore64LaneVec128, libbinaryen), BinaryenOp, ())
end

function BinaryenNarrowSVecI16x8ToVecI8x16()
    ccall((:BinaryenNarrowSVecI16x8ToVecI8x16, libbinaryen), BinaryenOp, ())
end

function BinaryenNarrowUVecI16x8ToVecI8x16()
    ccall((:BinaryenNarrowUVecI16x8ToVecI8x16, libbinaryen), BinaryenOp, ())
end

function BinaryenNarrowSVecI32x4ToVecI16x8()
    ccall((:BinaryenNarrowSVecI32x4ToVecI16x8, libbinaryen), BinaryenOp, ())
end

function BinaryenNarrowUVecI32x4ToVecI16x8()
    ccall((:BinaryenNarrowUVecI32x4ToVecI16x8, libbinaryen), BinaryenOp, ())
end

function BinaryenExtendLowSVecI8x16ToVecI16x8()
    ccall((:BinaryenExtendLowSVecI8x16ToVecI16x8, libbinaryen), BinaryenOp, ())
end

function BinaryenExtendHighSVecI8x16ToVecI16x8()
    ccall((:BinaryenExtendHighSVecI8x16ToVecI16x8, libbinaryen), BinaryenOp, ())
end

function BinaryenExtendLowUVecI8x16ToVecI16x8()
    ccall((:BinaryenExtendLowUVecI8x16ToVecI16x8, libbinaryen), BinaryenOp, ())
end

function BinaryenExtendHighUVecI8x16ToVecI16x8()
    ccall((:BinaryenExtendHighUVecI8x16ToVecI16x8, libbinaryen), BinaryenOp, ())
end

function BinaryenExtendLowSVecI16x8ToVecI32x4()
    ccall((:BinaryenExtendLowSVecI16x8ToVecI32x4, libbinaryen), BinaryenOp, ())
end

function BinaryenExtendHighSVecI16x8ToVecI32x4()
    ccall((:BinaryenExtendHighSVecI16x8ToVecI32x4, libbinaryen), BinaryenOp, ())
end

function BinaryenExtendLowUVecI16x8ToVecI32x4()
    ccall((:BinaryenExtendLowUVecI16x8ToVecI32x4, libbinaryen), BinaryenOp, ())
end

function BinaryenExtendHighUVecI16x8ToVecI32x4()
    ccall((:BinaryenExtendHighUVecI16x8ToVecI32x4, libbinaryen), BinaryenOp, ())
end

function BinaryenExtendLowSVecI32x4ToVecI64x2()
    ccall((:BinaryenExtendLowSVecI32x4ToVecI64x2, libbinaryen), BinaryenOp, ())
end

function BinaryenExtendHighSVecI32x4ToVecI64x2()
    ccall((:BinaryenExtendHighSVecI32x4ToVecI64x2, libbinaryen), BinaryenOp, ())
end

function BinaryenExtendLowUVecI32x4ToVecI64x2()
    ccall((:BinaryenExtendLowUVecI32x4ToVecI64x2, libbinaryen), BinaryenOp, ())
end

function BinaryenExtendHighUVecI32x4ToVecI64x2()
    ccall((:BinaryenExtendHighUVecI32x4ToVecI64x2, libbinaryen), BinaryenOp, ())
end

function BinaryenConvertLowSVecI32x4ToVecF64x2()
    ccall((:BinaryenConvertLowSVecI32x4ToVecF64x2, libbinaryen), BinaryenOp, ())
end

function BinaryenConvertLowUVecI32x4ToVecF64x2()
    ccall((:BinaryenConvertLowUVecI32x4ToVecF64x2, libbinaryen), BinaryenOp, ())
end

function BinaryenTruncSatZeroSVecF64x2ToVecI32x4()
    ccall((:BinaryenTruncSatZeroSVecF64x2ToVecI32x4, libbinaryen), BinaryenOp, ())
end

function BinaryenTruncSatZeroUVecF64x2ToVecI32x4()
    ccall((:BinaryenTruncSatZeroUVecF64x2ToVecI32x4, libbinaryen), BinaryenOp, ())
end

function BinaryenDemoteZeroVecF64x2ToVecF32x4()
    ccall((:BinaryenDemoteZeroVecF64x2ToVecF32x4, libbinaryen), BinaryenOp, ())
end

function BinaryenPromoteLowVecF32x4ToVecF64x2()
    ccall((:BinaryenPromoteLowVecF32x4ToVecF64x2, libbinaryen), BinaryenOp, ())
end

function BinaryenRelaxedTruncSVecF32x4ToVecI32x4()
    ccall((:BinaryenRelaxedTruncSVecF32x4ToVecI32x4, libbinaryen), BinaryenOp, ())
end

function BinaryenRelaxedTruncUVecF32x4ToVecI32x4()
    ccall((:BinaryenRelaxedTruncUVecF32x4ToVecI32x4, libbinaryen), BinaryenOp, ())
end

function BinaryenRelaxedTruncZeroSVecF64x2ToVecI32x4()
    ccall((:BinaryenRelaxedTruncZeroSVecF64x2ToVecI32x4, libbinaryen), BinaryenOp, ())
end

function BinaryenRelaxedTruncZeroUVecF64x2ToVecI32x4()
    ccall((:BinaryenRelaxedTruncZeroUVecF64x2ToVecI32x4, libbinaryen), BinaryenOp, ())
end

function BinaryenSwizzleVecI8x16()
    ccall((:BinaryenSwizzleVecI8x16, libbinaryen), BinaryenOp, ())
end

function BinaryenRelaxedSwizzleVecI8x16()
    ccall((:BinaryenRelaxedSwizzleVecI8x16, libbinaryen), BinaryenOp, ())
end

function BinaryenRelaxedMinVecF32x4()
    ccall((:BinaryenRelaxedMinVecF32x4, libbinaryen), BinaryenOp, ())
end

function BinaryenRelaxedMaxVecF32x4()
    ccall((:BinaryenRelaxedMaxVecF32x4, libbinaryen), BinaryenOp, ())
end

function BinaryenRelaxedMinVecF64x2()
    ccall((:BinaryenRelaxedMinVecF64x2, libbinaryen), BinaryenOp, ())
end

function BinaryenRelaxedMaxVecF64x2()
    ccall((:BinaryenRelaxedMaxVecF64x2, libbinaryen), BinaryenOp, ())
end

function BinaryenRelaxedQ15MulrSVecI16x8()
    ccall((:BinaryenRelaxedQ15MulrSVecI16x8, libbinaryen), BinaryenOp, ())
end

function BinaryenDotI8x16I7x16SToVecI16x8()
    ccall((:BinaryenDotI8x16I7x16SToVecI16x8, libbinaryen), BinaryenOp, ())
end

function BinaryenRefAsNonNull()
    ccall((:BinaryenRefAsNonNull, libbinaryen), BinaryenOp, ())
end

function BinaryenRefAsExternInternalize()
    ccall((:BinaryenRefAsExternInternalize, libbinaryen), BinaryenOp, ())
end

function BinaryenRefAsExternExternalize()
    ccall((:BinaryenRefAsExternExternalize, libbinaryen), BinaryenOp, ())
end

function BinaryenBrOnNull()
    ccall((:BinaryenBrOnNull, libbinaryen), BinaryenOp, ())
end

function BinaryenBrOnNonNull()
    ccall((:BinaryenBrOnNonNull, libbinaryen), BinaryenOp, ())
end

function BinaryenBrOnCast()
    ccall((:BinaryenBrOnCast, libbinaryen), BinaryenOp, ())
end

function BinaryenBrOnCastFail()
    ccall((:BinaryenBrOnCastFail, libbinaryen), BinaryenOp, ())
end

function BinaryenStringNewUTF8()
    ccall((:BinaryenStringNewUTF8, libbinaryen), BinaryenOp, ())
end

function BinaryenStringNewWTF8()
    ccall((:BinaryenStringNewWTF8, libbinaryen), BinaryenOp, ())
end

function BinaryenStringNewLossyUTF8()
    ccall((:BinaryenStringNewLossyUTF8, libbinaryen), BinaryenOp, ())
end

function BinaryenStringNewWTF16()
    ccall((:BinaryenStringNewWTF16, libbinaryen), BinaryenOp, ())
end

function BinaryenStringNewUTF8Array()
    ccall((:BinaryenStringNewUTF8Array, libbinaryen), BinaryenOp, ())
end

function BinaryenStringNewWTF8Array()
    ccall((:BinaryenStringNewWTF8Array, libbinaryen), BinaryenOp, ())
end

function BinaryenStringNewLossyUTF8Array()
    ccall((:BinaryenStringNewLossyUTF8Array, libbinaryen), BinaryenOp, ())
end

function BinaryenStringNewWTF16Array()
    ccall((:BinaryenStringNewWTF16Array, libbinaryen), BinaryenOp, ())
end

function BinaryenStringNewFromCodePoint()
    ccall((:BinaryenStringNewFromCodePoint, libbinaryen), BinaryenOp, ())
end

function BinaryenStringMeasureUTF8()
    ccall((:BinaryenStringMeasureUTF8, libbinaryen), BinaryenOp, ())
end

function BinaryenStringMeasureWTF8()
    ccall((:BinaryenStringMeasureWTF8, libbinaryen), BinaryenOp, ())
end

function BinaryenStringMeasureWTF16()
    ccall((:BinaryenStringMeasureWTF16, libbinaryen), BinaryenOp, ())
end

function BinaryenStringMeasureIsUSV()
    ccall((:BinaryenStringMeasureIsUSV, libbinaryen), BinaryenOp, ())
end

function BinaryenStringMeasureWTF16View()
    ccall((:BinaryenStringMeasureWTF16View, libbinaryen), BinaryenOp, ())
end

function BinaryenStringEncodeUTF8()
    ccall((:BinaryenStringEncodeUTF8, libbinaryen), BinaryenOp, ())
end

function BinaryenStringEncodeLossyUTF8()
    ccall((:BinaryenStringEncodeLossyUTF8, libbinaryen), BinaryenOp, ())
end

function BinaryenStringEncodeWTF8()
    ccall((:BinaryenStringEncodeWTF8, libbinaryen), BinaryenOp, ())
end

function BinaryenStringEncodeWTF16()
    ccall((:BinaryenStringEncodeWTF16, libbinaryen), BinaryenOp, ())
end

function BinaryenStringEncodeUTF8Array()
    ccall((:BinaryenStringEncodeUTF8Array, libbinaryen), BinaryenOp, ())
end

function BinaryenStringEncodeLossyUTF8Array()
    ccall((:BinaryenStringEncodeLossyUTF8Array, libbinaryen), BinaryenOp, ())
end

function BinaryenStringEncodeWTF8Array()
    ccall((:BinaryenStringEncodeWTF8Array, libbinaryen), BinaryenOp, ())
end

function BinaryenStringEncodeWTF16Array()
    ccall((:BinaryenStringEncodeWTF16Array, libbinaryen), BinaryenOp, ())
end

function BinaryenStringAsWTF8()
    ccall((:BinaryenStringAsWTF8, libbinaryen), BinaryenOp, ())
end

function BinaryenStringAsWTF16()
    ccall((:BinaryenStringAsWTF16, libbinaryen), BinaryenOp, ())
end

function BinaryenStringAsIter()
    ccall((:BinaryenStringAsIter, libbinaryen), BinaryenOp, ())
end

function BinaryenStringIterMoveAdvance()
    ccall((:BinaryenStringIterMoveAdvance, libbinaryen), BinaryenOp, ())
end

function BinaryenStringIterMoveRewind()
    ccall((:BinaryenStringIterMoveRewind, libbinaryen), BinaryenOp, ())
end

function BinaryenStringSliceWTF8()
    ccall((:BinaryenStringSliceWTF8, libbinaryen), BinaryenOp, ())
end

function BinaryenStringSliceWTF16()
    ccall((:BinaryenStringSliceWTF16, libbinaryen), BinaryenOp, ())
end

function BinaryenStringEqEqual()
    ccall((:BinaryenStringEqEqual, libbinaryen), BinaryenOp, ())
end

function BinaryenStringEqCompare()
    ccall((:BinaryenStringEqCompare, libbinaryen), BinaryenOp, ())
end

mutable struct BinaryenExpression end

const BinaryenExpressionRef = Ptr{BinaryenExpression}

"""
    BinaryenBlock(_module, name, children, numChildren, type)

Block: name can be NULL. Specifying BinaryenUndefined() as the 'type'
       parameter indicates that the block's type shall be figured out
       automatically instead of explicitly providing it. This conforms
to the behavior before the 'type' parameter has been introduced.
"""
function BinaryenBlock(_module, name, children, numChildren, type)
    ccall((:BinaryenBlock, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, Ptr{Cchar}, Ptr{BinaryenExpressionRef}, BinaryenIndex, BinaryenType), _module, name, children, numChildren, type)
end

"""
    BinaryenIf(_module, condition, ifTrue, ifFalse)

If: ifFalse can be NULL
"""
function BinaryenIf(_module, condition, ifTrue, ifFalse)
    ccall((:BinaryenIf, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, BinaryenExpressionRef, BinaryenExpressionRef, BinaryenExpressionRef), _module, condition, ifTrue, ifFalse)
end

function BinaryenLoop(_module, in, body)
    ccall((:BinaryenLoop, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, Ptr{Cchar}, BinaryenExpressionRef), _module, in, body)
end

"""
    BinaryenBreak(_module, name, condition, value)

Break: value and condition can be NULL
"""
function BinaryenBreak(_module, name, condition, value)
    ccall((:BinaryenBreak, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, Ptr{Cchar}, BinaryenExpressionRef, BinaryenExpressionRef), _module, name, condition, value)
end

"""
    BinaryenSwitch(_module, names, numNames, defaultName, condition, value)

Switch: value can be NULL
"""
function BinaryenSwitch(_module, names, numNames, defaultName, condition, value)
    ccall((:BinaryenSwitch, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, Ptr{Ptr{Cchar}}, BinaryenIndex, Ptr{Cchar}, BinaryenExpressionRef, BinaryenExpressionRef), _module, names, numNames, defaultName, condition, value)
end

"""
    BinaryenCall(_module, target, operands, numOperands, returnType)

Call: Note the 'returnType' parameter. You must declare the
      type returned by the function being called, as that
      function might not have been created yet, so we don't
know what it is.
"""
function BinaryenCall(_module, target, operands, numOperands, returnType)
    ccall((:BinaryenCall, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, Ptr{Cchar}, Ptr{BinaryenExpressionRef}, BinaryenIndex, BinaryenType), _module, target, operands, numOperands, returnType)
end

function BinaryenCallIndirect(_module, table, target, operands, numOperands, params, results)
    ccall((:BinaryenCallIndirect, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, Ptr{Cchar}, BinaryenExpressionRef, Ptr{BinaryenExpressionRef}, BinaryenIndex, BinaryenType, BinaryenType), _module, table, target, operands, numOperands, params, results)
end

function BinaryenReturnCall(_module, target, operands, numOperands, returnType)
    ccall((:BinaryenReturnCall, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, Ptr{Cchar}, Ptr{BinaryenExpressionRef}, BinaryenIndex, BinaryenType), _module, target, operands, numOperands, returnType)
end

function BinaryenReturnCallIndirect(_module, table, target, operands, numOperands, params, results)
    ccall((:BinaryenReturnCallIndirect, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, Ptr{Cchar}, BinaryenExpressionRef, Ptr{BinaryenExpressionRef}, BinaryenIndex, BinaryenType, BinaryenType), _module, table, target, operands, numOperands, params, results)
end

"""
    BinaryenLocalGet(_module, index, type)

LocalGet: Note the 'type' parameter. It might seem redundant, since the
          local at that index must have a type. However, this API lets you
          build code "top-down": create a node, then its parents, and so
          on, and finally create the function at the end. (Note that in fact
          you do not mention a function when creating ExpressionRefs, only
          a module.) And since LocalGet is a leaf node, we need to be told
          its type. (Other nodes detect their type either from their
          type or their opcode, or failing that, their children. But
          LocalGet has no children, it is where a "stream" of type info
          begins.)
          Note also that the index of a local can refer to a param or
          a var, that is, either a parameter to the function or a variable
          declared when you call BinaryenAddFunction. See BinaryenAddFunction
for more details.
"""
function BinaryenLocalGet(_module, index, type)
    ccall((:BinaryenLocalGet, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, BinaryenIndex, BinaryenType), _module, index, type)
end

function BinaryenLocalSet(_module, index, value)
    ccall((:BinaryenLocalSet, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, BinaryenIndex, BinaryenExpressionRef), _module, index, value)
end

function BinaryenLocalTee(_module, index, value, type)
    ccall((:BinaryenLocalTee, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, BinaryenIndex, BinaryenExpressionRef, BinaryenType), _module, index, value, type)
end

function BinaryenGlobalGet(_module, name, type)
    ccall((:BinaryenGlobalGet, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, Ptr{Cchar}, BinaryenType), _module, name, type)
end

function BinaryenGlobalSet(_module, name, value)
    ccall((:BinaryenGlobalSet, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, Ptr{Cchar}, BinaryenExpressionRef), _module, name, value)
end

"""
    BinaryenLoad(_module, bytes, signed_, offset, align, type, ptr, memoryName)

Load: align can be 0, in which case it will be the natural alignment (equal
to bytes)
"""
function BinaryenLoad(_module, bytes, signed_, offset, align, type, ptr, memoryName)
    ccall((:BinaryenLoad, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, UInt32, Bool, UInt32, UInt32, BinaryenType, BinaryenExpressionRef, Ptr{Cchar}), _module, bytes, signed_, offset, align, type, ptr, memoryName)
end

"""
    BinaryenStore(_module, bytes, offset, align, ptr, value, type, memoryName)

Store: align can be 0, in which case it will be the natural alignment (equal
to bytes)
"""
function BinaryenStore(_module, bytes, offset, align, ptr, value, type, memoryName)
    ccall((:BinaryenStore, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, UInt32, UInt32, UInt32, BinaryenExpressionRef, BinaryenExpressionRef, BinaryenType, Ptr{Cchar}), _module, bytes, offset, align, ptr, value, type, memoryName)
end

function BinaryenConst(_module, value)
    ccall((:BinaryenConst, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, BinaryenLiteral), _module, value)
end

function BinaryenUnary(_module, op, value)
    ccall((:BinaryenUnary, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, BinaryenOp, BinaryenExpressionRef), _module, op, value)
end

function BinaryenBinary(_module, op, left, right)
    ccall((:BinaryenBinary, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, BinaryenOp, BinaryenExpressionRef, BinaryenExpressionRef), _module, op, left, right)
end

function BinaryenSelect(_module, condition, ifTrue, ifFalse, type)
    ccall((:BinaryenSelect, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, BinaryenExpressionRef, BinaryenExpressionRef, BinaryenExpressionRef, BinaryenType), _module, condition, ifTrue, ifFalse, type)
end

function BinaryenDrop(_module, value)
    ccall((:BinaryenDrop, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, BinaryenExpressionRef), _module, value)
end

"""
    BinaryenReturn(_module, value)

Return: value can be NULL
"""
function BinaryenReturn(_module, value)
    ccall((:BinaryenReturn, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, BinaryenExpressionRef), _module, value)
end

function BinaryenMemorySize(_module, memoryName, memoryIs64)
    ccall((:BinaryenMemorySize, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, Ptr{Cchar}, Bool), _module, memoryName, memoryIs64)
end

function BinaryenMemoryGrow(_module, delta, memoryName, memoryIs64)
    ccall((:BinaryenMemoryGrow, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, BinaryenExpressionRef, Ptr{Cchar}, Bool), _module, delta, memoryName, memoryIs64)
end

function BinaryenNop(_module)
    ccall((:BinaryenNop, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef,), _module)
end

function BinaryenUnreachable(_module)
    ccall((:BinaryenUnreachable, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef,), _module)
end

function BinaryenAtomicLoad(_module, bytes, offset, type, ptr, memoryName)
    ccall((:BinaryenAtomicLoad, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, UInt32, UInt32, BinaryenType, BinaryenExpressionRef, Ptr{Cchar}), _module, bytes, offset, type, ptr, memoryName)
end

function BinaryenAtomicStore(_module, bytes, offset, ptr, value, type, memoryName)
    ccall((:BinaryenAtomicStore, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, UInt32, UInt32, BinaryenExpressionRef, BinaryenExpressionRef, BinaryenType, Ptr{Cchar}), _module, bytes, offset, ptr, value, type, memoryName)
end

function BinaryenAtomicRMW(_module, op, bytes, offset, ptr, value, type, memoryName)
    ccall((:BinaryenAtomicRMW, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, BinaryenOp, BinaryenIndex, BinaryenIndex, BinaryenExpressionRef, BinaryenExpressionRef, BinaryenType, Ptr{Cchar}), _module, op, bytes, offset, ptr, value, type, memoryName)
end

function BinaryenAtomicCmpxchg(_module, bytes, offset, ptr, expected, replacement, type, memoryName)
    ccall((:BinaryenAtomicCmpxchg, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, BinaryenIndex, BinaryenIndex, BinaryenExpressionRef, BinaryenExpressionRef, BinaryenExpressionRef, BinaryenType, Ptr{Cchar}), _module, bytes, offset, ptr, expected, replacement, type, memoryName)
end

function BinaryenAtomicWait(_module, ptr, expected, timeout, type, memoryName)
    ccall((:BinaryenAtomicWait, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, BinaryenExpressionRef, BinaryenExpressionRef, BinaryenExpressionRef, BinaryenType, Ptr{Cchar}), _module, ptr, expected, timeout, type, memoryName)
end

function BinaryenAtomicNotify(_module, ptr, notifyCount, memoryName)
    ccall((:BinaryenAtomicNotify, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, BinaryenExpressionRef, BinaryenExpressionRef, Ptr{Cchar}), _module, ptr, notifyCount, memoryName)
end

function BinaryenAtomicFence(_module)
    ccall((:BinaryenAtomicFence, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef,), _module)
end

function BinaryenSIMDExtract(_module, op, vec, index)
    ccall((:BinaryenSIMDExtract, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, BinaryenOp, BinaryenExpressionRef, UInt8), _module, op, vec, index)
end

function BinaryenSIMDReplace(_module, op, vec, index, value)
    ccall((:BinaryenSIMDReplace, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, BinaryenOp, BinaryenExpressionRef, UInt8, BinaryenExpressionRef), _module, op, vec, index, value)
end

function BinaryenSIMDShuffle(_module, left, right, mask)
    ccall((:BinaryenSIMDShuffle, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, BinaryenExpressionRef, BinaryenExpressionRef, Ptr{UInt8}), _module, left, right, mask)
end

function BinaryenSIMDTernary(_module, op, a, b, c)
    ccall((:BinaryenSIMDTernary, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, BinaryenOp, BinaryenExpressionRef, BinaryenExpressionRef, BinaryenExpressionRef), _module, op, a, b, c)
end

function BinaryenSIMDShift(_module, op, vec, shift)
    ccall((:BinaryenSIMDShift, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, BinaryenOp, BinaryenExpressionRef, BinaryenExpressionRef), _module, op, vec, shift)
end

function BinaryenSIMDLoad(_module, op, offset, align, ptr, name)
    ccall((:BinaryenSIMDLoad, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, BinaryenOp, UInt32, UInt32, BinaryenExpressionRef, Ptr{Cchar}), _module, op, offset, align, ptr, name)
end

function BinaryenSIMDLoadStoreLane(_module, op, offset, align, index, ptr, vec, memoryName)
    ccall((:BinaryenSIMDLoadStoreLane, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, BinaryenOp, UInt32, UInt32, UInt8, BinaryenExpressionRef, BinaryenExpressionRef, Ptr{Cchar}), _module, op, offset, align, index, ptr, vec, memoryName)
end

function BinaryenMemoryInit(_module, segment, dest, offset, size, memoryName)
    ccall((:BinaryenMemoryInit, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, Ptr{Cchar}, BinaryenExpressionRef, BinaryenExpressionRef, BinaryenExpressionRef, Ptr{Cchar}), _module, segment, dest, offset, size, memoryName)
end

function BinaryenDataDrop(_module, segment)
    ccall((:BinaryenDataDrop, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, Ptr{Cchar}), _module, segment)
end

function BinaryenMemoryCopy(_module, dest, source, size, destMemory, sourceMemory)
    ccall((:BinaryenMemoryCopy, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, BinaryenExpressionRef, BinaryenExpressionRef, BinaryenExpressionRef, Ptr{Cchar}, Ptr{Cchar}), _module, dest, source, size, destMemory, sourceMemory)
end

function BinaryenMemoryFill(_module, dest, value, size, memoryName)
    ccall((:BinaryenMemoryFill, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, BinaryenExpressionRef, BinaryenExpressionRef, BinaryenExpressionRef, Ptr{Cchar}), _module, dest, value, size, memoryName)
end

function BinaryenRefNull(_module, type)
    ccall((:BinaryenRefNull, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, BinaryenType), _module, type)
end

function BinaryenRefIsNull(_module, value)
    ccall((:BinaryenRefIsNull, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, BinaryenExpressionRef), _module, value)
end

function BinaryenRefAs(_module, op, value)
    ccall((:BinaryenRefAs, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, BinaryenOp, BinaryenExpressionRef), _module, op, value)
end

function BinaryenRefFunc(_module, func, type)
    ccall((:BinaryenRefFunc, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, Ptr{Cchar}, BinaryenType), _module, func, type)
end

function BinaryenRefEq(_module, left, right)
    ccall((:BinaryenRefEq, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, BinaryenExpressionRef, BinaryenExpressionRef), _module, left, right)
end

function BinaryenTableGet(_module, name, index, type)
    ccall((:BinaryenTableGet, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, Ptr{Cchar}, BinaryenExpressionRef, BinaryenType), _module, name, index, type)
end

function BinaryenTableSet(_module, name, index, value)
    ccall((:BinaryenTableSet, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, Ptr{Cchar}, BinaryenExpressionRef, BinaryenExpressionRef), _module, name, index, value)
end

function BinaryenTableSize(_module, name)
    ccall((:BinaryenTableSize, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, Ptr{Cchar}), _module, name)
end

function BinaryenTableGrow(_module, name, value, delta)
    ccall((:BinaryenTableGrow, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, Ptr{Cchar}, BinaryenExpressionRef, BinaryenExpressionRef), _module, name, value, delta)
end

"""
    BinaryenTry(_module, name, body, catchTags, numCatchTags, catchBodies, numCatchBodies, delegateTarget)

Try: name can be NULL. delegateTarget should be NULL in try-catch.
"""
function BinaryenTry(_module, name, body, catchTags, numCatchTags, catchBodies, numCatchBodies, delegateTarget)
    ccall((:BinaryenTry, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, Ptr{Cchar}, BinaryenExpressionRef, Ptr{Ptr{Cchar}}, BinaryenIndex, Ptr{BinaryenExpressionRef}, BinaryenIndex, Ptr{Cchar}), _module, name, body, catchTags, numCatchTags, catchBodies, numCatchBodies, delegateTarget)
end

function BinaryenThrow(_module, tag, operands, numOperands)
    ccall((:BinaryenThrow, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, Ptr{Cchar}, Ptr{BinaryenExpressionRef}, BinaryenIndex), _module, tag, operands, numOperands)
end

function BinaryenRethrow(_module, target)
    ccall((:BinaryenRethrow, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, Ptr{Cchar}), _module, target)
end

function BinaryenTupleMake(_module, operands, numOperands)
    ccall((:BinaryenTupleMake, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, Ptr{BinaryenExpressionRef}, BinaryenIndex), _module, operands, numOperands)
end

function BinaryenTupleExtract(_module, tuple, index)
    ccall((:BinaryenTupleExtract, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, BinaryenExpressionRef, BinaryenIndex), _module, tuple, index)
end

function BinaryenPop(_module, type)
    ccall((:BinaryenPop, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, BinaryenType), _module, type)
end

function BinaryenI31New(_module, value)
    ccall((:BinaryenI31New, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, BinaryenExpressionRef), _module, value)
end

function BinaryenI31Get(_module, i31, signed_)
    ccall((:BinaryenI31Get, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, BinaryenExpressionRef, Bool), _module, i31, signed_)
end

function BinaryenCallRef(_module, target, operands, numOperands, type, isReturn)
    ccall((:BinaryenCallRef, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, BinaryenExpressionRef, Ptr{BinaryenExpressionRef}, BinaryenIndex, BinaryenType, Bool), _module, target, operands, numOperands, type, isReturn)
end

function BinaryenRefTest(_module, ref, castType)
    ccall((:BinaryenRefTest, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, BinaryenExpressionRef, BinaryenType), _module, ref, castType)
end

function BinaryenRefCast(_module, ref, type)
    ccall((:BinaryenRefCast, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, BinaryenExpressionRef, BinaryenType), _module, ref, type)
end

function BinaryenBrOn(_module, op, name, ref, castType)
    ccall((:BinaryenBrOn, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, BinaryenOp, Ptr{Cchar}, BinaryenExpressionRef, BinaryenType), _module, op, name, ref, castType)
end

function BinaryenStructNew(_module, operands, numOperands, type)
    ccall((:BinaryenStructNew, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, Ptr{BinaryenExpressionRef}, BinaryenIndex, BinaryenHeapType), _module, operands, numOperands, type)
end

function BinaryenStructGet(_module, index, ref, type, signed_)
    ccall((:BinaryenStructGet, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, BinaryenIndex, BinaryenExpressionRef, BinaryenType, Bool), _module, index, ref, type, signed_)
end

function BinaryenStructSet(_module, index, ref, value)
    ccall((:BinaryenStructSet, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, BinaryenIndex, BinaryenExpressionRef, BinaryenExpressionRef), _module, index, ref, value)
end

function BinaryenArrayNew(_module, type, size, init)
    ccall((:BinaryenArrayNew, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, BinaryenHeapType, BinaryenExpressionRef, BinaryenExpressionRef), _module, type, size, init)
end

"""
    BinaryenArrayNewFixed(_module, type, values, numValues)

TODO: BinaryenArrayNewSeg
"""
function BinaryenArrayNewFixed(_module, type, values, numValues)
    ccall((:BinaryenArrayNewFixed, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, BinaryenHeapType, Ptr{BinaryenExpressionRef}, BinaryenIndex), _module, type, values, numValues)
end

function BinaryenArrayGet(_module, ref, index, type, signed_)
    ccall((:BinaryenArrayGet, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, BinaryenExpressionRef, BinaryenExpressionRef, BinaryenType, Bool), _module, ref, index, type, signed_)
end

function BinaryenArraySet(_module, ref, index, value)
    ccall((:BinaryenArraySet, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, BinaryenExpressionRef, BinaryenExpressionRef, BinaryenExpressionRef), _module, ref, index, value)
end

function BinaryenArrayLen(_module, ref)
    ccall((:BinaryenArrayLen, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, BinaryenExpressionRef), _module, ref)
end

function BinaryenArrayCopy(_module, destRef, destIndex, srcRef, srcIndex, length)
    ccall((:BinaryenArrayCopy, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, BinaryenExpressionRef, BinaryenExpressionRef, BinaryenExpressionRef, BinaryenExpressionRef, BinaryenExpressionRef), _module, destRef, destIndex, srcRef, srcIndex, length)
end

function BinaryenStringNew(_module, op, ptr, length, start, _end, try_)
    ccall((:BinaryenStringNew, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, BinaryenOp, BinaryenExpressionRef, BinaryenExpressionRef, BinaryenExpressionRef, BinaryenExpressionRef, Bool), _module, op, ptr, length, start, _end, try_)
end

function BinaryenStringConst(_module, name)
    ccall((:BinaryenStringConst, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, Ptr{Cchar}), _module, name)
end

function BinaryenStringMeasure(_module, op, ref)
    ccall((:BinaryenStringMeasure, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, BinaryenOp, BinaryenExpressionRef), _module, op, ref)
end

function BinaryenStringEncode(_module, op, ref, ptr, start)
    ccall((:BinaryenStringEncode, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, BinaryenOp, BinaryenExpressionRef, BinaryenExpressionRef, BinaryenExpressionRef), _module, op, ref, ptr, start)
end

function BinaryenStringConcat(_module, left, right)
    ccall((:BinaryenStringConcat, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, BinaryenExpressionRef, BinaryenExpressionRef), _module, left, right)
end

function BinaryenStringEq(_module, op, left, right)
    ccall((:BinaryenStringEq, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, BinaryenOp, BinaryenExpressionRef, BinaryenExpressionRef), _module, op, left, right)
end

function BinaryenStringAs(_module, op, ref)
    ccall((:BinaryenStringAs, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, BinaryenOp, BinaryenExpressionRef), _module, op, ref)
end

function BinaryenStringWTF8Advance(_module, ref, pos, bytes)
    ccall((:BinaryenStringWTF8Advance, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, BinaryenExpressionRef, BinaryenExpressionRef, BinaryenExpressionRef), _module, ref, pos, bytes)
end

function BinaryenStringWTF16Get(_module, ref, pos)
    ccall((:BinaryenStringWTF16Get, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, BinaryenExpressionRef, BinaryenExpressionRef), _module, ref, pos)
end

function BinaryenStringIterNext(_module, ref)
    ccall((:BinaryenStringIterNext, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, BinaryenExpressionRef), _module, ref)
end

function BinaryenStringIterMove(_module, op, ref, num)
    ccall((:BinaryenStringIterMove, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, BinaryenOp, BinaryenExpressionRef, BinaryenExpressionRef), _module, op, ref, num)
end

function BinaryenStringSliceWTF(_module, op, ref, start, _end)
    ccall((:BinaryenStringSliceWTF, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, BinaryenOp, BinaryenExpressionRef, BinaryenExpressionRef, BinaryenExpressionRef), _module, op, ref, start, _end)
end

function BinaryenStringSliceIter(_module, ref, num)
    ccall((:BinaryenStringSliceIter, libbinaryen), BinaryenExpressionRef, (BinaryenModuleRef, BinaryenExpressionRef, BinaryenExpressionRef), _module, ref, num)
end

"""
    BinaryenExpressionGetId(expr)

Gets the id (kind) of the given expression.
"""
function BinaryenExpressionGetId(expr)
    ccall((:BinaryenExpressionGetId, libbinaryen), BinaryenExpressionId, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenExpressionGetType(expr)

Gets the type of the given expression.
"""
function BinaryenExpressionGetType(expr)
    ccall((:BinaryenExpressionGetType, libbinaryen), BinaryenType, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenExpressionSetType(expr, type)

Sets the type of the given expression.
"""
function BinaryenExpressionSetType(expr, type)
    ccall((:BinaryenExpressionSetType, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenType), expr, type)
end

"""
    BinaryenExpressionPrint(expr)

Prints text format of the given expression to stdout.
"""
function BinaryenExpressionPrint(expr)
    ccall((:BinaryenExpressionPrint, libbinaryen), Cvoid, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenExpressionFinalize(expr)

Re-finalizes an expression after it has been modified.
"""
function BinaryenExpressionFinalize(expr)
    ccall((:BinaryenExpressionFinalize, libbinaryen), Cvoid, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenExpressionCopy(expr, _module)

Makes a deep copy of the given expression.
"""
function BinaryenExpressionCopy(expr, _module)
    ccall((:BinaryenExpressionCopy, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef, BinaryenModuleRef), expr, _module)
end

"""
    BinaryenBlockGetName(expr)

Gets the name (label) of a `block` expression.
"""
function BinaryenBlockGetName(expr)
    ccall((:BinaryenBlockGetName, libbinaryen), Ptr{Cchar}, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenBlockSetName(expr, name)

Sets the name (label) of a `block` expression.
"""
function BinaryenBlockSetName(expr, name)
    ccall((:BinaryenBlockSetName, libbinaryen), Cvoid, (BinaryenExpressionRef, Ptr{Cchar}), expr, name)
end

"""
    BinaryenBlockGetNumChildren(expr)

Gets the number of child expressions of a `block` expression.
"""
function BinaryenBlockGetNumChildren(expr)
    ccall((:BinaryenBlockGetNumChildren, libbinaryen), BinaryenIndex, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenBlockGetChildAt(expr, index)

Gets the child expression at the specified index of a `block` expression.
"""
function BinaryenBlockGetChildAt(expr, index)
    ccall((:BinaryenBlockGetChildAt, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef, BinaryenIndex), expr, index)
end

"""
    BinaryenBlockSetChildAt(expr, index, childExpr)

Sets (replaces) the child expression at the specified index of a `block`
expression.
"""
function BinaryenBlockSetChildAt(expr, index, childExpr)
    ccall((:BinaryenBlockSetChildAt, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenIndex, BinaryenExpressionRef), expr, index, childExpr)
end

"""
    BinaryenBlockAppendChild(expr, childExpr)

Appends a child expression to a `block` expression, returning its insertion
index.
"""
function BinaryenBlockAppendChild(expr, childExpr)
    ccall((:BinaryenBlockAppendChild, libbinaryen), BinaryenIndex, (BinaryenExpressionRef, BinaryenExpressionRef), expr, childExpr)
end

"""
    BinaryenBlockInsertChildAt(expr, index, childExpr)

Inserts a child expression at the specified index of a `block` expression,
moving existing children including the one previously at that index one index
up.
"""
function BinaryenBlockInsertChildAt(expr, index, childExpr)
    ccall((:BinaryenBlockInsertChildAt, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenIndex, BinaryenExpressionRef), expr, index, childExpr)
end

"""
    BinaryenBlockRemoveChildAt(expr, index)

Removes the child expression at the specified index of a `block` expression,
moving all subsequent children one index down. Returns the child expression.
"""
function BinaryenBlockRemoveChildAt(expr, index)
    ccall((:BinaryenBlockRemoveChildAt, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef, BinaryenIndex), expr, index)
end

"""
    BinaryenIfGetCondition(expr)

Gets the condition expression of an `if` expression.
"""
function BinaryenIfGetCondition(expr)
    ccall((:BinaryenIfGetCondition, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenIfSetCondition(expr, condExpr)

Sets the condition expression of an `if` expression.
"""
function BinaryenIfSetCondition(expr, condExpr)
    ccall((:BinaryenIfSetCondition, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, condExpr)
end

"""
    BinaryenIfGetIfTrue(expr)

Gets the ifTrue (then) expression of an `if` expression.
"""
function BinaryenIfGetIfTrue(expr)
    ccall((:BinaryenIfGetIfTrue, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenIfSetIfTrue(expr, ifTrueExpr)

Sets the ifTrue (then) expression of an `if` expression.
"""
function BinaryenIfSetIfTrue(expr, ifTrueExpr)
    ccall((:BinaryenIfSetIfTrue, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, ifTrueExpr)
end

"""
    BinaryenIfGetIfFalse(expr)

Gets the ifFalse (else) expression, if any, of an `if` expression.
"""
function BinaryenIfGetIfFalse(expr)
    ccall((:BinaryenIfGetIfFalse, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenIfSetIfFalse(expr, ifFalseExpr)

Sets the ifFalse (else) expression, if any, of an `if` expression.
"""
function BinaryenIfSetIfFalse(expr, ifFalseExpr)
    ccall((:BinaryenIfSetIfFalse, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, ifFalseExpr)
end

"""
    BinaryenLoopGetName(expr)

Gets the name (label) of a `loop` expression.
"""
function BinaryenLoopGetName(expr)
    ccall((:BinaryenLoopGetName, libbinaryen), Ptr{Cchar}, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenLoopSetName(expr, name)

Sets the name (label) of a `loop` expression.
"""
function BinaryenLoopSetName(expr, name)
    ccall((:BinaryenLoopSetName, libbinaryen), Cvoid, (BinaryenExpressionRef, Ptr{Cchar}), expr, name)
end

"""
    BinaryenLoopGetBody(expr)

Gets the body expression of a `loop` expression.
"""
function BinaryenLoopGetBody(expr)
    ccall((:BinaryenLoopGetBody, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenLoopSetBody(expr, bodyExpr)

Sets the body expression of a `loop` expression.
"""
function BinaryenLoopSetBody(expr, bodyExpr)
    ccall((:BinaryenLoopSetBody, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, bodyExpr)
end

"""
    BinaryenBreakGetName(expr)

Gets the name (target label) of a `br` or `br_if` expression.
"""
function BinaryenBreakGetName(expr)
    ccall((:BinaryenBreakGetName, libbinaryen), Ptr{Cchar}, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenBreakSetName(expr, name)

Sets the name (target label) of a `br` or `br_if` expression.
"""
function BinaryenBreakSetName(expr, name)
    ccall((:BinaryenBreakSetName, libbinaryen), Cvoid, (BinaryenExpressionRef, Ptr{Cchar}), expr, name)
end

"""
    BinaryenBreakGetCondition(expr)

Gets the condition expression, if any, of a `br_if` expression. No condition
indicates a `br` expression.
"""
function BinaryenBreakGetCondition(expr)
    ccall((:BinaryenBreakGetCondition, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenBreakSetCondition(expr, condExpr)

Sets the condition expression, if any, of a `br_if` expression. No condition
makes it a `br` expression.
"""
function BinaryenBreakSetCondition(expr, condExpr)
    ccall((:BinaryenBreakSetCondition, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, condExpr)
end

"""
    BinaryenBreakGetValue(expr)

Gets the value expression, if any, of a `br` or `br_if` expression.
"""
function BinaryenBreakGetValue(expr)
    ccall((:BinaryenBreakGetValue, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenBreakSetValue(expr, valueExpr)

Sets the value expression, if any, of a `br` or `br_if` expression.
"""
function BinaryenBreakSetValue(expr, valueExpr)
    ccall((:BinaryenBreakSetValue, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, valueExpr)
end

"""
    BinaryenSwitchGetNumNames(expr)

Gets the number of names (target labels) of a `br_table` expression.
"""
function BinaryenSwitchGetNumNames(expr)
    ccall((:BinaryenSwitchGetNumNames, libbinaryen), BinaryenIndex, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenSwitchGetNameAt(expr, index)

Gets the name (target label) at the specified index of a `br_table`
expression.
"""
function BinaryenSwitchGetNameAt(expr, index)
    ccall((:BinaryenSwitchGetNameAt, libbinaryen), Ptr{Cchar}, (BinaryenExpressionRef, BinaryenIndex), expr, index)
end

"""
    BinaryenSwitchSetNameAt(expr, index, name)

Sets the name (target label) at the specified index of a `br_table`
expression.
"""
function BinaryenSwitchSetNameAt(expr, index, name)
    ccall((:BinaryenSwitchSetNameAt, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenIndex, Ptr{Cchar}), expr, index, name)
end

"""
    BinaryenSwitchAppendName(expr, name)

Appends a name to a `br_table` expression, returning its insertion index.
"""
function BinaryenSwitchAppendName(expr, name)
    ccall((:BinaryenSwitchAppendName, libbinaryen), BinaryenIndex, (BinaryenExpressionRef, Ptr{Cchar}), expr, name)
end

"""
    BinaryenSwitchInsertNameAt(expr, index, name)

Inserts a name at the specified index of a `br_table` expression, moving
existing names including the one previously at that index one index up.
"""
function BinaryenSwitchInsertNameAt(expr, index, name)
    ccall((:BinaryenSwitchInsertNameAt, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenIndex, Ptr{Cchar}), expr, index, name)
end

"""
    BinaryenSwitchRemoveNameAt(expr, index)

Removes the name at the specified index of a `br_table` expression, moving
all subsequent names one index down. Returns the name.
"""
function BinaryenSwitchRemoveNameAt(expr, index)
    ccall((:BinaryenSwitchRemoveNameAt, libbinaryen), Ptr{Cchar}, (BinaryenExpressionRef, BinaryenIndex), expr, index)
end

"""
    BinaryenSwitchGetDefaultName(expr)

Gets the default name (target label), if any, of a `br_table` expression.
"""
function BinaryenSwitchGetDefaultName(expr)
    ccall((:BinaryenSwitchGetDefaultName, libbinaryen), Ptr{Cchar}, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenSwitchSetDefaultName(expr, name)

Sets the default name (target label), if any, of a `br_table` expression.
"""
function BinaryenSwitchSetDefaultName(expr, name)
    ccall((:BinaryenSwitchSetDefaultName, libbinaryen), Cvoid, (BinaryenExpressionRef, Ptr{Cchar}), expr, name)
end

"""
    BinaryenSwitchGetCondition(expr)

Gets the condition expression of a `br_table` expression.
"""
function BinaryenSwitchGetCondition(expr)
    ccall((:BinaryenSwitchGetCondition, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenSwitchSetCondition(expr, condExpr)

Sets the condition expression of a `br_table` expression.
"""
function BinaryenSwitchSetCondition(expr, condExpr)
    ccall((:BinaryenSwitchSetCondition, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, condExpr)
end

"""
    BinaryenSwitchGetValue(expr)

Gets the value expression, if any, of a `br_table` expression.
"""
function BinaryenSwitchGetValue(expr)
    ccall((:BinaryenSwitchGetValue, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenSwitchSetValue(expr, valueExpr)

Sets the value expression, if any, of a `br_table` expression.
"""
function BinaryenSwitchSetValue(expr, valueExpr)
    ccall((:BinaryenSwitchSetValue, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, valueExpr)
end

"""
    BinaryenCallGetTarget(expr)

Gets the target function name of a `call` expression.
"""
function BinaryenCallGetTarget(expr)
    ccall((:BinaryenCallGetTarget, libbinaryen), Ptr{Cchar}, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenCallSetTarget(expr, target)

Sets the target function name of a `call` expression.
"""
function BinaryenCallSetTarget(expr, target)
    ccall((:BinaryenCallSetTarget, libbinaryen), Cvoid, (BinaryenExpressionRef, Ptr{Cchar}), expr, target)
end

"""
    BinaryenCallGetNumOperands(expr)

Gets the number of operands of a `call` expression.
"""
function BinaryenCallGetNumOperands(expr)
    ccall((:BinaryenCallGetNumOperands, libbinaryen), BinaryenIndex, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenCallGetOperandAt(expr, index)

Gets the operand expression at the specified index of a `call` expression.
"""
function BinaryenCallGetOperandAt(expr, index)
    ccall((:BinaryenCallGetOperandAt, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef, BinaryenIndex), expr, index)
end

"""
    BinaryenCallSetOperandAt(expr, index, operandExpr)

Sets the operand expression at the specified index of a `call` expression.
"""
function BinaryenCallSetOperandAt(expr, index, operandExpr)
    ccall((:BinaryenCallSetOperandAt, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenIndex, BinaryenExpressionRef), expr, index, operandExpr)
end

"""
    BinaryenCallAppendOperand(expr, operandExpr)

Appends an operand expression to a `call` expression, returning its insertion
index.
"""
function BinaryenCallAppendOperand(expr, operandExpr)
    ccall((:BinaryenCallAppendOperand, libbinaryen), BinaryenIndex, (BinaryenExpressionRef, BinaryenExpressionRef), expr, operandExpr)
end

"""
    BinaryenCallInsertOperandAt(expr, index, operandExpr)

Inserts an operand expression at the specified index of a `call` expression,
moving existing operands including the one previously at that index one index
up.
"""
function BinaryenCallInsertOperandAt(expr, index, operandExpr)
    ccall((:BinaryenCallInsertOperandAt, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenIndex, BinaryenExpressionRef), expr, index, operandExpr)
end

"""
    BinaryenCallRemoveOperandAt(expr, index)

Removes the operand expression at the specified index of a `call` expression,
moving all subsequent operands one index down. Returns the operand
expression.
"""
function BinaryenCallRemoveOperandAt(expr, index)
    ccall((:BinaryenCallRemoveOperandAt, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef, BinaryenIndex), expr, index)
end

"""
    BinaryenCallIsReturn(expr)

Gets whether the specified `call` expression is a tail call.
"""
function BinaryenCallIsReturn(expr)
    ccall((:BinaryenCallIsReturn, libbinaryen), Bool, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenCallSetReturn(expr, isReturn)

Sets whether the specified `call` expression is a tail call.
"""
function BinaryenCallSetReturn(expr, isReturn)
    ccall((:BinaryenCallSetReturn, libbinaryen), Cvoid, (BinaryenExpressionRef, Bool), expr, isReturn)
end

"""
    BinaryenCallIndirectGetTarget(expr)

Gets the target expression of a `call_indirect` expression.
"""
function BinaryenCallIndirectGetTarget(expr)
    ccall((:BinaryenCallIndirectGetTarget, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenCallIndirectSetTarget(expr, targetExpr)

Sets the target expression of a `call_indirect` expression.
"""
function BinaryenCallIndirectSetTarget(expr, targetExpr)
    ccall((:BinaryenCallIndirectSetTarget, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, targetExpr)
end

"""
    BinaryenCallIndirectGetTable(expr)

Gets the table name of a `call_indirect` expression.
"""
function BinaryenCallIndirectGetTable(expr)
    ccall((:BinaryenCallIndirectGetTable, libbinaryen), Ptr{Cchar}, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenCallIndirectSetTable(expr, table)

Sets the table name of a `call_indirect` expression.
"""
function BinaryenCallIndirectSetTable(expr, table)
    ccall((:BinaryenCallIndirectSetTable, libbinaryen), Cvoid, (BinaryenExpressionRef, Ptr{Cchar}), expr, table)
end

"""
    BinaryenCallIndirectGetNumOperands(expr)

Gets the number of operands of a `call_indirect` expression.
"""
function BinaryenCallIndirectGetNumOperands(expr)
    ccall((:BinaryenCallIndirectGetNumOperands, libbinaryen), BinaryenIndex, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenCallIndirectGetOperandAt(expr, index)

Gets the operand expression at the specified index of a `call_indirect`
expression.
"""
function BinaryenCallIndirectGetOperandAt(expr, index)
    ccall((:BinaryenCallIndirectGetOperandAt, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef, BinaryenIndex), expr, index)
end

"""
    BinaryenCallIndirectSetOperandAt(expr, index, operandExpr)

Sets the operand expression at the specified index of a `call_indirect`
expression.
"""
function BinaryenCallIndirectSetOperandAt(expr, index, operandExpr)
    ccall((:BinaryenCallIndirectSetOperandAt, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenIndex, BinaryenExpressionRef), expr, index, operandExpr)
end

"""
    BinaryenCallIndirectAppendOperand(expr, operandExpr)

Appends an operand expression to a `call_indirect` expression, returning its
insertion index.
"""
function BinaryenCallIndirectAppendOperand(expr, operandExpr)
    ccall((:BinaryenCallIndirectAppendOperand, libbinaryen), BinaryenIndex, (BinaryenExpressionRef, BinaryenExpressionRef), expr, operandExpr)
end

"""
    BinaryenCallIndirectInsertOperandAt(expr, index, operandExpr)

Inserts an operand expression at the specified index of a `call_indirect`
expression, moving existing operands including the one previously at that
index one index up.
"""
function BinaryenCallIndirectInsertOperandAt(expr, index, operandExpr)
    ccall((:BinaryenCallIndirectInsertOperandAt, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenIndex, BinaryenExpressionRef), expr, index, operandExpr)
end

"""
    BinaryenCallIndirectRemoveOperandAt(expr, index)

Removes the operand expression at the specified index of a `call_indirect`
expression, moving all subsequent operands one index down. Returns the
operand expression.
"""
function BinaryenCallIndirectRemoveOperandAt(expr, index)
    ccall((:BinaryenCallIndirectRemoveOperandAt, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef, BinaryenIndex), expr, index)
end

"""
    BinaryenCallIndirectIsReturn(expr)

Gets whether the specified `call_indirect` expression is a tail call.
"""
function BinaryenCallIndirectIsReturn(expr)
    ccall((:BinaryenCallIndirectIsReturn, libbinaryen), Bool, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenCallIndirectSetReturn(expr, isReturn)

Sets whether the specified `call_indirect` expression is a tail call.
"""
function BinaryenCallIndirectSetReturn(expr, isReturn)
    ccall((:BinaryenCallIndirectSetReturn, libbinaryen), Cvoid, (BinaryenExpressionRef, Bool), expr, isReturn)
end

"""
    BinaryenCallIndirectGetParams(expr)

Gets the parameter types of the specified `call_indirect` expression.
"""
function BinaryenCallIndirectGetParams(expr)
    ccall((:BinaryenCallIndirectGetParams, libbinaryen), BinaryenType, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenCallIndirectSetParams(expr, params)

Sets the parameter types of the specified `call_indirect` expression.
"""
function BinaryenCallIndirectSetParams(expr, params)
    ccall((:BinaryenCallIndirectSetParams, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenType), expr, params)
end

"""
    BinaryenCallIndirectGetResults(expr)

Gets the result types of the specified `call_indirect` expression.
"""
function BinaryenCallIndirectGetResults(expr)
    ccall((:BinaryenCallIndirectGetResults, libbinaryen), BinaryenType, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenCallIndirectSetResults(expr, params)

Sets the result types of the specified `call_indirect` expression.
"""
function BinaryenCallIndirectSetResults(expr, params)
    ccall((:BinaryenCallIndirectSetResults, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenType), expr, params)
end

"""
    BinaryenLocalGetGetIndex(expr)

Gets the local index of a `local.get` expression.
"""
function BinaryenLocalGetGetIndex(expr)
    ccall((:BinaryenLocalGetGetIndex, libbinaryen), BinaryenIndex, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenLocalGetSetIndex(expr, index)

Sets the local index of a `local.get` expression.
"""
function BinaryenLocalGetSetIndex(expr, index)
    ccall((:BinaryenLocalGetSetIndex, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenIndex), expr, index)
end

"""
    BinaryenLocalSetIsTee(expr)

Gets whether a `local.set` tees its value (is a `local.tee`). True if the
expression has a type other than `none`.
"""
function BinaryenLocalSetIsTee(expr)
    ccall((:BinaryenLocalSetIsTee, libbinaryen), Bool, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenLocalSetGetIndex(expr)

Gets the local index of a `local.set` or `local.tee` expression.
"""
function BinaryenLocalSetGetIndex(expr)
    ccall((:BinaryenLocalSetGetIndex, libbinaryen), BinaryenIndex, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenLocalSetSetIndex(expr, index)

Sets the local index of a `local.set` or `local.tee` expression.
"""
function BinaryenLocalSetSetIndex(expr, index)
    ccall((:BinaryenLocalSetSetIndex, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenIndex), expr, index)
end

"""
    BinaryenLocalSetGetValue(expr)

Gets the value expression of a `local.set` or `local.tee` expression.
"""
function BinaryenLocalSetGetValue(expr)
    ccall((:BinaryenLocalSetGetValue, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenLocalSetSetValue(expr, valueExpr)

Sets the value expression of a `local.set` or `local.tee` expression.
"""
function BinaryenLocalSetSetValue(expr, valueExpr)
    ccall((:BinaryenLocalSetSetValue, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, valueExpr)
end

"""
    BinaryenGlobalGetGetName(expr)

Gets the name of the global being accessed by a `global.get` expression.
"""
function BinaryenGlobalGetGetName(expr)
    ccall((:BinaryenGlobalGetGetName, libbinaryen), Ptr{Cchar}, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenGlobalGetSetName(expr, name)

Sets the name of the global being accessed by a `global.get` expression.
"""
function BinaryenGlobalGetSetName(expr, name)
    ccall((:BinaryenGlobalGetSetName, libbinaryen), Cvoid, (BinaryenExpressionRef, Ptr{Cchar}), expr, name)
end

"""
    BinaryenGlobalSetGetName(expr)

Gets the name of the global being accessed by a `global.set` expression.
"""
function BinaryenGlobalSetGetName(expr)
    ccall((:BinaryenGlobalSetGetName, libbinaryen), Ptr{Cchar}, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenGlobalSetSetName(expr, name)

Sets the name of the global being accessed by a `global.set` expression.
"""
function BinaryenGlobalSetSetName(expr, name)
    ccall((:BinaryenGlobalSetSetName, libbinaryen), Cvoid, (BinaryenExpressionRef, Ptr{Cchar}), expr, name)
end

"""
    BinaryenGlobalSetGetValue(expr)

Gets the value expression of a `global.set` expression.
"""
function BinaryenGlobalSetGetValue(expr)
    ccall((:BinaryenGlobalSetGetValue, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenGlobalSetSetValue(expr, valueExpr)

Sets the value expression of a `global.set` expression.
"""
function BinaryenGlobalSetSetValue(expr, valueExpr)
    ccall((:BinaryenGlobalSetSetValue, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, valueExpr)
end

"""
    BinaryenTableGetGetTable(expr)

Gets the name of the table being accessed by a `table.get` expression.
"""
function BinaryenTableGetGetTable(expr)
    ccall((:BinaryenTableGetGetTable, libbinaryen), Ptr{Cchar}, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenTableGetSetTable(expr, table)

Sets the name of the table being accessed by a `table.get` expression.
"""
function BinaryenTableGetSetTable(expr, table)
    ccall((:BinaryenTableGetSetTable, libbinaryen), Cvoid, (BinaryenExpressionRef, Ptr{Cchar}), expr, table)
end

"""
    BinaryenTableGetGetIndex(expr)

Gets the index expression of a `table.get` expression.
"""
function BinaryenTableGetGetIndex(expr)
    ccall((:BinaryenTableGetGetIndex, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenTableGetSetIndex(expr, indexExpr)

Sets the index expression of a `table.get` expression.
"""
function BinaryenTableGetSetIndex(expr, indexExpr)
    ccall((:BinaryenTableGetSetIndex, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, indexExpr)
end

"""
    BinaryenTableSetGetTable(expr)

Gets the name of the table being accessed by a `table.set` expression.
"""
function BinaryenTableSetGetTable(expr)
    ccall((:BinaryenTableSetGetTable, libbinaryen), Ptr{Cchar}, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenTableSetSetTable(expr, table)

Sets the name of the table being accessed by a `table.set` expression.
"""
function BinaryenTableSetSetTable(expr, table)
    ccall((:BinaryenTableSetSetTable, libbinaryen), Cvoid, (BinaryenExpressionRef, Ptr{Cchar}), expr, table)
end

"""
    BinaryenTableSetGetIndex(expr)

Gets the index expression of a `table.set` expression.
"""
function BinaryenTableSetGetIndex(expr)
    ccall((:BinaryenTableSetGetIndex, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenTableSetSetIndex(expr, indexExpr)

Sets the index expression of a `table.set` expression.
"""
function BinaryenTableSetSetIndex(expr, indexExpr)
    ccall((:BinaryenTableSetSetIndex, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, indexExpr)
end

"""
    BinaryenTableSetGetValue(expr)

Gets the value expression of a `table.set` expression.
"""
function BinaryenTableSetGetValue(expr)
    ccall((:BinaryenTableSetGetValue, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenTableSetSetValue(expr, valueExpr)

Sets the value expression of a `table.set` expression.
"""
function BinaryenTableSetSetValue(expr, valueExpr)
    ccall((:BinaryenTableSetSetValue, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, valueExpr)
end

"""
    BinaryenTableSizeGetTable(expr)

Gets the name of the table being accessed by a `table.size` expression.
"""
function BinaryenTableSizeGetTable(expr)
    ccall((:BinaryenTableSizeGetTable, libbinaryen), Ptr{Cchar}, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenTableSizeSetTable(expr, table)

Sets the name of the table being accessed by a `table.size` expression.
"""
function BinaryenTableSizeSetTable(expr, table)
    ccall((:BinaryenTableSizeSetTable, libbinaryen), Cvoid, (BinaryenExpressionRef, Ptr{Cchar}), expr, table)
end

"""
    BinaryenTableGrowGetTable(expr)

Gets the name of the table being accessed by a `table.grow` expression.
"""
function BinaryenTableGrowGetTable(expr)
    ccall((:BinaryenTableGrowGetTable, libbinaryen), Ptr{Cchar}, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenTableGrowSetTable(expr, table)

Sets the name of the table being accessed by a `table.grow` expression.
"""
function BinaryenTableGrowSetTable(expr, table)
    ccall((:BinaryenTableGrowSetTable, libbinaryen), Cvoid, (BinaryenExpressionRef, Ptr{Cchar}), expr, table)
end

"""
    BinaryenTableGrowGetValue(expr)

Gets the value expression of a `table.grow` expression.
"""
function BinaryenTableGrowGetValue(expr)
    ccall((:BinaryenTableGrowGetValue, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenTableGrowSetValue(expr, valueExpr)

Sets the value expression of a `table.grow` expression.
"""
function BinaryenTableGrowSetValue(expr, valueExpr)
    ccall((:BinaryenTableGrowSetValue, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, valueExpr)
end

"""
    BinaryenTableGrowGetDelta(expr)

Gets the delta of a `table.grow` expression.
"""
function BinaryenTableGrowGetDelta(expr)
    ccall((:BinaryenTableGrowGetDelta, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenTableGrowSetDelta(expr, deltaExpr)

Sets the delta of a `table.grow` expression.
"""
function BinaryenTableGrowSetDelta(expr, deltaExpr)
    ccall((:BinaryenTableGrowSetDelta, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, deltaExpr)
end

"""
    BinaryenMemoryGrowGetDelta(expr)

Gets the delta of a `memory.grow` expression.
"""
function BinaryenMemoryGrowGetDelta(expr)
    ccall((:BinaryenMemoryGrowGetDelta, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenMemoryGrowSetDelta(expr, deltaExpr)

Sets the delta of a `memory.grow` expression.
"""
function BinaryenMemoryGrowSetDelta(expr, deltaExpr)
    ccall((:BinaryenMemoryGrowSetDelta, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, deltaExpr)
end

"""
    BinaryenLoadIsAtomic(expr)

Gets whether a `load` expression is atomic (is an `atomic.load`).
"""
function BinaryenLoadIsAtomic(expr)
    ccall((:BinaryenLoadIsAtomic, libbinaryen), Bool, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenLoadSetAtomic(expr, isAtomic)

Sets whether a `load` expression is atomic (is an `atomic.load`).
"""
function BinaryenLoadSetAtomic(expr, isAtomic)
    ccall((:BinaryenLoadSetAtomic, libbinaryen), Cvoid, (BinaryenExpressionRef, Bool), expr, isAtomic)
end

"""
    BinaryenLoadIsSigned(expr)

Gets whether a `load` expression operates on a signed value (`_s`).
"""
function BinaryenLoadIsSigned(expr)
    ccall((:BinaryenLoadIsSigned, libbinaryen), Bool, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenLoadSetSigned(expr, isSigned)

Sets whether a `load` expression operates on a signed value (`_s`).
"""
function BinaryenLoadSetSigned(expr, isSigned)
    ccall((:BinaryenLoadSetSigned, libbinaryen), Cvoid, (BinaryenExpressionRef, Bool), expr, isSigned)
end

"""
    BinaryenLoadGetOffset(expr)

Gets the constant offset of a `load` expression.
"""
function BinaryenLoadGetOffset(expr)
    ccall((:BinaryenLoadGetOffset, libbinaryen), UInt32, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenLoadSetOffset(expr, offset)

Sets the constant offset of a `load` expression.
"""
function BinaryenLoadSetOffset(expr, offset)
    ccall((:BinaryenLoadSetOffset, libbinaryen), Cvoid, (BinaryenExpressionRef, UInt32), expr, offset)
end

"""
    BinaryenLoadGetBytes(expr)

Gets the number of bytes loaded by a `load` expression.
"""
function BinaryenLoadGetBytes(expr)
    ccall((:BinaryenLoadGetBytes, libbinaryen), UInt32, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenLoadSetBytes(expr, bytes)

Sets the number of bytes loaded by a `load` expression.
"""
function BinaryenLoadSetBytes(expr, bytes)
    ccall((:BinaryenLoadSetBytes, libbinaryen), Cvoid, (BinaryenExpressionRef, UInt32), expr, bytes)
end

"""
    BinaryenLoadGetAlign(expr)

Gets the byte alignment of a `load` expression.
"""
function BinaryenLoadGetAlign(expr)
    ccall((:BinaryenLoadGetAlign, libbinaryen), UInt32, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenLoadSetAlign(expr, align)

Sets the byte alignment of a `load` expression.
"""
function BinaryenLoadSetAlign(expr, align)
    ccall((:BinaryenLoadSetAlign, libbinaryen), Cvoid, (BinaryenExpressionRef, UInt32), expr, align)
end

"""
    BinaryenLoadGetPtr(expr)

Gets the pointer expression of a `load` expression.
"""
function BinaryenLoadGetPtr(expr)
    ccall((:BinaryenLoadGetPtr, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenLoadSetPtr(expr, ptrExpr)

Sets the pointer expression of a `load` expression.
"""
function BinaryenLoadSetPtr(expr, ptrExpr)
    ccall((:BinaryenLoadSetPtr, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, ptrExpr)
end

"""
    BinaryenStoreIsAtomic(expr)

Gets whether a `store` expression is atomic (is an `atomic.store`).
"""
function BinaryenStoreIsAtomic(expr)
    ccall((:BinaryenStoreIsAtomic, libbinaryen), Bool, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenStoreSetAtomic(expr, isAtomic)

Sets whether a `store` expression is atomic (is an `atomic.store`).
"""
function BinaryenStoreSetAtomic(expr, isAtomic)
    ccall((:BinaryenStoreSetAtomic, libbinaryen), Cvoid, (BinaryenExpressionRef, Bool), expr, isAtomic)
end

"""
    BinaryenStoreGetBytes(expr)

Gets the number of bytes stored by a `store` expression.
"""
function BinaryenStoreGetBytes(expr)
    ccall((:BinaryenStoreGetBytes, libbinaryen), UInt32, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenStoreSetBytes(expr, bytes)

Sets the number of bytes stored by a `store` expression.
"""
function BinaryenStoreSetBytes(expr, bytes)
    ccall((:BinaryenStoreSetBytes, libbinaryen), Cvoid, (BinaryenExpressionRef, UInt32), expr, bytes)
end

"""
    BinaryenStoreGetOffset(expr)

Gets the constant offset of a `store` expression.
"""
function BinaryenStoreGetOffset(expr)
    ccall((:BinaryenStoreGetOffset, libbinaryen), UInt32, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenStoreSetOffset(expr, offset)

Sets the constant offset of a `store` expression.
"""
function BinaryenStoreSetOffset(expr, offset)
    ccall((:BinaryenStoreSetOffset, libbinaryen), Cvoid, (BinaryenExpressionRef, UInt32), expr, offset)
end

"""
    BinaryenStoreGetAlign(expr)

Gets the byte alignment of a `store` expression.
"""
function BinaryenStoreGetAlign(expr)
    ccall((:BinaryenStoreGetAlign, libbinaryen), UInt32, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenStoreSetAlign(expr, align)

Sets the byte alignment of a `store` expression.
"""
function BinaryenStoreSetAlign(expr, align)
    ccall((:BinaryenStoreSetAlign, libbinaryen), Cvoid, (BinaryenExpressionRef, UInt32), expr, align)
end

"""
    BinaryenStoreGetPtr(expr)

Gets the pointer expression of a `store` expression.
"""
function BinaryenStoreGetPtr(expr)
    ccall((:BinaryenStoreGetPtr, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenStoreSetPtr(expr, ptrExpr)

Sets the pointer expression of a `store` expression.
"""
function BinaryenStoreSetPtr(expr, ptrExpr)
    ccall((:BinaryenStoreSetPtr, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, ptrExpr)
end

"""
    BinaryenStoreGetValue(expr)

Gets the value expression of a `store` expression.
"""
function BinaryenStoreGetValue(expr)
    ccall((:BinaryenStoreGetValue, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenStoreSetValue(expr, valueExpr)

Sets the value expression of a `store` expression.
"""
function BinaryenStoreSetValue(expr, valueExpr)
    ccall((:BinaryenStoreSetValue, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, valueExpr)
end

"""
    BinaryenStoreGetValueType(expr)

Gets the value type of a `store` expression.
"""
function BinaryenStoreGetValueType(expr)
    ccall((:BinaryenStoreGetValueType, libbinaryen), BinaryenType, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenStoreSetValueType(expr, valueType)

Sets the value type of a `store` expression.
"""
function BinaryenStoreSetValueType(expr, valueType)
    ccall((:BinaryenStoreSetValueType, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenType), expr, valueType)
end

"""
    BinaryenConstGetValueI32(expr)

Gets the 32-bit integer value of an `i32.const` expression.
"""
function BinaryenConstGetValueI32(expr)
    ccall((:BinaryenConstGetValueI32, libbinaryen), Int32, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenConstSetValueI32(expr, value)

Sets the 32-bit integer value of an `i32.const` expression.
"""
function BinaryenConstSetValueI32(expr, value)
    ccall((:BinaryenConstSetValueI32, libbinaryen), Cvoid, (BinaryenExpressionRef, Int32), expr, value)
end

"""
    BinaryenConstGetValueI64(expr)

Gets the 64-bit integer value of an `i64.const` expression.
"""
function BinaryenConstGetValueI64(expr)
    ccall((:BinaryenConstGetValueI64, libbinaryen), Int64, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenConstSetValueI64(expr, value)

Sets the 64-bit integer value of an `i64.const` expression.
"""
function BinaryenConstSetValueI64(expr, value)
    ccall((:BinaryenConstSetValueI64, libbinaryen), Cvoid, (BinaryenExpressionRef, Int64), expr, value)
end

"""
    BinaryenConstGetValueI64Low(expr)

Gets the low 32-bits of the 64-bit integer value of an `i64.const`
expression.
"""
function BinaryenConstGetValueI64Low(expr)
    ccall((:BinaryenConstGetValueI64Low, libbinaryen), Int32, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenConstSetValueI64Low(expr, valueLow)

Sets the low 32-bits of the 64-bit integer value of an `i64.const`
expression.
"""
function BinaryenConstSetValueI64Low(expr, valueLow)
    ccall((:BinaryenConstSetValueI64Low, libbinaryen), Cvoid, (BinaryenExpressionRef, Int32), expr, valueLow)
end

"""
    BinaryenConstGetValueI64High(expr)

Gets the high 32-bits of the 64-bit integer value of an `i64.const`
expression.
"""
function BinaryenConstGetValueI64High(expr)
    ccall((:BinaryenConstGetValueI64High, libbinaryen), Int32, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenConstSetValueI64High(expr, valueHigh)

Sets the high 32-bits of the 64-bit integer value of an `i64.const`
expression.
"""
function BinaryenConstSetValueI64High(expr, valueHigh)
    ccall((:BinaryenConstSetValueI64High, libbinaryen), Cvoid, (BinaryenExpressionRef, Int32), expr, valueHigh)
end

"""
    BinaryenConstGetValueF32(expr)

Gets the 32-bit float value of a `f32.const` expression.
"""
function BinaryenConstGetValueF32(expr)
    ccall((:BinaryenConstGetValueF32, libbinaryen), Cfloat, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenConstSetValueF32(expr, value)

Sets the 32-bit float value of a `f32.const` expression.
"""
function BinaryenConstSetValueF32(expr, value)
    ccall((:BinaryenConstSetValueF32, libbinaryen), Cvoid, (BinaryenExpressionRef, Cfloat), expr, value)
end

"""
    BinaryenConstGetValueF64(expr)

Gets the 64-bit float (double) value of a `f64.const` expression.
"""
function BinaryenConstGetValueF64(expr)
    ccall((:BinaryenConstGetValueF64, libbinaryen), Cdouble, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenConstSetValueF64(expr, value)

Sets the 64-bit float (double) value of a `f64.const` expression.
"""
function BinaryenConstSetValueF64(expr, value)
    ccall((:BinaryenConstSetValueF64, libbinaryen), Cvoid, (BinaryenExpressionRef, Cdouble), expr, value)
end

"""
    BinaryenConstGetValueV128(expr, out)

Reads the 128-bit vector value of a `v128.const` expression.
"""
function BinaryenConstGetValueV128(expr, out)
    ccall((:BinaryenConstGetValueV128, libbinaryen), Cvoid, (BinaryenExpressionRef, Ptr{UInt8}), expr, out)
end

"""
    BinaryenConstSetValueV128(expr, value)

Sets the 128-bit vector value of a `v128.const` expression.
"""
function BinaryenConstSetValueV128(expr, value)
    ccall((:BinaryenConstSetValueV128, libbinaryen), Cvoid, (BinaryenExpressionRef, Ptr{UInt8}), expr, value)
end

"""
    BinaryenUnaryGetOp(expr)

Gets the operation being performed by a unary expression.
"""
function BinaryenUnaryGetOp(expr)
    ccall((:BinaryenUnaryGetOp, libbinaryen), BinaryenOp, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenUnarySetOp(expr, op)

Sets the operation being performed by a unary expression.
"""
function BinaryenUnarySetOp(expr, op)
    ccall((:BinaryenUnarySetOp, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenOp), expr, op)
end

"""
    BinaryenUnaryGetValue(expr)

Gets the value expression of a unary expression.
"""
function BinaryenUnaryGetValue(expr)
    ccall((:BinaryenUnaryGetValue, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenUnarySetValue(expr, valueExpr)

Sets the value expression of a unary expression.
"""
function BinaryenUnarySetValue(expr, valueExpr)
    ccall((:BinaryenUnarySetValue, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, valueExpr)
end

"""
    BinaryenBinaryGetOp(expr)

Gets the operation being performed by a binary expression.
"""
function BinaryenBinaryGetOp(expr)
    ccall((:BinaryenBinaryGetOp, libbinaryen), BinaryenOp, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenBinarySetOp(expr, op)

Sets the operation being performed by a binary expression.
"""
function BinaryenBinarySetOp(expr, op)
    ccall((:BinaryenBinarySetOp, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenOp), expr, op)
end

"""
    BinaryenBinaryGetLeft(expr)

Gets the left expression of a binary expression.
"""
function BinaryenBinaryGetLeft(expr)
    ccall((:BinaryenBinaryGetLeft, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenBinarySetLeft(expr, leftExpr)

Sets the left expression of a binary expression.
"""
function BinaryenBinarySetLeft(expr, leftExpr)
    ccall((:BinaryenBinarySetLeft, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, leftExpr)
end

"""
    BinaryenBinaryGetRight(expr)

Gets the right expression of a binary expression.
"""
function BinaryenBinaryGetRight(expr)
    ccall((:BinaryenBinaryGetRight, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenBinarySetRight(expr, rightExpr)

Sets the right expression of a binary expression.
"""
function BinaryenBinarySetRight(expr, rightExpr)
    ccall((:BinaryenBinarySetRight, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, rightExpr)
end

"""
    BinaryenSelectGetIfTrue(expr)

Gets the expression becoming selected by a `select` expression if the
condition turns out true.
"""
function BinaryenSelectGetIfTrue(expr)
    ccall((:BinaryenSelectGetIfTrue, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenSelectSetIfTrue(expr, ifTrueExpr)

Sets the expression becoming selected by a `select` expression if the
condition turns out true.
"""
function BinaryenSelectSetIfTrue(expr, ifTrueExpr)
    ccall((:BinaryenSelectSetIfTrue, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, ifTrueExpr)
end

"""
    BinaryenSelectGetIfFalse(expr)

Gets the expression becoming selected by a `select` expression if the
condition turns out false.
"""
function BinaryenSelectGetIfFalse(expr)
    ccall((:BinaryenSelectGetIfFalse, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenSelectSetIfFalse(expr, ifFalseExpr)

Sets the expression becoming selected by a `select` expression if the
condition turns out false.
"""
function BinaryenSelectSetIfFalse(expr, ifFalseExpr)
    ccall((:BinaryenSelectSetIfFalse, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, ifFalseExpr)
end

"""
    BinaryenSelectGetCondition(expr)

Gets the condition expression of a `select` expression.
"""
function BinaryenSelectGetCondition(expr)
    ccall((:BinaryenSelectGetCondition, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenSelectSetCondition(expr, condExpr)

Sets the condition expression of a `select` expression.
"""
function BinaryenSelectSetCondition(expr, condExpr)
    ccall((:BinaryenSelectSetCondition, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, condExpr)
end

"""
    BinaryenDropGetValue(expr)

Gets the value expression being dropped by a `drop` expression.
"""
function BinaryenDropGetValue(expr)
    ccall((:BinaryenDropGetValue, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenDropSetValue(expr, valueExpr)

Sets the value expression being dropped by a `drop` expression.
"""
function BinaryenDropSetValue(expr, valueExpr)
    ccall((:BinaryenDropSetValue, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, valueExpr)
end

"""
    BinaryenReturnGetValue(expr)

Gets the value expression, if any, being returned by a `return` expression.
"""
function BinaryenReturnGetValue(expr)
    ccall((:BinaryenReturnGetValue, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenReturnSetValue(expr, valueExpr)

Sets the value expression, if any, being returned by a `return` expression.
"""
function BinaryenReturnSetValue(expr, valueExpr)
    ccall((:BinaryenReturnSetValue, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, valueExpr)
end

"""
    BinaryenAtomicRMWGetOp(expr)

Gets the operation being performed by an atomic read-modify-write expression.
"""
function BinaryenAtomicRMWGetOp(expr)
    ccall((:BinaryenAtomicRMWGetOp, libbinaryen), BinaryenOp, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenAtomicRMWSetOp(expr, op)

Sets the operation being performed by an atomic read-modify-write expression.
"""
function BinaryenAtomicRMWSetOp(expr, op)
    ccall((:BinaryenAtomicRMWSetOp, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenOp), expr, op)
end

"""
    BinaryenAtomicRMWGetBytes(expr)

Gets the number of bytes affected by an atomic read-modify-write expression.
"""
function BinaryenAtomicRMWGetBytes(expr)
    ccall((:BinaryenAtomicRMWGetBytes, libbinaryen), UInt32, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenAtomicRMWSetBytes(expr, bytes)

Sets the number of bytes affected by an atomic read-modify-write expression.
"""
function BinaryenAtomicRMWSetBytes(expr, bytes)
    ccall((:BinaryenAtomicRMWSetBytes, libbinaryen), Cvoid, (BinaryenExpressionRef, UInt32), expr, bytes)
end

"""
    BinaryenAtomicRMWGetOffset(expr)

Gets the constant offset of an atomic read-modify-write expression.
"""
function BinaryenAtomicRMWGetOffset(expr)
    ccall((:BinaryenAtomicRMWGetOffset, libbinaryen), UInt32, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenAtomicRMWSetOffset(expr, offset)

Sets the constant offset of an atomic read-modify-write expression.
"""
function BinaryenAtomicRMWSetOffset(expr, offset)
    ccall((:BinaryenAtomicRMWSetOffset, libbinaryen), Cvoid, (BinaryenExpressionRef, UInt32), expr, offset)
end

"""
    BinaryenAtomicRMWGetPtr(expr)

Gets the pointer expression of an atomic read-modify-write expression.
"""
function BinaryenAtomicRMWGetPtr(expr)
    ccall((:BinaryenAtomicRMWGetPtr, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenAtomicRMWSetPtr(expr, ptrExpr)

Sets the pointer expression of an atomic read-modify-write expression.
"""
function BinaryenAtomicRMWSetPtr(expr, ptrExpr)
    ccall((:BinaryenAtomicRMWSetPtr, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, ptrExpr)
end

"""
    BinaryenAtomicRMWGetValue(expr)

Gets the value expression of an atomic read-modify-write expression.
"""
function BinaryenAtomicRMWGetValue(expr)
    ccall((:BinaryenAtomicRMWGetValue, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenAtomicRMWSetValue(expr, valueExpr)

Sets the value expression of an atomic read-modify-write expression.
"""
function BinaryenAtomicRMWSetValue(expr, valueExpr)
    ccall((:BinaryenAtomicRMWSetValue, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, valueExpr)
end

"""
    BinaryenAtomicCmpxchgGetBytes(expr)

Gets the number of bytes affected by an atomic compare and exchange
expression.
"""
function BinaryenAtomicCmpxchgGetBytes(expr)
    ccall((:BinaryenAtomicCmpxchgGetBytes, libbinaryen), UInt32, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenAtomicCmpxchgSetBytes(expr, bytes)

Sets the number of bytes affected by an atomic compare and exchange
expression.
"""
function BinaryenAtomicCmpxchgSetBytes(expr, bytes)
    ccall((:BinaryenAtomicCmpxchgSetBytes, libbinaryen), Cvoid, (BinaryenExpressionRef, UInt32), expr, bytes)
end

"""
    BinaryenAtomicCmpxchgGetOffset(expr)

Gets the constant offset of an atomic compare and exchange expression.
"""
function BinaryenAtomicCmpxchgGetOffset(expr)
    ccall((:BinaryenAtomicCmpxchgGetOffset, libbinaryen), UInt32, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenAtomicCmpxchgSetOffset(expr, offset)

Sets the constant offset of an atomic compare and exchange expression.
"""
function BinaryenAtomicCmpxchgSetOffset(expr, offset)
    ccall((:BinaryenAtomicCmpxchgSetOffset, libbinaryen), Cvoid, (BinaryenExpressionRef, UInt32), expr, offset)
end

"""
    BinaryenAtomicCmpxchgGetPtr(expr)

Gets the pointer expression of an atomic compare and exchange expression.
"""
function BinaryenAtomicCmpxchgGetPtr(expr)
    ccall((:BinaryenAtomicCmpxchgGetPtr, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenAtomicCmpxchgSetPtr(expr, ptrExpr)

Sets the pointer expression of an atomic compare and exchange expression.
"""
function BinaryenAtomicCmpxchgSetPtr(expr, ptrExpr)
    ccall((:BinaryenAtomicCmpxchgSetPtr, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, ptrExpr)
end

"""
    BinaryenAtomicCmpxchgGetExpected(expr)

Gets the expression representing the expected value of an atomic compare and
exchange expression.
"""
function BinaryenAtomicCmpxchgGetExpected(expr)
    ccall((:BinaryenAtomicCmpxchgGetExpected, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenAtomicCmpxchgSetExpected(expr, expectedExpr)

Sets the expression representing the expected value of an atomic compare and
exchange expression.
"""
function BinaryenAtomicCmpxchgSetExpected(expr, expectedExpr)
    ccall((:BinaryenAtomicCmpxchgSetExpected, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, expectedExpr)
end

"""
    BinaryenAtomicCmpxchgGetReplacement(expr)

Gets the replacement expression of an atomic compare and exchange expression.
"""
function BinaryenAtomicCmpxchgGetReplacement(expr)
    ccall((:BinaryenAtomicCmpxchgGetReplacement, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenAtomicCmpxchgSetReplacement(expr, replacementExpr)

Sets the replacement expression of an atomic compare and exchange expression.
"""
function BinaryenAtomicCmpxchgSetReplacement(expr, replacementExpr)
    ccall((:BinaryenAtomicCmpxchgSetReplacement, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, replacementExpr)
end

"""
    BinaryenAtomicWaitGetPtr(expr)

Gets the pointer expression of an `memory.atomic.wait` expression.
"""
function BinaryenAtomicWaitGetPtr(expr)
    ccall((:BinaryenAtomicWaitGetPtr, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenAtomicWaitSetPtr(expr, ptrExpr)

Sets the pointer expression of an `memory.atomic.wait` expression.
"""
function BinaryenAtomicWaitSetPtr(expr, ptrExpr)
    ccall((:BinaryenAtomicWaitSetPtr, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, ptrExpr)
end

"""
    BinaryenAtomicWaitGetExpected(expr)

Gets the expression representing the expected value of an
`memory.atomic.wait` expression.
"""
function BinaryenAtomicWaitGetExpected(expr)
    ccall((:BinaryenAtomicWaitGetExpected, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenAtomicWaitSetExpected(expr, expectedExpr)

Sets the expression representing the expected value of an
`memory.atomic.wait` expression.
"""
function BinaryenAtomicWaitSetExpected(expr, expectedExpr)
    ccall((:BinaryenAtomicWaitSetExpected, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, expectedExpr)
end

"""
    BinaryenAtomicWaitGetTimeout(expr)

Gets the timeout expression of an `memory.atomic.wait` expression.
"""
function BinaryenAtomicWaitGetTimeout(expr)
    ccall((:BinaryenAtomicWaitGetTimeout, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenAtomicWaitSetTimeout(expr, timeoutExpr)

Sets the timeout expression of an `memory.atomic.wait` expression.
"""
function BinaryenAtomicWaitSetTimeout(expr, timeoutExpr)
    ccall((:BinaryenAtomicWaitSetTimeout, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, timeoutExpr)
end

"""
    BinaryenAtomicWaitGetExpectedType(expr)

Gets the expected type of an `memory.atomic.wait` expression.
"""
function BinaryenAtomicWaitGetExpectedType(expr)
    ccall((:BinaryenAtomicWaitGetExpectedType, libbinaryen), BinaryenType, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenAtomicWaitSetExpectedType(expr, expectedType)

Sets the expected type of an `memory.atomic.wait` expression.
"""
function BinaryenAtomicWaitSetExpectedType(expr, expectedType)
    ccall((:BinaryenAtomicWaitSetExpectedType, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenType), expr, expectedType)
end

"""
    BinaryenAtomicNotifyGetPtr(expr)

Gets the pointer expression of an `memory.atomic.notify` expression.
"""
function BinaryenAtomicNotifyGetPtr(expr)
    ccall((:BinaryenAtomicNotifyGetPtr, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenAtomicNotifySetPtr(expr, ptrExpr)

Sets the pointer expression of an `memory.atomic.notify` expression.
"""
function BinaryenAtomicNotifySetPtr(expr, ptrExpr)
    ccall((:BinaryenAtomicNotifySetPtr, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, ptrExpr)
end

"""
    BinaryenAtomicNotifyGetNotifyCount(expr)

Gets the notify count expression of an `memory.atomic.notify` expression.
"""
function BinaryenAtomicNotifyGetNotifyCount(expr)
    ccall((:BinaryenAtomicNotifyGetNotifyCount, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenAtomicNotifySetNotifyCount(expr, notifyCountExpr)

Sets the notify count expression of an `memory.atomic.notify` expression.
"""
function BinaryenAtomicNotifySetNotifyCount(expr, notifyCountExpr)
    ccall((:BinaryenAtomicNotifySetNotifyCount, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, notifyCountExpr)
end

"""
    BinaryenAtomicFenceGetOrder(expr)

Gets the order of an `atomic.fence` expression.
"""
function BinaryenAtomicFenceGetOrder(expr)
    ccall((:BinaryenAtomicFenceGetOrder, libbinaryen), UInt8, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenAtomicFenceSetOrder(expr, order)

Sets the order of an `atomic.fence` expression.
"""
function BinaryenAtomicFenceSetOrder(expr, order)
    ccall((:BinaryenAtomicFenceSetOrder, libbinaryen), Cvoid, (BinaryenExpressionRef, UInt8), expr, order)
end

"""
    BinaryenSIMDExtractGetOp(expr)

Gets the operation being performed by a SIMD extract expression.
"""
function BinaryenSIMDExtractGetOp(expr)
    ccall((:BinaryenSIMDExtractGetOp, libbinaryen), BinaryenOp, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenSIMDExtractSetOp(expr, op)

Sets the operation being performed by a SIMD extract expression.
"""
function BinaryenSIMDExtractSetOp(expr, op)
    ccall((:BinaryenSIMDExtractSetOp, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenOp), expr, op)
end

"""
    BinaryenSIMDExtractGetVec(expr)

Gets the vector expression a SIMD extract expression extracts from.
"""
function BinaryenSIMDExtractGetVec(expr)
    ccall((:BinaryenSIMDExtractGetVec, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenSIMDExtractSetVec(expr, vecExpr)

Sets the vector expression a SIMD extract expression extracts from.
"""
function BinaryenSIMDExtractSetVec(expr, vecExpr)
    ccall((:BinaryenSIMDExtractSetVec, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, vecExpr)
end

"""
    BinaryenSIMDExtractGetIndex(expr)

Gets the index of the extracted lane of a SIMD extract expression.
"""
function BinaryenSIMDExtractGetIndex(expr)
    ccall((:BinaryenSIMDExtractGetIndex, libbinaryen), UInt8, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenSIMDExtractSetIndex(expr, index)

Sets the index of the extracted lane of a SIMD extract expression.
"""
function BinaryenSIMDExtractSetIndex(expr, index)
    ccall((:BinaryenSIMDExtractSetIndex, libbinaryen), Cvoid, (BinaryenExpressionRef, UInt8), expr, index)
end

"""
    BinaryenSIMDReplaceGetOp(expr)

Gets the operation being performed by a SIMD replace expression.
"""
function BinaryenSIMDReplaceGetOp(expr)
    ccall((:BinaryenSIMDReplaceGetOp, libbinaryen), BinaryenOp, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenSIMDReplaceSetOp(expr, op)

Sets the operation being performed by a SIMD replace expression.
"""
function BinaryenSIMDReplaceSetOp(expr, op)
    ccall((:BinaryenSIMDReplaceSetOp, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenOp), expr, op)
end

"""
    BinaryenSIMDReplaceGetVec(expr)

Gets the vector expression a SIMD replace expression replaces in.
"""
function BinaryenSIMDReplaceGetVec(expr)
    ccall((:BinaryenSIMDReplaceGetVec, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenSIMDReplaceSetVec(expr, vecExpr)

Sets the vector expression a SIMD replace expression replaces in.
"""
function BinaryenSIMDReplaceSetVec(expr, vecExpr)
    ccall((:BinaryenSIMDReplaceSetVec, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, vecExpr)
end

"""
    BinaryenSIMDReplaceGetIndex(expr)

Gets the index of the replaced lane of a SIMD replace expression.
"""
function BinaryenSIMDReplaceGetIndex(expr)
    ccall((:BinaryenSIMDReplaceGetIndex, libbinaryen), UInt8, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenSIMDReplaceSetIndex(expr, index)

Sets the index of the replaced lane of a SIMD replace expression.
"""
function BinaryenSIMDReplaceSetIndex(expr, index)
    ccall((:BinaryenSIMDReplaceSetIndex, libbinaryen), Cvoid, (BinaryenExpressionRef, UInt8), expr, index)
end

"""
    BinaryenSIMDReplaceGetValue(expr)

Gets the value expression a SIMD replace expression replaces with.
"""
function BinaryenSIMDReplaceGetValue(expr)
    ccall((:BinaryenSIMDReplaceGetValue, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenSIMDReplaceSetValue(expr, valueExpr)

Sets the value expression a SIMD replace expression replaces with.
"""
function BinaryenSIMDReplaceSetValue(expr, valueExpr)
    ccall((:BinaryenSIMDReplaceSetValue, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, valueExpr)
end

"""
    BinaryenSIMDShuffleGetLeft(expr)

Gets the left expression of a SIMD shuffle expression.
"""
function BinaryenSIMDShuffleGetLeft(expr)
    ccall((:BinaryenSIMDShuffleGetLeft, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenSIMDShuffleSetLeft(expr, leftExpr)

Sets the left expression of a SIMD shuffle expression.
"""
function BinaryenSIMDShuffleSetLeft(expr, leftExpr)
    ccall((:BinaryenSIMDShuffleSetLeft, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, leftExpr)
end

"""
    BinaryenSIMDShuffleGetRight(expr)

Gets the right expression of a SIMD shuffle expression.
"""
function BinaryenSIMDShuffleGetRight(expr)
    ccall((:BinaryenSIMDShuffleGetRight, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenSIMDShuffleSetRight(expr, rightExpr)

Sets the right expression of a SIMD shuffle expression.
"""
function BinaryenSIMDShuffleSetRight(expr, rightExpr)
    ccall((:BinaryenSIMDShuffleSetRight, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, rightExpr)
end

"""
    BinaryenSIMDShuffleGetMask(expr, mask)

Gets the 128-bit mask of a SIMD shuffle expression.
"""
function BinaryenSIMDShuffleGetMask(expr, mask)
    ccall((:BinaryenSIMDShuffleGetMask, libbinaryen), Cvoid, (BinaryenExpressionRef, Ptr{UInt8}), expr, mask)
end

"""
    BinaryenSIMDShuffleSetMask(expr, mask)

Sets the 128-bit mask of a SIMD shuffle expression.
"""
function BinaryenSIMDShuffleSetMask(expr, mask)
    ccall((:BinaryenSIMDShuffleSetMask, libbinaryen), Cvoid, (BinaryenExpressionRef, Ptr{UInt8}), expr, mask)
end

"""
    BinaryenSIMDTernaryGetOp(expr)

Gets the operation being performed by a SIMD ternary expression.
"""
function BinaryenSIMDTernaryGetOp(expr)
    ccall((:BinaryenSIMDTernaryGetOp, libbinaryen), BinaryenOp, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenSIMDTernarySetOp(expr, op)

Sets the operation being performed by a SIMD ternary expression.
"""
function BinaryenSIMDTernarySetOp(expr, op)
    ccall((:BinaryenSIMDTernarySetOp, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenOp), expr, op)
end

"""
    BinaryenSIMDTernaryGetA(expr)

Gets the first operand expression of a SIMD ternary expression.
"""
function BinaryenSIMDTernaryGetA(expr)
    ccall((:BinaryenSIMDTernaryGetA, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenSIMDTernarySetA(expr, aExpr)

Sets the first operand expression of a SIMD ternary expression.
"""
function BinaryenSIMDTernarySetA(expr, aExpr)
    ccall((:BinaryenSIMDTernarySetA, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, aExpr)
end

"""
    BinaryenSIMDTernaryGetB(expr)

Gets the second operand expression of a SIMD ternary expression.
"""
function BinaryenSIMDTernaryGetB(expr)
    ccall((:BinaryenSIMDTernaryGetB, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenSIMDTernarySetB(expr, bExpr)

Sets the second operand expression of a SIMD ternary expression.
"""
function BinaryenSIMDTernarySetB(expr, bExpr)
    ccall((:BinaryenSIMDTernarySetB, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, bExpr)
end

"""
    BinaryenSIMDTernaryGetC(expr)

Gets the third operand expression of a SIMD ternary expression.
"""
function BinaryenSIMDTernaryGetC(expr)
    ccall((:BinaryenSIMDTernaryGetC, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenSIMDTernarySetC(expr, cExpr)

Sets the third operand expression of a SIMD ternary expression.
"""
function BinaryenSIMDTernarySetC(expr, cExpr)
    ccall((:BinaryenSIMDTernarySetC, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, cExpr)
end

"""
    BinaryenSIMDShiftGetOp(expr)

Gets the operation being performed by a SIMD shift expression.
"""
function BinaryenSIMDShiftGetOp(expr)
    ccall((:BinaryenSIMDShiftGetOp, libbinaryen), BinaryenOp, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenSIMDShiftSetOp(expr, op)

Sets the operation being performed by a SIMD shift expression.
"""
function BinaryenSIMDShiftSetOp(expr, op)
    ccall((:BinaryenSIMDShiftSetOp, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenOp), expr, op)
end

"""
    BinaryenSIMDShiftGetVec(expr)

Gets the expression being shifted by a SIMD shift expression.
"""
function BinaryenSIMDShiftGetVec(expr)
    ccall((:BinaryenSIMDShiftGetVec, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenSIMDShiftSetVec(expr, vecExpr)

Sets the expression being shifted by a SIMD shift expression.
"""
function BinaryenSIMDShiftSetVec(expr, vecExpr)
    ccall((:BinaryenSIMDShiftSetVec, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, vecExpr)
end

"""
    BinaryenSIMDShiftGetShift(expr)

Gets the expression representing the shift of a SIMD shift expression.
"""
function BinaryenSIMDShiftGetShift(expr)
    ccall((:BinaryenSIMDShiftGetShift, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenSIMDShiftSetShift(expr, shiftExpr)

Sets the expression representing the shift of a SIMD shift expression.
"""
function BinaryenSIMDShiftSetShift(expr, shiftExpr)
    ccall((:BinaryenSIMDShiftSetShift, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, shiftExpr)
end

"""
    BinaryenSIMDLoadGetOp(expr)

Gets the operation being performed by a SIMD load expression.
"""
function BinaryenSIMDLoadGetOp(expr)
    ccall((:BinaryenSIMDLoadGetOp, libbinaryen), BinaryenOp, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenSIMDLoadSetOp(expr, op)

Sets the operation being performed by a SIMD load expression.
"""
function BinaryenSIMDLoadSetOp(expr, op)
    ccall((:BinaryenSIMDLoadSetOp, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenOp), expr, op)
end

"""
    BinaryenSIMDLoadGetOffset(expr)

Gets the constant offset of a SIMD load expression.
"""
function BinaryenSIMDLoadGetOffset(expr)
    ccall((:BinaryenSIMDLoadGetOffset, libbinaryen), UInt32, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenSIMDLoadSetOffset(expr, offset)

Sets the constant offset of a SIMD load expression.
"""
function BinaryenSIMDLoadSetOffset(expr, offset)
    ccall((:BinaryenSIMDLoadSetOffset, libbinaryen), Cvoid, (BinaryenExpressionRef, UInt32), expr, offset)
end

"""
    BinaryenSIMDLoadGetAlign(expr)

Gets the byte alignment of a SIMD load expression.
"""
function BinaryenSIMDLoadGetAlign(expr)
    ccall((:BinaryenSIMDLoadGetAlign, libbinaryen), UInt32, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenSIMDLoadSetAlign(expr, align)

Sets the byte alignment of a SIMD load expression.
"""
function BinaryenSIMDLoadSetAlign(expr, align)
    ccall((:BinaryenSIMDLoadSetAlign, libbinaryen), Cvoid, (BinaryenExpressionRef, UInt32), expr, align)
end

"""
    BinaryenSIMDLoadGetPtr(expr)

Gets the pointer expression of a SIMD load expression.
"""
function BinaryenSIMDLoadGetPtr(expr)
    ccall((:BinaryenSIMDLoadGetPtr, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenSIMDLoadSetPtr(expr, ptrExpr)

Sets the pointer expression of a SIMD load expression.
"""
function BinaryenSIMDLoadSetPtr(expr, ptrExpr)
    ccall((:BinaryenSIMDLoadSetPtr, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, ptrExpr)
end

"""
    BinaryenSIMDLoadStoreLaneGetOp(expr)

Gets the operation being performed by a SIMD load/store lane expression.
"""
function BinaryenSIMDLoadStoreLaneGetOp(expr)
    ccall((:BinaryenSIMDLoadStoreLaneGetOp, libbinaryen), BinaryenOp, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenSIMDLoadStoreLaneSetOp(expr, op)

Sets the operation being performed by a SIMD load/store lane expression.
"""
function BinaryenSIMDLoadStoreLaneSetOp(expr, op)
    ccall((:BinaryenSIMDLoadStoreLaneSetOp, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenOp), expr, op)
end

"""
    BinaryenSIMDLoadStoreLaneGetOffset(expr)

Gets the constant offset of a SIMD load/store lane expression.
"""
function BinaryenSIMDLoadStoreLaneGetOffset(expr)
    ccall((:BinaryenSIMDLoadStoreLaneGetOffset, libbinaryen), UInt32, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenSIMDLoadStoreLaneSetOffset(expr, offset)

Sets the constant offset of a SIMD load/store lane expression.
"""
function BinaryenSIMDLoadStoreLaneSetOffset(expr, offset)
    ccall((:BinaryenSIMDLoadStoreLaneSetOffset, libbinaryen), Cvoid, (BinaryenExpressionRef, UInt32), expr, offset)
end

"""
    BinaryenSIMDLoadStoreLaneGetAlign(expr)

Gets the byte alignment of a SIMD load/store lane expression.
"""
function BinaryenSIMDLoadStoreLaneGetAlign(expr)
    ccall((:BinaryenSIMDLoadStoreLaneGetAlign, libbinaryen), UInt32, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenSIMDLoadStoreLaneSetAlign(expr, align)

Sets the byte alignment of a SIMD load/store lane expression.
"""
function BinaryenSIMDLoadStoreLaneSetAlign(expr, align)
    ccall((:BinaryenSIMDLoadStoreLaneSetAlign, libbinaryen), Cvoid, (BinaryenExpressionRef, UInt32), expr, align)
end

"""
    BinaryenSIMDLoadStoreLaneGetIndex(expr)

Gets the lane index of a SIMD load/store lane expression.
"""
function BinaryenSIMDLoadStoreLaneGetIndex(expr)
    ccall((:BinaryenSIMDLoadStoreLaneGetIndex, libbinaryen), UInt8, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenSIMDLoadStoreLaneSetIndex(expr, index)

Sets the lane index of a SIMD load/store lane expression.
"""
function BinaryenSIMDLoadStoreLaneSetIndex(expr, index)
    ccall((:BinaryenSIMDLoadStoreLaneSetIndex, libbinaryen), Cvoid, (BinaryenExpressionRef, UInt8), expr, index)
end

"""
    BinaryenSIMDLoadStoreLaneGetPtr(expr)

Gets the pointer expression of a SIMD load/store lane expression.
"""
function BinaryenSIMDLoadStoreLaneGetPtr(expr)
    ccall((:BinaryenSIMDLoadStoreLaneGetPtr, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenSIMDLoadStoreLaneSetPtr(expr, ptrExpr)

Sets the pointer expression of a SIMD load/store lane expression.
"""
function BinaryenSIMDLoadStoreLaneSetPtr(expr, ptrExpr)
    ccall((:BinaryenSIMDLoadStoreLaneSetPtr, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, ptrExpr)
end

"""
    BinaryenSIMDLoadStoreLaneGetVec(expr)

Gets the vector expression of a SIMD load/store lane expression.
"""
function BinaryenSIMDLoadStoreLaneGetVec(expr)
    ccall((:BinaryenSIMDLoadStoreLaneGetVec, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenSIMDLoadStoreLaneSetVec(expr, vecExpr)

Sets the vector expression of a SIMD load/store lane expression.
"""
function BinaryenSIMDLoadStoreLaneSetVec(expr, vecExpr)
    ccall((:BinaryenSIMDLoadStoreLaneSetVec, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, vecExpr)
end

"""
    BinaryenSIMDLoadStoreLaneIsStore(expr)

Gets whether a SIMD load/store lane expression performs a store. Otherwise it
performs a load.
"""
function BinaryenSIMDLoadStoreLaneIsStore(expr)
    ccall((:BinaryenSIMDLoadStoreLaneIsStore, libbinaryen), Bool, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenMemoryInitGetSegment(expr)

Gets the index of the segment being initialized by a `memory.init`
expression.
"""
function BinaryenMemoryInitGetSegment(expr)
    ccall((:BinaryenMemoryInitGetSegment, libbinaryen), Ptr{Cchar}, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenMemoryInitSetSegment(expr, segment)

Sets the index of the segment being initialized by a `memory.init`
expression.
"""
function BinaryenMemoryInitSetSegment(expr, segment)
    ccall((:BinaryenMemoryInitSetSegment, libbinaryen), Cvoid, (BinaryenExpressionRef, Ptr{Cchar}), expr, segment)
end

"""
    BinaryenMemoryInitGetDest(expr)

Gets the destination expression of a `memory.init` expression.
"""
function BinaryenMemoryInitGetDest(expr)
    ccall((:BinaryenMemoryInitGetDest, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenMemoryInitSetDest(expr, destExpr)

Sets the destination expression of a `memory.init` expression.
"""
function BinaryenMemoryInitSetDest(expr, destExpr)
    ccall((:BinaryenMemoryInitSetDest, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, destExpr)
end

"""
    BinaryenMemoryInitGetOffset(expr)

Gets the offset expression of a `memory.init` expression.
"""
function BinaryenMemoryInitGetOffset(expr)
    ccall((:BinaryenMemoryInitGetOffset, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenMemoryInitSetOffset(expr, offsetExpr)

Sets the offset expression of a `memory.init` expression.
"""
function BinaryenMemoryInitSetOffset(expr, offsetExpr)
    ccall((:BinaryenMemoryInitSetOffset, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, offsetExpr)
end

"""
    BinaryenMemoryInitGetSize(expr)

Gets the size expression of a `memory.init` expression.
"""
function BinaryenMemoryInitGetSize(expr)
    ccall((:BinaryenMemoryInitGetSize, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenMemoryInitSetSize(expr, sizeExpr)

Sets the size expression of a `memory.init` expression.
"""
function BinaryenMemoryInitSetSize(expr, sizeExpr)
    ccall((:BinaryenMemoryInitSetSize, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, sizeExpr)
end

"""
    BinaryenDataDropGetSegment(expr)

Gets the index of the segment being dropped by a `data.drop` expression.
"""
function BinaryenDataDropGetSegment(expr)
    ccall((:BinaryenDataDropGetSegment, libbinaryen), Ptr{Cchar}, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenDataDropSetSegment(expr, segment)

Sets the index of the segment being dropped by a `data.drop` expression.
"""
function BinaryenDataDropSetSegment(expr, segment)
    ccall((:BinaryenDataDropSetSegment, libbinaryen), Cvoid, (BinaryenExpressionRef, Ptr{Cchar}), expr, segment)
end

"""
    BinaryenMemoryCopyGetDest(expr)

Gets the destination expression of a `memory.copy` expression.
"""
function BinaryenMemoryCopyGetDest(expr)
    ccall((:BinaryenMemoryCopyGetDest, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenMemoryCopySetDest(expr, destExpr)

Sets the destination expression of a `memory.copy` expression.
"""
function BinaryenMemoryCopySetDest(expr, destExpr)
    ccall((:BinaryenMemoryCopySetDest, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, destExpr)
end

"""
    BinaryenMemoryCopyGetSource(expr)

Gets the source expression of a `memory.copy` expression.
"""
function BinaryenMemoryCopyGetSource(expr)
    ccall((:BinaryenMemoryCopyGetSource, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenMemoryCopySetSource(expr, sourceExpr)

Sets the source expression of a `memory.copy` expression.
"""
function BinaryenMemoryCopySetSource(expr, sourceExpr)
    ccall((:BinaryenMemoryCopySetSource, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, sourceExpr)
end

"""
    BinaryenMemoryCopyGetSize(expr)

Gets the size expression (number of bytes copied) of a `memory.copy`
expression.
"""
function BinaryenMemoryCopyGetSize(expr)
    ccall((:BinaryenMemoryCopyGetSize, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenMemoryCopySetSize(expr, sizeExpr)

Sets the size expression (number of bytes copied) of a `memory.copy`
expression.
"""
function BinaryenMemoryCopySetSize(expr, sizeExpr)
    ccall((:BinaryenMemoryCopySetSize, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, sizeExpr)
end

"""
    BinaryenMemoryFillGetDest(expr)

Gets the destination expression of a `memory.fill` expression.
"""
function BinaryenMemoryFillGetDest(expr)
    ccall((:BinaryenMemoryFillGetDest, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenMemoryFillSetDest(expr, destExpr)

Sets the destination expression of a `memory.fill` expression.
"""
function BinaryenMemoryFillSetDest(expr, destExpr)
    ccall((:BinaryenMemoryFillSetDest, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, destExpr)
end

"""
    BinaryenMemoryFillGetValue(expr)

Gets the value expression of a `memory.fill` expression.
"""
function BinaryenMemoryFillGetValue(expr)
    ccall((:BinaryenMemoryFillGetValue, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenMemoryFillSetValue(expr, valueExpr)

Sets the value expression of a `memory.fill` expression.
"""
function BinaryenMemoryFillSetValue(expr, valueExpr)
    ccall((:BinaryenMemoryFillSetValue, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, valueExpr)
end

"""
    BinaryenMemoryFillGetSize(expr)

Gets the size expression (number of bytes filled) of a `memory.fill`
expression.
"""
function BinaryenMemoryFillGetSize(expr)
    ccall((:BinaryenMemoryFillGetSize, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenMemoryFillSetSize(expr, sizeExpr)

Sets the size expression (number of bytes filled) of a `memory.fill`
expression.
"""
function BinaryenMemoryFillSetSize(expr, sizeExpr)
    ccall((:BinaryenMemoryFillSetSize, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, sizeExpr)
end

"""
    BinaryenRefIsNullGetValue(expr)

RefIsNull
"""
function BinaryenRefIsNullGetValue(expr)
    ccall((:BinaryenRefIsNullGetValue, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenRefIsNullSetValue(expr, valueExpr)

Sets the value expression tested by a `ref.is_null` expression.
"""
function BinaryenRefIsNullSetValue(expr, valueExpr)
    ccall((:BinaryenRefIsNullSetValue, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, valueExpr)
end

"""
    BinaryenRefAsGetOp(expr)

Gets the operation performed by a `ref.as_*` expression.
"""
function BinaryenRefAsGetOp(expr)
    ccall((:BinaryenRefAsGetOp, libbinaryen), BinaryenOp, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenRefAsSetOp(expr, op)

Sets the operation performed by a `ref.as_*` expression.
"""
function BinaryenRefAsSetOp(expr, op)
    ccall((:BinaryenRefAsSetOp, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenOp), expr, op)
end

"""
    BinaryenRefAsGetValue(expr)

Gets the value expression tested by a `ref.as_*` expression.
"""
function BinaryenRefAsGetValue(expr)
    ccall((:BinaryenRefAsGetValue, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenRefAsSetValue(expr, valueExpr)

Sets the value expression tested by a `ref.as_*` expression.
"""
function BinaryenRefAsSetValue(expr, valueExpr)
    ccall((:BinaryenRefAsSetValue, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, valueExpr)
end

"""
    BinaryenRefFuncGetFunc(expr)

Gets the name of the function being wrapped by a `ref.func` expression.
"""
function BinaryenRefFuncGetFunc(expr)
    ccall((:BinaryenRefFuncGetFunc, libbinaryen), Ptr{Cchar}, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenRefFuncSetFunc(expr, funcName)

Sets the name of the function being wrapped by a `ref.func` expression.
"""
function BinaryenRefFuncSetFunc(expr, funcName)
    ccall((:BinaryenRefFuncSetFunc, libbinaryen), Cvoid, (BinaryenExpressionRef, Ptr{Cchar}), expr, funcName)
end

"""
    BinaryenRefEqGetLeft(expr)

Gets the left expression of a `ref.eq` expression.
"""
function BinaryenRefEqGetLeft(expr)
    ccall((:BinaryenRefEqGetLeft, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenRefEqSetLeft(expr, left)

Sets the left expression of a `ref.eq` expression.
"""
function BinaryenRefEqSetLeft(expr, left)
    ccall((:BinaryenRefEqSetLeft, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, left)
end

"""
    BinaryenRefEqGetRight(expr)

Gets the right expression of a `ref.eq` expression.
"""
function BinaryenRefEqGetRight(expr)
    ccall((:BinaryenRefEqGetRight, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenRefEqSetRight(expr, right)

Sets the right expression of a `ref.eq` expression.
"""
function BinaryenRefEqSetRight(expr, right)
    ccall((:BinaryenRefEqSetRight, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, right)
end

"""
    BinaryenTryGetName(expr)

Gets the name (label) of a `try` expression.
"""
function BinaryenTryGetName(expr)
    ccall((:BinaryenTryGetName, libbinaryen), Ptr{Cchar}, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenTrySetName(expr, name)

Sets the name (label) of a `try` expression.
"""
function BinaryenTrySetName(expr, name)
    ccall((:BinaryenTrySetName, libbinaryen), Cvoid, (BinaryenExpressionRef, Ptr{Cchar}), expr, name)
end

"""
    BinaryenTryGetBody(expr)

Gets the body expression of a `try` expression.
"""
function BinaryenTryGetBody(expr)
    ccall((:BinaryenTryGetBody, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenTrySetBody(expr, bodyExpr)

Sets the body expression of a `try` expression.
"""
function BinaryenTrySetBody(expr, bodyExpr)
    ccall((:BinaryenTrySetBody, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, bodyExpr)
end

"""
    BinaryenTryGetNumCatchTags(expr)

Gets the number of catch blocks (= the number of catch tags) of a `try`
expression.
"""
function BinaryenTryGetNumCatchTags(expr)
    ccall((:BinaryenTryGetNumCatchTags, libbinaryen), BinaryenIndex, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenTryGetNumCatchBodies(expr)

Gets the number of catch/catch_all blocks of a `try` expression.
"""
function BinaryenTryGetNumCatchBodies(expr)
    ccall((:BinaryenTryGetNumCatchBodies, libbinaryen), BinaryenIndex, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenTryGetCatchTagAt(expr, index)

Gets the catch tag at the specified index of a `try` expression.
"""
function BinaryenTryGetCatchTagAt(expr, index)
    ccall((:BinaryenTryGetCatchTagAt, libbinaryen), Ptr{Cchar}, (BinaryenExpressionRef, BinaryenIndex), expr, index)
end

"""
    BinaryenTrySetCatchTagAt(expr, index, catchTag)

Sets the catch tag at the specified index of a `try` expression.
"""
function BinaryenTrySetCatchTagAt(expr, index, catchTag)
    ccall((:BinaryenTrySetCatchTagAt, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenIndex, Ptr{Cchar}), expr, index, catchTag)
end

"""
    BinaryenTryAppendCatchTag(expr, catchTag)

Appends a catch tag to a `try` expression, returning its insertion index.
"""
function BinaryenTryAppendCatchTag(expr, catchTag)
    ccall((:BinaryenTryAppendCatchTag, libbinaryen), BinaryenIndex, (BinaryenExpressionRef, Ptr{Cchar}), expr, catchTag)
end

"""
    BinaryenTryInsertCatchTagAt(expr, index, catchTag)

Inserts a catch tag at the specified index of a `try` expression, moving
existing catch tags including the one previously at that index one index up.
"""
function BinaryenTryInsertCatchTagAt(expr, index, catchTag)
    ccall((:BinaryenTryInsertCatchTagAt, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenIndex, Ptr{Cchar}), expr, index, catchTag)
end

"""
    BinaryenTryRemoveCatchTagAt(expr, index)

Removes the catch tag at the specified index of a `try` expression, moving
all subsequent catch tags one index down. Returns the tag.
"""
function BinaryenTryRemoveCatchTagAt(expr, index)
    ccall((:BinaryenTryRemoveCatchTagAt, libbinaryen), Ptr{Cchar}, (BinaryenExpressionRef, BinaryenIndex), expr, index)
end

"""
    BinaryenTryGetCatchBodyAt(expr, index)

Gets the catch body expression at the specified index of a `try` expression.
"""
function BinaryenTryGetCatchBodyAt(expr, index)
    ccall((:BinaryenTryGetCatchBodyAt, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef, BinaryenIndex), expr, index)
end

"""
    BinaryenTrySetCatchBodyAt(expr, index, catchExpr)

Sets the catch body expression at the specified index of a `try` expression.
"""
function BinaryenTrySetCatchBodyAt(expr, index, catchExpr)
    ccall((:BinaryenTrySetCatchBodyAt, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenIndex, BinaryenExpressionRef), expr, index, catchExpr)
end

"""
    BinaryenTryAppendCatchBody(expr, catchExpr)

Appends a catch expression to a `try` expression, returning its insertion
index.
"""
function BinaryenTryAppendCatchBody(expr, catchExpr)
    ccall((:BinaryenTryAppendCatchBody, libbinaryen), BinaryenIndex, (BinaryenExpressionRef, BinaryenExpressionRef), expr, catchExpr)
end

"""
    BinaryenTryInsertCatchBodyAt(expr, index, catchExpr)

Inserts a catch expression at the specified index of a `try` expression,
moving existing catch bodies including the one previously at that index one
index up.
"""
function BinaryenTryInsertCatchBodyAt(expr, index, catchExpr)
    ccall((:BinaryenTryInsertCatchBodyAt, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenIndex, BinaryenExpressionRef), expr, index, catchExpr)
end

"""
    BinaryenTryRemoveCatchBodyAt(expr, index)

Removes the catch expression at the specified index of a `try` expression,
moving all subsequent catch bodies one index down. Returns the catch
expression.
"""
function BinaryenTryRemoveCatchBodyAt(expr, index)
    ccall((:BinaryenTryRemoveCatchBodyAt, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef, BinaryenIndex), expr, index)
end

"""
    BinaryenTryHasCatchAll(expr)

Gets whether a `try` expression has a catch_all clause.
"""
function BinaryenTryHasCatchAll(expr)
    ccall((:BinaryenTryHasCatchAll, libbinaryen), Bool, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenTryGetDelegateTarget(expr)

Gets the target label of a `delegate`.
"""
function BinaryenTryGetDelegateTarget(expr)
    ccall((:BinaryenTryGetDelegateTarget, libbinaryen), Ptr{Cchar}, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenTrySetDelegateTarget(expr, delegateTarget)

Sets the target label of a `delegate`.
"""
function BinaryenTrySetDelegateTarget(expr, delegateTarget)
    ccall((:BinaryenTrySetDelegateTarget, libbinaryen), Cvoid, (BinaryenExpressionRef, Ptr{Cchar}), expr, delegateTarget)
end

"""
    BinaryenTryIsDelegate(expr)

Gets whether a `try` expression is a try-delegate.
"""
function BinaryenTryIsDelegate(expr)
    ccall((:BinaryenTryIsDelegate, libbinaryen), Bool, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenThrowGetTag(expr)

Gets the name of the tag being thrown by a `throw` expression.
"""
function BinaryenThrowGetTag(expr)
    ccall((:BinaryenThrowGetTag, libbinaryen), Ptr{Cchar}, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenThrowSetTag(expr, tagName)

Sets the name of the tag being thrown by a `throw` expression.
"""
function BinaryenThrowSetTag(expr, tagName)
    ccall((:BinaryenThrowSetTag, libbinaryen), Cvoid, (BinaryenExpressionRef, Ptr{Cchar}), expr, tagName)
end

"""
    BinaryenThrowGetNumOperands(expr)

Gets the number of operands of a `throw` expression.
"""
function BinaryenThrowGetNumOperands(expr)
    ccall((:BinaryenThrowGetNumOperands, libbinaryen), BinaryenIndex, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenThrowGetOperandAt(expr, index)

Gets the operand at the specified index of a `throw` expression.
"""
function BinaryenThrowGetOperandAt(expr, index)
    ccall((:BinaryenThrowGetOperandAt, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef, BinaryenIndex), expr, index)
end

"""
    BinaryenThrowSetOperandAt(expr, index, operandExpr)

Sets the operand at the specified index of a `throw` expression.
"""
function BinaryenThrowSetOperandAt(expr, index, operandExpr)
    ccall((:BinaryenThrowSetOperandAt, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenIndex, BinaryenExpressionRef), expr, index, operandExpr)
end

"""
    BinaryenThrowAppendOperand(expr, operandExpr)

Appends an operand expression to a `throw` expression, returning its
insertion index.
"""
function BinaryenThrowAppendOperand(expr, operandExpr)
    ccall((:BinaryenThrowAppendOperand, libbinaryen), BinaryenIndex, (BinaryenExpressionRef, BinaryenExpressionRef), expr, operandExpr)
end

"""
    BinaryenThrowInsertOperandAt(expr, index, operandExpr)

Inserts an operand expression at the specified index of a `throw` expression,
moving existing operands including the one previously at that index one index
up.
"""
function BinaryenThrowInsertOperandAt(expr, index, operandExpr)
    ccall((:BinaryenThrowInsertOperandAt, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenIndex, BinaryenExpressionRef), expr, index, operandExpr)
end

"""
    BinaryenThrowRemoveOperandAt(expr, index)

Removes the operand expression at the specified index of a `throw`
expression, moving all subsequent operands one index down. Returns the
operand expression.
"""
function BinaryenThrowRemoveOperandAt(expr, index)
    ccall((:BinaryenThrowRemoveOperandAt, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef, BinaryenIndex), expr, index)
end

"""
    BinaryenRethrowGetTarget(expr)

Gets the target catch's corresponding try label of a `rethrow` expression.
"""
function BinaryenRethrowGetTarget(expr)
    ccall((:BinaryenRethrowGetTarget, libbinaryen), Ptr{Cchar}, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenRethrowSetTarget(expr, target)

Sets the target catch's corresponding try label of a `rethrow` expression.
"""
function BinaryenRethrowSetTarget(expr, target)
    ccall((:BinaryenRethrowSetTarget, libbinaryen), Cvoid, (BinaryenExpressionRef, Ptr{Cchar}), expr, target)
end

"""
    BinaryenTupleMakeGetNumOperands(expr)

Gets the number of operands of a `tuple.make` expression.
"""
function BinaryenTupleMakeGetNumOperands(expr)
    ccall((:BinaryenTupleMakeGetNumOperands, libbinaryen), BinaryenIndex, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenTupleMakeGetOperandAt(expr, index)

Gets the operand at the specified index of a `tuple.make` expression.
"""
function BinaryenTupleMakeGetOperandAt(expr, index)
    ccall((:BinaryenTupleMakeGetOperandAt, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef, BinaryenIndex), expr, index)
end

"""
    BinaryenTupleMakeSetOperandAt(expr, index, operandExpr)

Sets the operand at the specified index of a `tuple.make` expression.
"""
function BinaryenTupleMakeSetOperandAt(expr, index, operandExpr)
    ccall((:BinaryenTupleMakeSetOperandAt, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenIndex, BinaryenExpressionRef), expr, index, operandExpr)
end

"""
    BinaryenTupleMakeAppendOperand(expr, operandExpr)

Appends an operand expression to a `tuple.make` expression, returning its
insertion index.
"""
function BinaryenTupleMakeAppendOperand(expr, operandExpr)
    ccall((:BinaryenTupleMakeAppendOperand, libbinaryen), BinaryenIndex, (BinaryenExpressionRef, BinaryenExpressionRef), expr, operandExpr)
end

"""
    BinaryenTupleMakeInsertOperandAt(expr, index, operandExpr)

Inserts an operand expression at the specified index of a `tuple.make`
expression, moving existing operands including the one previously at that
index one index up.
"""
function BinaryenTupleMakeInsertOperandAt(expr, index, operandExpr)
    ccall((:BinaryenTupleMakeInsertOperandAt, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenIndex, BinaryenExpressionRef), expr, index, operandExpr)
end

"""
    BinaryenTupleMakeRemoveOperandAt(expr, index)

Removes the operand expression at the specified index of a `tuple.make`
expression, moving all subsequent operands one index down. Returns the
operand expression.
"""
function BinaryenTupleMakeRemoveOperandAt(expr, index)
    ccall((:BinaryenTupleMakeRemoveOperandAt, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef, BinaryenIndex), expr, index)
end

"""
    BinaryenTupleExtractGetTuple(expr)

Gets the tuple extracted from of a `tuple.extract` expression.
"""
function BinaryenTupleExtractGetTuple(expr)
    ccall((:BinaryenTupleExtractGetTuple, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenTupleExtractSetTuple(expr, tupleExpr)

Sets the tuple extracted from of a `tuple.extract` expression.
"""
function BinaryenTupleExtractSetTuple(expr, tupleExpr)
    ccall((:BinaryenTupleExtractSetTuple, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, tupleExpr)
end

"""
    BinaryenTupleExtractGetIndex(expr)

Gets the index extracted at of a `tuple.extract` expression.
"""
function BinaryenTupleExtractGetIndex(expr)
    ccall((:BinaryenTupleExtractGetIndex, libbinaryen), BinaryenIndex, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenTupleExtractSetIndex(expr, index)

Sets the index extracted at of a `tuple.extract` expression.
"""
function BinaryenTupleExtractSetIndex(expr, index)
    ccall((:BinaryenTupleExtractSetIndex, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenIndex), expr, index)
end

"""
    BinaryenI31NewGetValue(expr)

Gets the value expression of an `i31.new` expression.
"""
function BinaryenI31NewGetValue(expr)
    ccall((:BinaryenI31NewGetValue, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenI31NewSetValue(expr, valueExpr)

Sets the value expression of an `i31.new` expression.
"""
function BinaryenI31NewSetValue(expr, valueExpr)
    ccall((:BinaryenI31NewSetValue, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, valueExpr)
end

"""
    BinaryenI31GetGetI31(expr)

Gets the i31 expression of an `i31.get` expression.
"""
function BinaryenI31GetGetI31(expr)
    ccall((:BinaryenI31GetGetI31, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenI31GetSetI31(expr, i31Expr)

Sets the i31 expression of an `i31.get` expression.
"""
function BinaryenI31GetSetI31(expr, i31Expr)
    ccall((:BinaryenI31GetSetI31, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, i31Expr)
end

"""
    BinaryenI31GetIsSigned(expr)

Gets whether an `i31.get` expression returns a signed value (`_s`).
"""
function BinaryenI31GetIsSigned(expr)
    ccall((:BinaryenI31GetIsSigned, libbinaryen), Bool, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenI31GetSetSigned(expr, signed_)

Sets whether an `i31.get` expression returns a signed value (`_s`).
"""
function BinaryenI31GetSetSigned(expr, signed_)
    ccall((:BinaryenI31GetSetSigned, libbinaryen), Cvoid, (BinaryenExpressionRef, Bool), expr, signed_)
end

"""
    BinaryenCallRefGetNumOperands(expr)

CallRef
"""
function BinaryenCallRefGetNumOperands(expr)
    ccall((:BinaryenCallRefGetNumOperands, libbinaryen), BinaryenIndex, (BinaryenExpressionRef,), expr)
end

function BinaryenCallRefGetOperandAt(expr, index)
    ccall((:BinaryenCallRefGetOperandAt, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef, BinaryenIndex), expr, index)
end

function BinaryenCallRefSetOperandAt(expr, index, operandExpr)
    ccall((:BinaryenCallRefSetOperandAt, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenIndex, BinaryenExpressionRef), expr, index, operandExpr)
end

function BinaryenCallRefAppendOperand(expr, operandExpr)
    ccall((:BinaryenCallRefAppendOperand, libbinaryen), BinaryenIndex, (BinaryenExpressionRef, BinaryenExpressionRef), expr, operandExpr)
end

function BinaryenCallRefInsertOperandAt(expr, index, operandExpr)
    ccall((:BinaryenCallRefInsertOperandAt, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenIndex, BinaryenExpressionRef), expr, index, operandExpr)
end

function BinaryenCallRefRemoveOperandAt(expr, index)
    ccall((:BinaryenCallRefRemoveOperandAt, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef, BinaryenIndex), expr, index)
end

function BinaryenCallRefGetTarget(expr)
    ccall((:BinaryenCallRefGetTarget, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

function BinaryenCallRefSetTarget(expr, targetExpr)
    ccall((:BinaryenCallRefSetTarget, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, targetExpr)
end

function BinaryenCallRefIsReturn(expr)
    ccall((:BinaryenCallRefIsReturn, libbinaryen), Bool, (BinaryenExpressionRef,), expr)
end

function BinaryenCallRefSetReturn(expr, isReturn)
    ccall((:BinaryenCallRefSetReturn, libbinaryen), Cvoid, (BinaryenExpressionRef, Bool), expr, isReturn)
end

"""
    BinaryenRefTestGetRef(expr)

RefTest
"""
function BinaryenRefTestGetRef(expr)
    ccall((:BinaryenRefTestGetRef, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

function BinaryenRefTestSetRef(expr, refExpr)
    ccall((:BinaryenRefTestSetRef, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, refExpr)
end

function BinaryenRefTestGetCastType(expr)
    ccall((:BinaryenRefTestGetCastType, libbinaryen), BinaryenType, (BinaryenExpressionRef,), expr)
end

function BinaryenRefTestSetCastType(expr, intendedType)
    ccall((:BinaryenRefTestSetCastType, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenType), expr, intendedType)
end

"""
    BinaryenRefCastGetRef(expr)

RefCast
"""
function BinaryenRefCastGetRef(expr)
    ccall((:BinaryenRefCastGetRef, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

function BinaryenRefCastSetRef(expr, refExpr)
    ccall((:BinaryenRefCastSetRef, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, refExpr)
end

"""
    BinaryenBrOnGetOp(expr)

BrOn
"""
function BinaryenBrOnGetOp(expr)
    ccall((:BinaryenBrOnGetOp, libbinaryen), BinaryenOp, (BinaryenExpressionRef,), expr)
end

function BinaryenBrOnSetOp(expr, op)
    ccall((:BinaryenBrOnSetOp, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenOp), expr, op)
end

function BinaryenBrOnGetName(expr)
    ccall((:BinaryenBrOnGetName, libbinaryen), Ptr{Cchar}, (BinaryenExpressionRef,), expr)
end

function BinaryenBrOnSetName(expr, nameStr)
    ccall((:BinaryenBrOnSetName, libbinaryen), Cvoid, (BinaryenExpressionRef, Ptr{Cchar}), expr, nameStr)
end

function BinaryenBrOnGetRef(expr)
    ccall((:BinaryenBrOnGetRef, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

function BinaryenBrOnSetRef(expr, refExpr)
    ccall((:BinaryenBrOnSetRef, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, refExpr)
end

function BinaryenBrOnGetCastType(expr)
    ccall((:BinaryenBrOnGetCastType, libbinaryen), BinaryenType, (BinaryenExpressionRef,), expr)
end

function BinaryenBrOnSetCastType(expr, castType)
    ccall((:BinaryenBrOnSetCastType, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenType), expr, castType)
end

"""
    BinaryenStructNewGetNumOperands(expr)

StructNew
"""
function BinaryenStructNewGetNumOperands(expr)
    ccall((:BinaryenStructNewGetNumOperands, libbinaryen), BinaryenIndex, (BinaryenExpressionRef,), expr)
end

function BinaryenStructNewGetOperandAt(expr, index)
    ccall((:BinaryenStructNewGetOperandAt, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef, BinaryenIndex), expr, index)
end

function BinaryenStructNewSetOperandAt(expr, index, operandExpr)
    ccall((:BinaryenStructNewSetOperandAt, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenIndex, BinaryenExpressionRef), expr, index, operandExpr)
end

function BinaryenStructNewAppendOperand(expr, operandExpr)
    ccall((:BinaryenStructNewAppendOperand, libbinaryen), BinaryenIndex, (BinaryenExpressionRef, BinaryenExpressionRef), expr, operandExpr)
end

function BinaryenStructNewInsertOperandAt(expr, index, operandExpr)
    ccall((:BinaryenStructNewInsertOperandAt, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenIndex, BinaryenExpressionRef), expr, index, operandExpr)
end

function BinaryenStructNewRemoveOperandAt(expr, index)
    ccall((:BinaryenStructNewRemoveOperandAt, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef, BinaryenIndex), expr, index)
end

"""
    BinaryenStructGetGetIndex(expr)

StructGet
"""
function BinaryenStructGetGetIndex(expr)
    ccall((:BinaryenStructGetGetIndex, libbinaryen), BinaryenIndex, (BinaryenExpressionRef,), expr)
end

function BinaryenStructGetSetIndex(expr, index)
    ccall((:BinaryenStructGetSetIndex, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenIndex), expr, index)
end

function BinaryenStructGetGetRef(expr)
    ccall((:BinaryenStructGetGetRef, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

function BinaryenStructGetSetRef(expr, refExpr)
    ccall((:BinaryenStructGetSetRef, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, refExpr)
end

function BinaryenStructGetIsSigned(expr)
    ccall((:BinaryenStructGetIsSigned, libbinaryen), Bool, (BinaryenExpressionRef,), expr)
end

function BinaryenStructGetSetSigned(expr, signed_)
    ccall((:BinaryenStructGetSetSigned, libbinaryen), Cvoid, (BinaryenExpressionRef, Bool), expr, signed_)
end

"""
    BinaryenStructSetGetIndex(expr)

StructSet
"""
function BinaryenStructSetGetIndex(expr)
    ccall((:BinaryenStructSetGetIndex, libbinaryen), BinaryenIndex, (BinaryenExpressionRef,), expr)
end

function BinaryenStructSetSetIndex(expr, index)
    ccall((:BinaryenStructSetSetIndex, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenIndex), expr, index)
end

function BinaryenStructSetGetRef(expr)
    ccall((:BinaryenStructSetGetRef, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

function BinaryenStructSetSetRef(expr, refExpr)
    ccall((:BinaryenStructSetSetRef, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, refExpr)
end

function BinaryenStructSetGetValue(expr)
    ccall((:BinaryenStructSetGetValue, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

function BinaryenStructSetSetValue(expr, valueExpr)
    ccall((:BinaryenStructSetSetValue, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, valueExpr)
end

"""
    BinaryenArrayNewGetInit(expr)

ArrayNew
"""
function BinaryenArrayNewGetInit(expr)
    ccall((:BinaryenArrayNewGetInit, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

function BinaryenArrayNewSetInit(expr, initExpr)
    ccall((:BinaryenArrayNewSetInit, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, initExpr)
end

function BinaryenArrayNewGetSize(expr)
    ccall((:BinaryenArrayNewGetSize, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

function BinaryenArrayNewSetSize(expr, sizeExpr)
    ccall((:BinaryenArrayNewSetSize, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, sizeExpr)
end

"""
    BinaryenArrayNewFixedGetNumValues(expr)

ArrayNewFixed
"""
function BinaryenArrayNewFixedGetNumValues(expr)
    ccall((:BinaryenArrayNewFixedGetNumValues, libbinaryen), BinaryenIndex, (BinaryenExpressionRef,), expr)
end

function BinaryenArrayNewFixedGetValueAt(expr, index)
    ccall((:BinaryenArrayNewFixedGetValueAt, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef, BinaryenIndex), expr, index)
end

function BinaryenArrayNewFixedSetValueAt(expr, index, valueExpr)
    ccall((:BinaryenArrayNewFixedSetValueAt, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenIndex, BinaryenExpressionRef), expr, index, valueExpr)
end

function BinaryenArrayNewFixedAppendValue(expr, valueExpr)
    ccall((:BinaryenArrayNewFixedAppendValue, libbinaryen), BinaryenIndex, (BinaryenExpressionRef, BinaryenExpressionRef), expr, valueExpr)
end

function BinaryenArrayNewFixedInsertValueAt(expr, index, valueExpr)
    ccall((:BinaryenArrayNewFixedInsertValueAt, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenIndex, BinaryenExpressionRef), expr, index, valueExpr)
end

function BinaryenArrayNewFixedRemoveValueAt(expr, index)
    ccall((:BinaryenArrayNewFixedRemoveValueAt, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef, BinaryenIndex), expr, index)
end

"""
    BinaryenArrayGetGetRef(expr)

ArrayGet
"""
function BinaryenArrayGetGetRef(expr)
    ccall((:BinaryenArrayGetGetRef, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

function BinaryenArrayGetSetRef(expr, refExpr)
    ccall((:BinaryenArrayGetSetRef, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, refExpr)
end

function BinaryenArrayGetGetIndex(expr)
    ccall((:BinaryenArrayGetGetIndex, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

function BinaryenArrayGetSetIndex(expr, indexExpr)
    ccall((:BinaryenArrayGetSetIndex, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, indexExpr)
end

function BinaryenArrayGetIsSigned(expr)
    ccall((:BinaryenArrayGetIsSigned, libbinaryen), Bool, (BinaryenExpressionRef,), expr)
end

function BinaryenArrayGetSetSigned(expr, signed_)
    ccall((:BinaryenArrayGetSetSigned, libbinaryen), Cvoid, (BinaryenExpressionRef, Bool), expr, signed_)
end

"""
    BinaryenArraySetGetRef(expr)

ArraySet
"""
function BinaryenArraySetGetRef(expr)
    ccall((:BinaryenArraySetGetRef, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

function BinaryenArraySetSetRef(expr, refExpr)
    ccall((:BinaryenArraySetSetRef, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, refExpr)
end

function BinaryenArraySetGetIndex(expr)
    ccall((:BinaryenArraySetGetIndex, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

function BinaryenArraySetSetIndex(expr, indexExpr)
    ccall((:BinaryenArraySetSetIndex, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, indexExpr)
end

function BinaryenArraySetGetValue(expr)
    ccall((:BinaryenArraySetGetValue, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

function BinaryenArraySetSetValue(expr, valueExpr)
    ccall((:BinaryenArraySetSetValue, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, valueExpr)
end

"""
    BinaryenArrayLenGetRef(expr)

ArrayLen
"""
function BinaryenArrayLenGetRef(expr)
    ccall((:BinaryenArrayLenGetRef, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

function BinaryenArrayLenSetRef(expr, refExpr)
    ccall((:BinaryenArrayLenSetRef, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, refExpr)
end

"""
    BinaryenArrayCopyGetDestRef(expr)

ArrayCopy
"""
function BinaryenArrayCopyGetDestRef(expr)
    ccall((:BinaryenArrayCopyGetDestRef, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

function BinaryenArrayCopySetDestRef(expr, destRefExpr)
    ccall((:BinaryenArrayCopySetDestRef, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, destRefExpr)
end

function BinaryenArrayCopyGetDestIndex(expr)
    ccall((:BinaryenArrayCopyGetDestIndex, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

function BinaryenArrayCopySetDestIndex(expr, destIndexExpr)
    ccall((:BinaryenArrayCopySetDestIndex, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, destIndexExpr)
end

function BinaryenArrayCopyGetSrcRef(expr)
    ccall((:BinaryenArrayCopyGetSrcRef, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

function BinaryenArrayCopySetSrcRef(expr, srcRefExpr)
    ccall((:BinaryenArrayCopySetSrcRef, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, srcRefExpr)
end

function BinaryenArrayCopyGetSrcIndex(expr)
    ccall((:BinaryenArrayCopyGetSrcIndex, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

function BinaryenArrayCopySetSrcIndex(expr, srcIndexExpr)
    ccall((:BinaryenArrayCopySetSrcIndex, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, srcIndexExpr)
end

function BinaryenArrayCopyGetLength(expr)
    ccall((:BinaryenArrayCopyGetLength, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

function BinaryenArrayCopySetLength(expr, lengthExpr)
    ccall((:BinaryenArrayCopySetLength, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, lengthExpr)
end

"""
    BinaryenStringNewGetOp(expr)

StringNew
"""
function BinaryenStringNewGetOp(expr)
    ccall((:BinaryenStringNewGetOp, libbinaryen), BinaryenOp, (BinaryenExpressionRef,), expr)
end

function BinaryenStringNewSetOp(expr, op)
    ccall((:BinaryenStringNewSetOp, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenOp), expr, op)
end

function BinaryenStringNewGetPtr(expr)
    ccall((:BinaryenStringNewGetPtr, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

function BinaryenStringNewSetPtr(expr, ptrExpr)
    ccall((:BinaryenStringNewSetPtr, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, ptrExpr)
end

function BinaryenStringNewGetLength(expr)
    ccall((:BinaryenStringNewGetLength, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

function BinaryenStringNewSetLength(expr, lengthExpr)
    ccall((:BinaryenStringNewSetLength, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, lengthExpr)
end

function BinaryenStringNewGetStart(expr)
    ccall((:BinaryenStringNewGetStart, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

function BinaryenStringNewSetStart(expr, startExpr)
    ccall((:BinaryenStringNewSetStart, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, startExpr)
end

function BinaryenStringNewGetEnd(expr)
    ccall((:BinaryenStringNewGetEnd, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

function BinaryenStringNewSetEnd(expr, endExpr)
    ccall((:BinaryenStringNewSetEnd, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, endExpr)
end

function BinaryenStringNewSetTry(expr, try_)
    ccall((:BinaryenStringNewSetTry, libbinaryen), Cvoid, (BinaryenExpressionRef, Bool), expr, try_)
end

function BinaryenStringNewIsTry(expr)
    ccall((:BinaryenStringNewIsTry, libbinaryen), Bool, (BinaryenExpressionRef,), expr)
end

"""
    BinaryenStringConstGetString(expr)

StringConst
"""
function BinaryenStringConstGetString(expr)
    ccall((:BinaryenStringConstGetString, libbinaryen), Ptr{Cchar}, (BinaryenExpressionRef,), expr)
end

function BinaryenStringConstSetString(expr, stringStr)
    ccall((:BinaryenStringConstSetString, libbinaryen), Cvoid, (BinaryenExpressionRef, Ptr{Cchar}), expr, stringStr)
end

"""
    BinaryenStringMeasureGetOp(expr)

StringMeasure
"""
function BinaryenStringMeasureGetOp(expr)
    ccall((:BinaryenStringMeasureGetOp, libbinaryen), BinaryenOp, (BinaryenExpressionRef,), expr)
end

function BinaryenStringMeasureSetOp(expr, op)
    ccall((:BinaryenStringMeasureSetOp, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenOp), expr, op)
end

function BinaryenStringMeasureGetRef(expr)
    ccall((:BinaryenStringMeasureGetRef, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

function BinaryenStringMeasureSetRef(expr, refExpr)
    ccall((:BinaryenStringMeasureSetRef, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, refExpr)
end

"""
    BinaryenStringEncodeGetOp(expr)

StringEncode
"""
function BinaryenStringEncodeGetOp(expr)
    ccall((:BinaryenStringEncodeGetOp, libbinaryen), BinaryenOp, (BinaryenExpressionRef,), expr)
end

function BinaryenStringEncodeSetOp(expr, op)
    ccall((:BinaryenStringEncodeSetOp, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenOp), expr, op)
end

function BinaryenStringEncodeGetRef(expr)
    ccall((:BinaryenStringEncodeGetRef, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

function BinaryenStringEncodeSetRef(expr, refExpr)
    ccall((:BinaryenStringEncodeSetRef, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, refExpr)
end

function BinaryenStringEncodeGetPtr(expr)
    ccall((:BinaryenStringEncodeGetPtr, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

function BinaryenStringEncodeSetPtr(expr, ptrExpr)
    ccall((:BinaryenStringEncodeSetPtr, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, ptrExpr)
end

function BinaryenStringEncodeGetStart(expr)
    ccall((:BinaryenStringEncodeGetStart, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

function BinaryenStringEncodeSetStart(expr, startExpr)
    ccall((:BinaryenStringEncodeSetStart, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, startExpr)
end

"""
    BinaryenStringConcatGetLeft(expr)

StringConcat
"""
function BinaryenStringConcatGetLeft(expr)
    ccall((:BinaryenStringConcatGetLeft, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

function BinaryenStringConcatSetLeft(expr, leftExpr)
    ccall((:BinaryenStringConcatSetLeft, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, leftExpr)
end

function BinaryenStringConcatGetRight(expr)
    ccall((:BinaryenStringConcatGetRight, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

function BinaryenStringConcatSetRight(expr, rightExpr)
    ccall((:BinaryenStringConcatSetRight, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, rightExpr)
end

"""
    BinaryenStringEqGetOp(expr)

StringEq
"""
function BinaryenStringEqGetOp(expr)
    ccall((:BinaryenStringEqGetOp, libbinaryen), BinaryenOp, (BinaryenExpressionRef,), expr)
end

function BinaryenStringEqSetOp(expr, op)
    ccall((:BinaryenStringEqSetOp, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenOp), expr, op)
end

function BinaryenStringEqGetLeft(expr)
    ccall((:BinaryenStringEqGetLeft, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

function BinaryenStringEqSetLeft(expr, leftExpr)
    ccall((:BinaryenStringEqSetLeft, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, leftExpr)
end

function BinaryenStringEqGetRight(expr)
    ccall((:BinaryenStringEqGetRight, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

function BinaryenStringEqSetRight(expr, rightExpr)
    ccall((:BinaryenStringEqSetRight, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, rightExpr)
end

"""
    BinaryenStringAsGetOp(expr)

StringAs
"""
function BinaryenStringAsGetOp(expr)
    ccall((:BinaryenStringAsGetOp, libbinaryen), BinaryenOp, (BinaryenExpressionRef,), expr)
end

function BinaryenStringAsSetOp(expr, op)
    ccall((:BinaryenStringAsSetOp, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenOp), expr, op)
end

function BinaryenStringAsGetRef(expr)
    ccall((:BinaryenStringAsGetRef, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

function BinaryenStringAsSetRef(expr, refExpr)
    ccall((:BinaryenStringAsSetRef, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, refExpr)
end

"""
    BinaryenStringWTF8AdvanceGetRef(expr)

StringWTF8Advance
"""
function BinaryenStringWTF8AdvanceGetRef(expr)
    ccall((:BinaryenStringWTF8AdvanceGetRef, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

function BinaryenStringWTF8AdvanceSetRef(expr, refExpr)
    ccall((:BinaryenStringWTF8AdvanceSetRef, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, refExpr)
end

function BinaryenStringWTF8AdvanceGetPos(expr)
    ccall((:BinaryenStringWTF8AdvanceGetPos, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

function BinaryenStringWTF8AdvanceSetPos(expr, posExpr)
    ccall((:BinaryenStringWTF8AdvanceSetPos, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, posExpr)
end

function BinaryenStringWTF8AdvanceGetBytes(expr)
    ccall((:BinaryenStringWTF8AdvanceGetBytes, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

function BinaryenStringWTF8AdvanceSetBytes(expr, bytesExpr)
    ccall((:BinaryenStringWTF8AdvanceSetBytes, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, bytesExpr)
end

"""
    BinaryenStringWTF16GetGetRef(expr)

StringWTF16Get
"""
function BinaryenStringWTF16GetGetRef(expr)
    ccall((:BinaryenStringWTF16GetGetRef, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

function BinaryenStringWTF16GetSetRef(expr, refExpr)
    ccall((:BinaryenStringWTF16GetSetRef, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, refExpr)
end

function BinaryenStringWTF16GetGetPos(expr)
    ccall((:BinaryenStringWTF16GetGetPos, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

function BinaryenStringWTF16GetSetPos(expr, posExpr)
    ccall((:BinaryenStringWTF16GetSetPos, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, posExpr)
end

"""
    BinaryenStringIterNextGetRef(expr)

StringIterNext
"""
function BinaryenStringIterNextGetRef(expr)
    ccall((:BinaryenStringIterNextGetRef, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

function BinaryenStringIterNextSetRef(expr, refExpr)
    ccall((:BinaryenStringIterNextSetRef, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, refExpr)
end

"""
    BinaryenStringIterMoveGetOp(expr)

StringIterMove
"""
function BinaryenStringIterMoveGetOp(expr)
    ccall((:BinaryenStringIterMoveGetOp, libbinaryen), BinaryenOp, (BinaryenExpressionRef,), expr)
end

function BinaryenStringIterMoveSetOp(expr, op)
    ccall((:BinaryenStringIterMoveSetOp, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenOp), expr, op)
end

function BinaryenStringIterMoveGetRef(expr)
    ccall((:BinaryenStringIterMoveGetRef, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

function BinaryenStringIterMoveSetRef(expr, refExpr)
    ccall((:BinaryenStringIterMoveSetRef, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, refExpr)
end

function BinaryenStringIterMoveGetNum(expr)
    ccall((:BinaryenStringIterMoveGetNum, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

function BinaryenStringIterMoveSetNum(expr, numExpr)
    ccall((:BinaryenStringIterMoveSetNum, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, numExpr)
end

"""
    BinaryenStringSliceWTFGetOp(expr)

StringSliceWTF
"""
function BinaryenStringSliceWTFGetOp(expr)
    ccall((:BinaryenStringSliceWTFGetOp, libbinaryen), BinaryenOp, (BinaryenExpressionRef,), expr)
end

function BinaryenStringSliceWTFSetOp(expr, op)
    ccall((:BinaryenStringSliceWTFSetOp, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenOp), expr, op)
end

function BinaryenStringSliceWTFGetRef(expr)
    ccall((:BinaryenStringSliceWTFGetRef, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

function BinaryenStringSliceWTFSetRef(expr, refExpr)
    ccall((:BinaryenStringSliceWTFSetRef, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, refExpr)
end

function BinaryenStringSliceWTFGetStart(expr)
    ccall((:BinaryenStringSliceWTFGetStart, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

function BinaryenStringSliceWTFSetStart(expr, startExpr)
    ccall((:BinaryenStringSliceWTFSetStart, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, startExpr)
end

function BinaryenStringSliceWTFGetEnd(expr)
    ccall((:BinaryenStringSliceWTFGetEnd, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

function BinaryenStringSliceWTFSetEnd(expr, endExpr)
    ccall((:BinaryenStringSliceWTFSetEnd, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, endExpr)
end

"""
    BinaryenStringSliceIterGetRef(expr)

StringSliceIter
"""
function BinaryenStringSliceIterGetRef(expr)
    ccall((:BinaryenStringSliceIterGetRef, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

function BinaryenStringSliceIterSetRef(expr, refExpr)
    ccall((:BinaryenStringSliceIterSetRef, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, refExpr)
end

function BinaryenStringSliceIterGetNum(expr)
    ccall((:BinaryenStringSliceIterGetNum, libbinaryen), BinaryenExpressionRef, (BinaryenExpressionRef,), expr)
end

function BinaryenStringSliceIterSetNum(expr, numExpr)
    ccall((:BinaryenStringSliceIterSetNum, libbinaryen), Cvoid, (BinaryenExpressionRef, BinaryenExpressionRef), expr, numExpr)
end

mutable struct BinaryenFunction end

const BinaryenFunctionRef = Ptr{BinaryenFunction}

"""
    BinaryenAddFunction(_module, name, params, results, varTypes, numVarTypes, body)

Adds a function to the module. This is thread-safe.
@varTypes: the types of variables. In WebAssembly, vars share
           an index space with params. In other words, params come from
           the function type, and vars are provided in this call, and
           together they are all the locals. The order is first params
           and then vars, so if you have one param it will be at index
           0 (and written \$0), and if you also have 2 vars they will be
at indexes 1 and 2, etc., that is, they share an index space.
"""
function BinaryenAddFunction(_module, name, params, results, varTypes, numVarTypes, body)
    ccall((:BinaryenAddFunction, libbinaryen), BinaryenFunctionRef, (BinaryenModuleRef, Ptr{Cchar}, BinaryenType, BinaryenType, Ptr{BinaryenType}, BinaryenIndex, BinaryenExpressionRef), _module, name, params, results, varTypes, numVarTypes, body)
end

"""
    BinaryenGetFunction(_module, name)

Gets a function reference by name. Returns NULL if the function does not
exist.
"""
function BinaryenGetFunction(_module, name)
    ccall((:BinaryenGetFunction, libbinaryen), BinaryenFunctionRef, (BinaryenModuleRef, Ptr{Cchar}), _module, name)
end

"""
    BinaryenRemoveFunction(_module, name)

Removes a function by name.
"""
function BinaryenRemoveFunction(_module, name)
    ccall((:BinaryenRemoveFunction, libbinaryen), Cvoid, (BinaryenModuleRef, Ptr{Cchar}), _module, name)
end

"""
    BinaryenGetNumFunctions(_module)

Gets the number of functions in the module.
"""
function BinaryenGetNumFunctions(_module)
    ccall((:BinaryenGetNumFunctions, libbinaryen), BinaryenIndex, (BinaryenModuleRef,), _module)
end

"""
    BinaryenGetFunctionByIndex(_module, index)

Gets the function at the specified index.
"""
function BinaryenGetFunctionByIndex(_module, index)
    ccall((:BinaryenGetFunctionByIndex, libbinaryen), BinaryenFunctionRef, (BinaryenModuleRef, BinaryenIndex), _module, index)
end

"""
    BinaryenAddFunctionImport(_module, internalName, externalModuleName, externalBaseName, params, results)

These either create a new entity (function/table/memory/etc.) and
mark it as an import, or, if an entity already exists with internalName then
the existing entity is turned into an import.
"""
function BinaryenAddFunctionImport(_module, internalName, externalModuleName, externalBaseName, params, results)
    ccall((:BinaryenAddFunctionImport, libbinaryen), Cvoid, (BinaryenModuleRef, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, BinaryenType, BinaryenType), _module, internalName, externalModuleName, externalBaseName, params, results)
end

function BinaryenAddTableImport(_module, internalName, externalModuleName, externalBaseName)
    ccall((:BinaryenAddTableImport, libbinaryen), Cvoid, (BinaryenModuleRef, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}), _module, internalName, externalModuleName, externalBaseName)
end

function BinaryenAddMemoryImport(_module, internalName, externalModuleName, externalBaseName, shared)
    ccall((:BinaryenAddMemoryImport, libbinaryen), Cvoid, (BinaryenModuleRef, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, UInt8), _module, internalName, externalModuleName, externalBaseName, shared)
end

function BinaryenAddGlobalImport(_module, internalName, externalModuleName, externalBaseName, globalType, mutable_)
    ccall((:BinaryenAddGlobalImport, libbinaryen), Cvoid, (BinaryenModuleRef, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, BinaryenType, Bool), _module, internalName, externalModuleName, externalBaseName, globalType, mutable_)
end

function BinaryenAddTagImport(_module, internalName, externalModuleName, externalBaseName, params, results)
    ccall((:BinaryenAddTagImport, libbinaryen), Cvoid, (BinaryenModuleRef, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, BinaryenType, BinaryenType), _module, internalName, externalModuleName, externalBaseName, params, results)
end

mutable struct BinaryenMemory end

const BinaryenMemoryRef = Ptr{BinaryenMemory}

mutable struct BinaryenExport end

const BinaryenExportRef = Ptr{BinaryenExport}

function BinaryenAddExport(_module, internalName, externalName)
    ccall((:BinaryenAddExport, libbinaryen), BinaryenExportRef, (BinaryenModuleRef, Ptr{Cchar}, Ptr{Cchar}), _module, internalName, externalName)
end

"""
    BinaryenAddFunctionExport(_module, internalName, externalName)

Adds a function export to the module.
"""
function BinaryenAddFunctionExport(_module, internalName, externalName)
    ccall((:BinaryenAddFunctionExport, libbinaryen), BinaryenExportRef, (BinaryenModuleRef, Ptr{Cchar}, Ptr{Cchar}), _module, internalName, externalName)
end

"""
    BinaryenAddTableExport(_module, internalName, externalName)

Adds a table export to the module.
"""
function BinaryenAddTableExport(_module, internalName, externalName)
    ccall((:BinaryenAddTableExport, libbinaryen), BinaryenExportRef, (BinaryenModuleRef, Ptr{Cchar}, Ptr{Cchar}), _module, internalName, externalName)
end

"""
    BinaryenAddMemoryExport(_module, internalName, externalName)

Adds a memory export to the module.
"""
function BinaryenAddMemoryExport(_module, internalName, externalName)
    ccall((:BinaryenAddMemoryExport, libbinaryen), BinaryenExportRef, (BinaryenModuleRef, Ptr{Cchar}, Ptr{Cchar}), _module, internalName, externalName)
end

"""
    BinaryenAddGlobalExport(_module, internalName, externalName)

Adds a global export to the module.
"""
function BinaryenAddGlobalExport(_module, internalName, externalName)
    ccall((:BinaryenAddGlobalExport, libbinaryen), BinaryenExportRef, (BinaryenModuleRef, Ptr{Cchar}, Ptr{Cchar}), _module, internalName, externalName)
end

"""
    BinaryenAddTagExport(_module, internalName, externalName)

Adds a tag export to the module.
"""
function BinaryenAddTagExport(_module, internalName, externalName)
    ccall((:BinaryenAddTagExport, libbinaryen), BinaryenExportRef, (BinaryenModuleRef, Ptr{Cchar}, Ptr{Cchar}), _module, internalName, externalName)
end

"""
    BinaryenGetExport(_module, externalName)

Gets an export reference by external name. Returns NULL if the export does
not exist.
"""
function BinaryenGetExport(_module, externalName)
    ccall((:BinaryenGetExport, libbinaryen), BinaryenExportRef, (BinaryenModuleRef, Ptr{Cchar}), _module, externalName)
end

"""
    BinaryenRemoveExport(_module, externalName)

Removes an export by external name.
"""
function BinaryenRemoveExport(_module, externalName)
    ccall((:BinaryenRemoveExport, libbinaryen), Cvoid, (BinaryenModuleRef, Ptr{Cchar}), _module, externalName)
end

"""
    BinaryenGetNumExports(_module)

Gets the number of exports in the module.
"""
function BinaryenGetNumExports(_module)
    ccall((:BinaryenGetNumExports, libbinaryen), BinaryenIndex, (BinaryenModuleRef,), _module)
end

"""
    BinaryenGetExportByIndex(_module, index)

Gets the export at the specified index.
"""
function BinaryenGetExportByIndex(_module, index)
    ccall((:BinaryenGetExportByIndex, libbinaryen), BinaryenExportRef, (BinaryenModuleRef, BinaryenIndex), _module, index)
end

mutable struct BinaryenGlobal end

const BinaryenGlobalRef = Ptr{BinaryenGlobal}

"""
    BinaryenAddGlobal(_module, name, type, mutable_, init)

Adds a global to the module.
"""
function BinaryenAddGlobal(_module, name, type, mutable_, init)
    ccall((:BinaryenAddGlobal, libbinaryen), BinaryenGlobalRef, (BinaryenModuleRef, Ptr{Cchar}, BinaryenType, Bool, BinaryenExpressionRef), _module, name, type, mutable_, init)
end

"""
    BinaryenGetGlobal(_module, name)

Gets a global reference by name. Returns NULL if the global does not exist.
"""
function BinaryenGetGlobal(_module, name)
    ccall((:BinaryenGetGlobal, libbinaryen), BinaryenGlobalRef, (BinaryenModuleRef, Ptr{Cchar}), _module, name)
end

"""
    BinaryenRemoveGlobal(_module, name)

Removes a global by name.
"""
function BinaryenRemoveGlobal(_module, name)
    ccall((:BinaryenRemoveGlobal, libbinaryen), Cvoid, (BinaryenModuleRef, Ptr{Cchar}), _module, name)
end

"""
    BinaryenGetNumGlobals(_module)

Gets the number of globals in the module.
"""
function BinaryenGetNumGlobals(_module)
    ccall((:BinaryenGetNumGlobals, libbinaryen), BinaryenIndex, (BinaryenModuleRef,), _module)
end

"""
    BinaryenGetGlobalByIndex(_module, index)

Gets the global at the specified index.
"""
function BinaryenGetGlobalByIndex(_module, index)
    ccall((:BinaryenGetGlobalByIndex, libbinaryen), BinaryenGlobalRef, (BinaryenModuleRef, BinaryenIndex), _module, index)
end

mutable struct BinaryenTag end

const BinaryenTagRef = Ptr{BinaryenTag}

"""
    BinaryenAddTag(_module, name, params, results)

Adds a tag to the module.
"""
function BinaryenAddTag(_module, name, params, results)
    ccall((:BinaryenAddTag, libbinaryen), BinaryenTagRef, (BinaryenModuleRef, Ptr{Cchar}, BinaryenType, BinaryenType), _module, name, params, results)
end

"""
    BinaryenGetTag(_module, name)

Gets a tag reference by name. Returns NULL if the tag does not exist.
"""
function BinaryenGetTag(_module, name)
    ccall((:BinaryenGetTag, libbinaryen), BinaryenTagRef, (BinaryenModuleRef, Ptr{Cchar}), _module, name)
end

"""
    BinaryenRemoveTag(_module, name)

Removes a tag by name.
"""
function BinaryenRemoveTag(_module, name)
    ccall((:BinaryenRemoveTag, libbinaryen), Cvoid, (BinaryenModuleRef, Ptr{Cchar}), _module, name)
end

mutable struct BinaryenTable end

const BinaryenTableRef = Ptr{BinaryenTable}

function BinaryenAddTable(_module, table, initial, maximum, tableType)
    ccall((:BinaryenAddTable, libbinaryen), BinaryenTableRef, (BinaryenModuleRef, Ptr{Cchar}, BinaryenIndex, BinaryenIndex, BinaryenType), _module, table, initial, maximum, tableType)
end

function BinaryenRemoveTable(_module, table)
    ccall((:BinaryenRemoveTable, libbinaryen), Cvoid, (BinaryenModuleRef, Ptr{Cchar}), _module, table)
end

function BinaryenGetNumTables(_module)
    ccall((:BinaryenGetNumTables, libbinaryen), BinaryenIndex, (BinaryenModuleRef,), _module)
end

function BinaryenGetTable(_module, name)
    ccall((:BinaryenGetTable, libbinaryen), BinaryenTableRef, (BinaryenModuleRef, Ptr{Cchar}), _module, name)
end

function BinaryenGetTableByIndex(_module, index)
    ccall((:BinaryenGetTableByIndex, libbinaryen), BinaryenTableRef, (BinaryenModuleRef, BinaryenIndex), _module, index)
end

mutable struct BinaryenElementSegment end

const BinaryenElementSegmentRef = Ptr{BinaryenElementSegment}

function BinaryenAddActiveElementSegment(_module, table, name, funcNames, numFuncNames, offset)
    ccall((:BinaryenAddActiveElementSegment, libbinaryen), BinaryenElementSegmentRef, (BinaryenModuleRef, Ptr{Cchar}, Ptr{Cchar}, Ptr{Ptr{Cchar}}, BinaryenIndex, BinaryenExpressionRef), _module, table, name, funcNames, numFuncNames, offset)
end

function BinaryenAddPassiveElementSegment(_module, name, funcNames, numFuncNames)
    ccall((:BinaryenAddPassiveElementSegment, libbinaryen), BinaryenElementSegmentRef, (BinaryenModuleRef, Ptr{Cchar}, Ptr{Ptr{Cchar}}, BinaryenIndex), _module, name, funcNames, numFuncNames)
end

function BinaryenRemoveElementSegment(_module, name)
    ccall((:BinaryenRemoveElementSegment, libbinaryen), Cvoid, (BinaryenModuleRef, Ptr{Cchar}), _module, name)
end

function BinaryenGetNumElementSegments(_module)
    ccall((:BinaryenGetNumElementSegments, libbinaryen), BinaryenIndex, (BinaryenModuleRef,), _module)
end

function BinaryenGetElementSegment(_module, name)
    ccall((:BinaryenGetElementSegment, libbinaryen), BinaryenElementSegmentRef, (BinaryenModuleRef, Ptr{Cchar}), _module, name)
end

function BinaryenGetElementSegmentByIndex(_module, index)
    ccall((:BinaryenGetElementSegmentByIndex, libbinaryen), BinaryenElementSegmentRef, (BinaryenModuleRef, BinaryenIndex), _module, index)
end

"""
    BinaryenSetMemory(_module, initial, maximum, exportName, segments, segmentPassive, segmentOffsets, segmentSizes, numSegments, shared, memory64, name)

This will create a memory, overwriting any existing memory
Each memory has data in segments, a start offset in segmentOffsets, and a
size in segmentSizes. exportName can be NULL
"""
function BinaryenSetMemory(_module, initial, maximum, exportName, segments, segmentPassive, segmentOffsets, segmentSizes, numSegments, shared, memory64, name)
    ccall((:BinaryenSetMemory, libbinaryen), Cvoid, (BinaryenModuleRef, BinaryenIndex, BinaryenIndex, Ptr{Cchar}, Ptr{Ptr{Cchar}}, Ptr{Bool}, Ptr{BinaryenExpressionRef}, Ptr{BinaryenIndex}, BinaryenIndex, Bool, Bool, Ptr{Cchar}), _module, initial, maximum, exportName, segments, segmentPassive, segmentOffsets, segmentSizes, numSegments, shared, memory64, name)
end

function BinaryenHasMemory(_module)
    ccall((:BinaryenHasMemory, libbinaryen), Bool, (BinaryenModuleRef,), _module)
end

function BinaryenMemoryGetInitial(_module, name)
    ccall((:BinaryenMemoryGetInitial, libbinaryen), BinaryenIndex, (BinaryenModuleRef, Ptr{Cchar}), _module, name)
end

function BinaryenMemoryHasMax(_module, name)
    ccall((:BinaryenMemoryHasMax, libbinaryen), Bool, (BinaryenModuleRef, Ptr{Cchar}), _module, name)
end

function BinaryenMemoryGetMax(_module, name)
    ccall((:BinaryenMemoryGetMax, libbinaryen), BinaryenIndex, (BinaryenModuleRef, Ptr{Cchar}), _module, name)
end

function BinaryenMemoryImportGetModule(_module, name)
    ccall((:BinaryenMemoryImportGetModule, libbinaryen), Ptr{Cchar}, (BinaryenModuleRef, Ptr{Cchar}), _module, name)
end

function BinaryenMemoryImportGetBase(_module, name)
    ccall((:BinaryenMemoryImportGetBase, libbinaryen), Ptr{Cchar}, (BinaryenModuleRef, Ptr{Cchar}), _module, name)
end

function BinaryenMemoryIsShared(_module, name)
    ccall((:BinaryenMemoryIsShared, libbinaryen), Bool, (BinaryenModuleRef, Ptr{Cchar}), _module, name)
end

function BinaryenMemoryIs64(_module, name)
    ccall((:BinaryenMemoryIs64, libbinaryen), Bool, (BinaryenModuleRef, Ptr{Cchar}), _module, name)
end

"""
    BinaryenGetNumMemorySegments(_module)

Memory segments. Query utilities.
"""
function BinaryenGetNumMemorySegments(_module)
    ccall((:BinaryenGetNumMemorySegments, libbinaryen), UInt32, (BinaryenModuleRef,), _module)
end

function BinaryenGetMemorySegmentByteOffset(_module, id)
    ccall((:BinaryenGetMemorySegmentByteOffset, libbinaryen), UInt32, (BinaryenModuleRef, BinaryenIndex), _module, id)
end

function BinaryenGetMemorySegmentByteLength(_module, id)
    ccall((:BinaryenGetMemorySegmentByteLength, libbinaryen), Csize_t, (BinaryenModuleRef, BinaryenIndex), _module, id)
end

function BinaryenGetMemorySegmentPassive(_module, id)
    ccall((:BinaryenGetMemorySegmentPassive, libbinaryen), Bool, (BinaryenModuleRef, BinaryenIndex), _module, id)
end

function BinaryenCopyMemorySegmentData(_module, id, buffer)
    ccall((:BinaryenCopyMemorySegmentData, libbinaryen), Cvoid, (BinaryenModuleRef, BinaryenIndex, Ptr{Cchar}), _module, id, buffer)
end

"""
    BinaryenSetStart(_module, start)

Start function. One per module
"""
function BinaryenSetStart(_module, start)
    ccall((:BinaryenSetStart, libbinaryen), Cvoid, (BinaryenModuleRef, BinaryenFunctionRef), _module, start)
end

"""
    BinaryenModuleGetFeatures(_module)

These control what features are allowed when validation and in passes.
"""
function BinaryenModuleGetFeatures(_module)
    ccall((:BinaryenModuleGetFeatures, libbinaryen), BinaryenFeatures, (BinaryenModuleRef,), _module)
end

function BinaryenModuleSetFeatures(_module, features)
    ccall((:BinaryenModuleSetFeatures, libbinaryen), Cvoid, (BinaryenModuleRef, BinaryenFeatures), _module, features)
end

"""
    BinaryenModuleParse(text)

Parse a module in s-expression text format
"""
function BinaryenModuleParse(text)
    ccall((:BinaryenModuleParse, libbinaryen), BinaryenModuleRef, (Ptr{Cchar},), text)
end

"""
    BinaryenModulePrint(_module)

Print a module to stdout in s-expression text format. Useful for debugging.
"""
function BinaryenModulePrint(_module)
    ccall((:BinaryenModulePrint, libbinaryen), Cvoid, (BinaryenModuleRef,), _module)
end

"""
    BinaryenModulePrintStackIR(_module, optimize)

Print a module to stdout in stack IR text format. Useful for debugging.
"""
function BinaryenModulePrintStackIR(_module, optimize)
    ccall((:BinaryenModulePrintStackIR, libbinaryen), Cvoid, (BinaryenModuleRef, Bool), _module, optimize)
end

"""
    BinaryenModulePrintAsmjs(_module)

Print a module to stdout in asm.js syntax.
"""
function BinaryenModulePrintAsmjs(_module)
    ccall((:BinaryenModulePrintAsmjs, libbinaryen), Cvoid, (BinaryenModuleRef,), _module)
end

"""
    BinaryenModuleValidate(_module)

Validate a module, showing errors on problems.
@return 0 if an error occurred, 1 if validated succesfully
"""
function BinaryenModuleValidate(_module)
    ccall((:BinaryenModuleValidate, libbinaryen), Bool, (BinaryenModuleRef,), _module)
end

"""
    BinaryenModuleOptimize(_module)

Runs the standard optimization passes on the module. Uses the currently set
global optimize and shrink level.
"""
function BinaryenModuleOptimize(_module)
    ccall((:BinaryenModuleOptimize, libbinaryen), Cvoid, (BinaryenModuleRef,), _module)
end

"""
    BinaryenModuleUpdateMaps(_module)

Updates the internal name mapping logic in a module. This must be called
after renaming module elements.
"""
function BinaryenModuleUpdateMaps(_module)
    ccall((:BinaryenModuleUpdateMaps, libbinaryen), Cvoid, (BinaryenModuleRef,), _module)
end

"""
    BinaryenGetOptimizeLevel()

Gets the currently set optimize level. Applies to all modules, globally.
0, 1, 2 correspond to -O0, -O1, -O2 (default), etc.
"""
function BinaryenGetOptimizeLevel()
    ccall((:BinaryenGetOptimizeLevel, libbinaryen), Cint, ())
end

"""
    BinaryenSetOptimizeLevel(level)

Sets the optimization level to use. Applies to all modules, globally.
0, 1, 2 correspond to -O0, -O1, -O2 (default), etc.
"""
function BinaryenSetOptimizeLevel(level)
    ccall((:BinaryenSetOptimizeLevel, libbinaryen), Cvoid, (Cint,), level)
end

"""
    BinaryenGetShrinkLevel()

Gets the currently set shrink level. Applies to all modules, globally.
0, 1, 2 correspond to -O0, -Os (default), -Oz.
"""
function BinaryenGetShrinkLevel()
    ccall((:BinaryenGetShrinkLevel, libbinaryen), Cint, ())
end

"""
    BinaryenSetShrinkLevel(level)

Sets the shrink level to use. Applies to all modules, globally.
0, 1, 2 correspond to -O0, -Os (default), -Oz.
"""
function BinaryenSetShrinkLevel(level)
    ccall((:BinaryenSetShrinkLevel, libbinaryen), Cvoid, (Cint,), level)
end

"""
    BinaryenGetDebugInfo()

Gets whether generating debug information is currently enabled or not.
Applies to all modules, globally.
"""
function BinaryenGetDebugInfo()
    ccall((:BinaryenGetDebugInfo, libbinaryen), Bool, ())
end

"""
    BinaryenSetDebugInfo(on)

Enables or disables debug information in emitted binaries.
Applies to all modules, globally.
"""
function BinaryenSetDebugInfo(on)
    ccall((:BinaryenSetDebugInfo, libbinaryen), Cvoid, (Bool,), on)
end

"""
    BinaryenGetLowMemoryUnused()

Gets whether the low 1K of memory can be considered unused when optimizing.
Applies to all modules, globally.
"""
function BinaryenGetLowMemoryUnused()
    ccall((:BinaryenGetLowMemoryUnused, libbinaryen), Bool, ())
end

"""
    BinaryenSetLowMemoryUnused(on)

Enables or disables whether the low 1K of memory can be considered unused
when optimizing. Applies to all modules, globally.
"""
function BinaryenSetLowMemoryUnused(on)
    ccall((:BinaryenSetLowMemoryUnused, libbinaryen), Cvoid, (Bool,), on)
end

"""
    BinaryenGetZeroFilledMemory()

Gets whether to assume that an imported memory is zero-initialized.
"""
function BinaryenGetZeroFilledMemory()
    ccall((:BinaryenGetZeroFilledMemory, libbinaryen), Bool, ())
end

"""
    BinaryenSetZeroFilledMemory(on)

Enables or disables whether to assume that an imported memory is
zero-initialized.
"""
function BinaryenSetZeroFilledMemory(on)
    ccall((:BinaryenSetZeroFilledMemory, libbinaryen), Cvoid, (Bool,), on)
end

"""
    BinaryenGetFastMath()

Gets whether fast math optimizations are enabled, ignoring for example
corner cases of floating-point math like NaN changes.
Applies to all modules, globally.
"""
function BinaryenGetFastMath()
    ccall((:BinaryenGetFastMath, libbinaryen), Bool, ())
end

"""
    BinaryenSetFastMath(value)

Enables or disables fast math optimizations, ignoring for example
corner cases of floating-point math like NaN changes.
Applies to all modules, globally.
"""
function BinaryenSetFastMath(value)
    ccall((:BinaryenSetFastMath, libbinaryen), Cvoid, (Bool,), value)
end

"""
    BinaryenGetPassArgument(name)

Gets the value of the specified arbitrary pass argument.
Applies to all modules, globally.
"""
function BinaryenGetPassArgument(name)
    ccall((:BinaryenGetPassArgument, libbinaryen), Ptr{Cchar}, (Ptr{Cchar},), name)
end

"""
    BinaryenSetPassArgument(name, value)

Sets the value of the specified arbitrary pass argument. Removes the
respective argument if `value` is NULL. Applies to all modules, globally.
"""
function BinaryenSetPassArgument(name, value)
    ccall((:BinaryenSetPassArgument, libbinaryen), Cvoid, (Ptr{Cchar}, Ptr{Cchar}), name, value)
end

# no prototype is found for this function at binaryen-c.h:3039:19, please use with caution
"""
    BinaryenClearPassArguments()

Clears all arbitrary pass arguments.
Applies to all modules, globally.
"""
function BinaryenClearPassArguments()
    ccall((:BinaryenClearPassArguments, libbinaryen), Cvoid, ())
end

"""
    BinaryenGetAlwaysInlineMaxSize()

Gets the function size at which we always inline.
Applies to all modules, globally.
"""
function BinaryenGetAlwaysInlineMaxSize()
    ccall((:BinaryenGetAlwaysInlineMaxSize, libbinaryen), BinaryenIndex, ())
end

"""
    BinaryenSetAlwaysInlineMaxSize(size)

Sets the function size at which we always inline.
Applies to all modules, globally.
"""
function BinaryenSetAlwaysInlineMaxSize(size)
    ccall((:BinaryenSetAlwaysInlineMaxSize, libbinaryen), Cvoid, (BinaryenIndex,), size)
end

"""
    BinaryenGetFlexibleInlineMaxSize()

Gets the function size which we inline when functions are lightweight.
Applies to all modules, globally.
"""
function BinaryenGetFlexibleInlineMaxSize()
    ccall((:BinaryenGetFlexibleInlineMaxSize, libbinaryen), BinaryenIndex, ())
end

"""
    BinaryenSetFlexibleInlineMaxSize(size)

Sets the function size which we inline when functions are lightweight.
Applies to all modules, globally.
"""
function BinaryenSetFlexibleInlineMaxSize(size)
    ccall((:BinaryenSetFlexibleInlineMaxSize, libbinaryen), Cvoid, (BinaryenIndex,), size)
end

"""
    BinaryenGetOneCallerInlineMaxSize()

Gets the function size which we inline when there is only one caller.
Applies to all modules, globally.
"""
function BinaryenGetOneCallerInlineMaxSize()
    ccall((:BinaryenGetOneCallerInlineMaxSize, libbinaryen), BinaryenIndex, ())
end

"""
    BinaryenSetOneCallerInlineMaxSize(size)

Sets the function size which we inline when there is only one caller.
Applies to all modules, globally.
"""
function BinaryenSetOneCallerInlineMaxSize(size)
    ccall((:BinaryenSetOneCallerInlineMaxSize, libbinaryen), Cvoid, (BinaryenIndex,), size)
end

"""
    BinaryenGetAllowInliningFunctionsWithLoops()

Gets whether functions with loops are allowed to be inlined.
Applies to all modules, globally.
"""
function BinaryenGetAllowInliningFunctionsWithLoops()
    ccall((:BinaryenGetAllowInliningFunctionsWithLoops, libbinaryen), Bool, ())
end

"""
    BinaryenSetAllowInliningFunctionsWithLoops(enabled)

Sets whether functions with loops are allowed to be inlined.
Applies to all modules, globally.
"""
function BinaryenSetAllowInliningFunctionsWithLoops(enabled)
    ccall((:BinaryenSetAllowInliningFunctionsWithLoops, libbinaryen), Cvoid, (Bool,), enabled)
end

"""
    BinaryenModuleRunPasses(_module, passes, numPasses)

Runs the specified passes on the module. Uses the currently set global
optimize and shrink level.
"""
function BinaryenModuleRunPasses(_module, passes, numPasses)
    ccall((:BinaryenModuleRunPasses, libbinaryen), Cvoid, (BinaryenModuleRef, Ptr{Ptr{Cchar}}, BinaryenIndex), _module, passes, numPasses)
end

"""
    BinaryenModuleAutoDrop(_module)

Auto-generate drop() operations where needed. This lets you generate code
without worrying about where they are needed. (It is more efficient to do it
yourself, but simpler to use autodrop).
"""
function BinaryenModuleAutoDrop(_module)
    ccall((:BinaryenModuleAutoDrop, libbinaryen), Cvoid, (BinaryenModuleRef,), _module)
end

"""
    BinaryenModuleWrite(_module, output, outputSize)

Serialize a module into binary form. Uses the currently set global debugInfo
option.
@return how many bytes were written. This will be less than or equal to
outputSize
"""
function BinaryenModuleWrite(_module, output, outputSize)
    ccall((:BinaryenModuleWrite, libbinaryen), Csize_t, (BinaryenModuleRef, Ptr{Cchar}, Csize_t), _module, output, outputSize)
end

"""
    BinaryenModuleWriteText(_module, output, outputSize)

Serialize a module in s-expression text format.
@return how many bytes were written. This will be less than or equal to
outputSize
"""
function BinaryenModuleWriteText(_module, output, outputSize)
    ccall((:BinaryenModuleWriteText, libbinaryen), Csize_t, (BinaryenModuleRef, Ptr{Cchar}, Csize_t), _module, output, outputSize)
end

"""
    BinaryenModuleWriteStackIR(_module, output, outputSize, optimize)

Serialize a module in stack IR text format.
@return how many bytes were written. This will be less than or equal to
outputSize
"""
function BinaryenModuleWriteStackIR(_module, output, outputSize, optimize)
    ccall((:BinaryenModuleWriteStackIR, libbinaryen), Csize_t, (BinaryenModuleRef, Ptr{Cchar}, Csize_t, Bool), _module, output, outputSize, optimize)
end

struct BinaryenBufferSizes
    outputBytes::Csize_t
    sourceMapBytes::Csize_t
end

"""
    BinaryenModuleWriteWithSourceMap(_module, url, output, outputSize, sourceMap, sourceMapSize)

Serialize a module into binary form including its source map. Uses the
currently set global debugInfo option.
@returns how many bytes were written. This will be less than or equal to
outputSize
"""
function BinaryenModuleWriteWithSourceMap(_module, url, output, outputSize, sourceMap, sourceMapSize)
    ccall((:BinaryenModuleWriteWithSourceMap, libbinaryen), BinaryenBufferSizes, (BinaryenModuleRef, Ptr{Cchar}, Ptr{Cchar}, Csize_t, Ptr{Cchar}, Csize_t), _module, url, output, outputSize, sourceMap, sourceMapSize)
end

"""
    BinaryenModuleAllocateAndWriteResult

Result structure of BinaryenModuleAllocateAndWrite. Contained buffers have
been allocated using malloc() and the user is expected to free() them
manually once not needed anymore.
"""
struct BinaryenModuleAllocateAndWriteResult
    binary::Ptr{Cvoid}
    binaryBytes::Csize_t
    sourceMap::Ptr{Cchar}
end

"""
    BinaryenModuleAllocateAndWrite(_module, sourceMapUrl)

Serializes a module into binary form, optionally including its source map if
sourceMapUrl has been specified. Uses the currently set global debugInfo
option. Differs from BinaryenModuleWrite in that it implicitly allocates
appropriate buffers using malloc(), and expects the user to free() them
manually once not needed anymore.
"""
function BinaryenModuleAllocateAndWrite(_module, sourceMapUrl)
    ccall((:BinaryenModuleAllocateAndWrite, libbinaryen), BinaryenModuleAllocateAndWriteResult, (BinaryenModuleRef, Ptr{Cchar}), _module, sourceMapUrl)
end

"""
    BinaryenModuleAllocateAndWriteText(_module)

Serialize a module in s-expression form. Implicity allocates the returned
char* with malloc(), and expects the user to free() them manually
once not needed anymore.
"""
function BinaryenModuleAllocateAndWriteText(_module)
    ccall((:BinaryenModuleAllocateAndWriteText, libbinaryen), Ptr{Cchar}, (BinaryenModuleRef,), _module)
end

"""
    BinaryenModuleAllocateAndWriteStackIR(_module, optimize)

Serialize a module in stack IR form. Implicitly allocates the returned
char* with malloc(), and expects the user to free() them manually
once not needed anymore.
"""
function BinaryenModuleAllocateAndWriteStackIR(_module, optimize)
    ccall((:BinaryenModuleAllocateAndWriteStackIR, libbinaryen), Ptr{Cchar}, (BinaryenModuleRef, Bool), _module, optimize)
end

"""
    BinaryenModuleRead(input, inputSize)

Deserialize a module from binary form.
"""
function BinaryenModuleRead(input, inputSize)
    ccall((:BinaryenModuleRead, libbinaryen), BinaryenModuleRef, (Ptr{Cchar}, Csize_t), input, inputSize)
end

"""
    BinaryenModuleInterpret(_module)

Execute a module in the Binaryen interpreter. This will create an instance of
the module, run it in the interpreter - which means running the start method
- and then destroying the instance.
"""
function BinaryenModuleInterpret(_module)
    ccall((:BinaryenModuleInterpret, libbinaryen), Cvoid, (BinaryenModuleRef,), _module)
end

"""
    BinaryenModuleAddDebugInfoFileName(_module, filename)

Adds a debug info file name to the module and returns its index.
"""
function BinaryenModuleAddDebugInfoFileName(_module, filename)
    ccall((:BinaryenModuleAddDebugInfoFileName, libbinaryen), BinaryenIndex, (BinaryenModuleRef, Ptr{Cchar}), _module, filename)
end

"""
    BinaryenModuleGetDebugInfoFileName(_module, index)

Gets the name of the debug info file at the specified index. Returns `NULL`
if it does not exist.
"""
function BinaryenModuleGetDebugInfoFileName(_module, index)
    ccall((:BinaryenModuleGetDebugInfoFileName, libbinaryen), Ptr{Cchar}, (BinaryenModuleRef, BinaryenIndex), _module, index)
end

"""
    BinaryenFunctionGetName(func)

Gets the name of the specified `Function`.
"""
function BinaryenFunctionGetName(func)
    ccall((:BinaryenFunctionGetName, libbinaryen), Ptr{Cchar}, (BinaryenFunctionRef,), func)
end

"""
    BinaryenFunctionGetParams(func)

Gets the type of the parameter at the specified index of the specified
`Function`.
"""
function BinaryenFunctionGetParams(func)
    ccall((:BinaryenFunctionGetParams, libbinaryen), BinaryenType, (BinaryenFunctionRef,), func)
end

"""
    BinaryenFunctionGetResults(func)

Gets the result type of the specified `Function`.
"""
function BinaryenFunctionGetResults(func)
    ccall((:BinaryenFunctionGetResults, libbinaryen), BinaryenType, (BinaryenFunctionRef,), func)
end

"""
    BinaryenFunctionGetNumVars(func)

Gets the number of additional locals within the specified `Function`.
"""
function BinaryenFunctionGetNumVars(func)
    ccall((:BinaryenFunctionGetNumVars, libbinaryen), BinaryenIndex, (BinaryenFunctionRef,), func)
end

"""
    BinaryenFunctionGetVar(func, index)

Gets the type of the additional local at the specified index within the
specified `Function`.
"""
function BinaryenFunctionGetVar(func, index)
    ccall((:BinaryenFunctionGetVar, libbinaryen), BinaryenType, (BinaryenFunctionRef, BinaryenIndex), func, index)
end

"""
    BinaryenFunctionGetNumLocals(func)

Gets the number of locals within the specified function. Includes parameters.
"""
function BinaryenFunctionGetNumLocals(func)
    ccall((:BinaryenFunctionGetNumLocals, libbinaryen), BinaryenIndex, (BinaryenFunctionRef,), func)
end

"""
    BinaryenFunctionHasLocalName(func, index)

Tests if the local at the specified index has a name.
"""
function BinaryenFunctionHasLocalName(func, index)
    ccall((:BinaryenFunctionHasLocalName, libbinaryen), Bool, (BinaryenFunctionRef, BinaryenIndex), func, index)
end

"""
    BinaryenFunctionGetLocalName(func, index)

Gets the name of the local at the specified index.
"""
function BinaryenFunctionGetLocalName(func, index)
    ccall((:BinaryenFunctionGetLocalName, libbinaryen), Ptr{Cchar}, (BinaryenFunctionRef, BinaryenIndex), func, index)
end

"""
    BinaryenFunctionSetLocalName(func, index, name)

Sets the name of the local at the specified index.
"""
function BinaryenFunctionSetLocalName(func, index, name)
    ccall((:BinaryenFunctionSetLocalName, libbinaryen), Cvoid, (BinaryenFunctionRef, BinaryenIndex, Ptr{Cchar}), func, index, name)
end

"""
    BinaryenFunctionGetBody(func)

Gets the body of the specified `Function`.
"""
function BinaryenFunctionGetBody(func)
    ccall((:BinaryenFunctionGetBody, libbinaryen), BinaryenExpressionRef, (BinaryenFunctionRef,), func)
end

"""
    BinaryenFunctionSetBody(func, body)

Sets the body of the specified `Function`.
"""
function BinaryenFunctionSetBody(func, body)
    ccall((:BinaryenFunctionSetBody, libbinaryen), Cvoid, (BinaryenFunctionRef, BinaryenExpressionRef), func, body)
end

"""
    BinaryenFunctionOptimize(func, _module)

Runs the standard optimization passes on the function. Uses the currently set
global optimize and shrink level.
"""
function BinaryenFunctionOptimize(func, _module)
    ccall((:BinaryenFunctionOptimize, libbinaryen), Cvoid, (BinaryenFunctionRef, BinaryenModuleRef), func, _module)
end

"""
    BinaryenFunctionRunPasses(func, _module, passes, numPasses)

Runs the specified passes on the function. Uses the currently set global
optimize and shrink level.
"""
function BinaryenFunctionRunPasses(func, _module, passes, numPasses)
    ccall((:BinaryenFunctionRunPasses, libbinaryen), Cvoid, (BinaryenFunctionRef, BinaryenModuleRef, Ptr{Ptr{Cchar}}, BinaryenIndex), func, _module, passes, numPasses)
end

"""
    BinaryenFunctionSetDebugLocation(func, expr, fileIndex, lineNumber, columnNumber)

Sets the debug location of the specified `Expression` within the specified
`Function`.
"""
function BinaryenFunctionSetDebugLocation(func, expr, fileIndex, lineNumber, columnNumber)
    ccall((:BinaryenFunctionSetDebugLocation, libbinaryen), Cvoid, (BinaryenFunctionRef, BinaryenExpressionRef, BinaryenIndex, BinaryenIndex, BinaryenIndex), func, expr, fileIndex, lineNumber, columnNumber)
end

"""
    BinaryenTableGetName(table)

Gets the name of the specified `Table`.
"""
function BinaryenTableGetName(table)
    ccall((:BinaryenTableGetName, libbinaryen), Ptr{Cchar}, (BinaryenTableRef,), table)
end

"""
    BinaryenTableSetName(table, name)

Sets the name of the specified `Table`.
"""
function BinaryenTableSetName(table, name)
    ccall((:BinaryenTableSetName, libbinaryen), Cvoid, (BinaryenTableRef, Ptr{Cchar}), table, name)
end

"""
    BinaryenTableGetInitial(table)

Gets the initial number of pages of the specified `Table`.
"""
function BinaryenTableGetInitial(table)
    ccall((:BinaryenTableGetInitial, libbinaryen), BinaryenIndex, (BinaryenTableRef,), table)
end

"""
    BinaryenTableSetInitial(table, initial)

Sets the initial number of pages of the specified `Table`.
"""
function BinaryenTableSetInitial(table, initial)
    ccall((:BinaryenTableSetInitial, libbinaryen), Cvoid, (BinaryenTableRef, BinaryenIndex), table, initial)
end

"""
    BinaryenTableHasMax(table)

Tests whether the specified `Table` has a maximum number of pages.
"""
function BinaryenTableHasMax(table)
    ccall((:BinaryenTableHasMax, libbinaryen), Bool, (BinaryenTableRef,), table)
end

"""
    BinaryenTableGetMax(table)

Gets the maximum number of pages of the specified `Table`.
"""
function BinaryenTableGetMax(table)
    ccall((:BinaryenTableGetMax, libbinaryen), BinaryenIndex, (BinaryenTableRef,), table)
end

"""
    BinaryenTableSetMax(table, max)

Sets the maximum number of pages of the specified `Table`.
"""
function BinaryenTableSetMax(table, max)
    ccall((:BinaryenTableSetMax, libbinaryen), Cvoid, (BinaryenTableRef, BinaryenIndex), table, max)
end

"""
    BinaryenElementSegmentGetName(elem)

Gets the name of the specified `ElementSegment`.
"""
function BinaryenElementSegmentGetName(elem)
    ccall((:BinaryenElementSegmentGetName, libbinaryen), Ptr{Cchar}, (BinaryenElementSegmentRef,), elem)
end

"""
    BinaryenElementSegmentSetName(elem, name)

Sets the name of the specified `ElementSegment`.
"""
function BinaryenElementSegmentSetName(elem, name)
    ccall((:BinaryenElementSegmentSetName, libbinaryen), Cvoid, (BinaryenElementSegmentRef, Ptr{Cchar}), elem, name)
end

"""
    BinaryenElementSegmentGetTable(elem)

Gets the table name of the specified `ElementSegment`.
"""
function BinaryenElementSegmentGetTable(elem)
    ccall((:BinaryenElementSegmentGetTable, libbinaryen), Ptr{Cchar}, (BinaryenElementSegmentRef,), elem)
end

"""
    BinaryenElementSegmentSetTable(elem, table)

Sets the table name of the specified `ElementSegment`.
"""
function BinaryenElementSegmentSetTable(elem, table)
    ccall((:BinaryenElementSegmentSetTable, libbinaryen), Cvoid, (BinaryenElementSegmentRef, Ptr{Cchar}), elem, table)
end

"""
    BinaryenElementSegmentGetOffset(elem)

Gets the segment offset in case of active segments
"""
function BinaryenElementSegmentGetOffset(elem)
    ccall((:BinaryenElementSegmentGetOffset, libbinaryen), BinaryenExpressionRef, (BinaryenElementSegmentRef,), elem)
end

"""
    BinaryenElementSegmentGetLength(elem)

Gets the length of items in the segment
"""
function BinaryenElementSegmentGetLength(elem)
    ccall((:BinaryenElementSegmentGetLength, libbinaryen), BinaryenIndex, (BinaryenElementSegmentRef,), elem)
end

"""
    BinaryenElementSegmentGetData(elem, dataId)

Gets the item at the specified index
"""
function BinaryenElementSegmentGetData(elem, dataId)
    ccall((:BinaryenElementSegmentGetData, libbinaryen), Ptr{Cchar}, (BinaryenElementSegmentRef, BinaryenIndex), elem, dataId)
end

"""
    BinaryenElementSegmentIsPassive(elem)

Returns true if the specified elem segment is passive
"""
function BinaryenElementSegmentIsPassive(elem)
    ccall((:BinaryenElementSegmentIsPassive, libbinaryen), Bool, (BinaryenElementSegmentRef,), elem)
end

"""
    BinaryenGlobalGetName(_global)

Gets the name of the specified `Global`.
"""
function BinaryenGlobalGetName(_global)
    ccall((:BinaryenGlobalGetName, libbinaryen), Ptr{Cchar}, (BinaryenGlobalRef,), _global)
end

"""
    BinaryenGlobalGetType(_global)

Gets the name of the `GlobalType` associated with the specified `Global`. May
be `NULL` if the signature is implicit.
"""
function BinaryenGlobalGetType(_global)
    ccall((:BinaryenGlobalGetType, libbinaryen), BinaryenType, (BinaryenGlobalRef,), _global)
end

"""
    BinaryenGlobalIsMutable(_global)

Returns true if the specified `Global` is mutable.
"""
function BinaryenGlobalIsMutable(_global)
    ccall((:BinaryenGlobalIsMutable, libbinaryen), Bool, (BinaryenGlobalRef,), _global)
end

"""
    BinaryenGlobalGetInitExpr(_global)

Gets the initialization expression of the specified `Global`.
"""
function BinaryenGlobalGetInitExpr(_global)
    ccall((:BinaryenGlobalGetInitExpr, libbinaryen), BinaryenExpressionRef, (BinaryenGlobalRef,), _global)
end

"""
    BinaryenTagGetName(tag)

Gets the name of the specified `Tag`.
"""
function BinaryenTagGetName(tag)
    ccall((:BinaryenTagGetName, libbinaryen), Ptr{Cchar}, (BinaryenTagRef,), tag)
end

"""
    BinaryenTagGetParams(tag)

Gets the parameters type of the specified `Tag`.
"""
function BinaryenTagGetParams(tag)
    ccall((:BinaryenTagGetParams, libbinaryen), BinaryenType, (BinaryenTagRef,), tag)
end

"""
    BinaryenTagGetResults(tag)

Gets the results type of the specified `Tag`.
"""
function BinaryenTagGetResults(tag)
    ccall((:BinaryenTagGetResults, libbinaryen), BinaryenType, (BinaryenTagRef,), tag)
end

"""
    BinaryenFunctionImportGetModule(_import)

Gets the external module name of the specified import.
"""
function BinaryenFunctionImportGetModule(_import)
    ccall((:BinaryenFunctionImportGetModule, libbinaryen), Ptr{Cchar}, (BinaryenFunctionRef,), _import)
end

function BinaryenTableImportGetModule(_import)
    ccall((:BinaryenTableImportGetModule, libbinaryen), Ptr{Cchar}, (BinaryenTableRef,), _import)
end

function BinaryenGlobalImportGetModule(_import)
    ccall((:BinaryenGlobalImportGetModule, libbinaryen), Ptr{Cchar}, (BinaryenGlobalRef,), _import)
end

function BinaryenTagImportGetModule(_import)
    ccall((:BinaryenTagImportGetModule, libbinaryen), Ptr{Cchar}, (BinaryenTagRef,), _import)
end

"""
    BinaryenFunctionImportGetBase(_import)

Gets the external base name of the specified import.
"""
function BinaryenFunctionImportGetBase(_import)
    ccall((:BinaryenFunctionImportGetBase, libbinaryen), Ptr{Cchar}, (BinaryenFunctionRef,), _import)
end

function BinaryenTableImportGetBase(_import)
    ccall((:BinaryenTableImportGetBase, libbinaryen), Ptr{Cchar}, (BinaryenTableRef,), _import)
end

function BinaryenGlobalImportGetBase(_import)
    ccall((:BinaryenGlobalImportGetBase, libbinaryen), Ptr{Cchar}, (BinaryenGlobalRef,), _import)
end

function BinaryenTagImportGetBase(_import)
    ccall((:BinaryenTagImportGetBase, libbinaryen), Ptr{Cchar}, (BinaryenTagRef,), _import)
end

"""
    BinaryenExportGetKind(export_)

Gets the external kind of the specified export.
"""
function BinaryenExportGetKind(export_)
    ccall((:BinaryenExportGetKind, libbinaryen), BinaryenExternalKind, (BinaryenExportRef,), export_)
end

"""
    BinaryenExportGetName(export_)

Gets the external name of the specified export.
"""
function BinaryenExportGetName(export_)
    ccall((:BinaryenExportGetName, libbinaryen), Ptr{Cchar}, (BinaryenExportRef,), export_)
end

"""
    BinaryenExportGetValue(export_)

Gets the internal name of the specified export.
"""
function BinaryenExportGetValue(export_)
    ccall((:BinaryenExportGetValue, libbinaryen), Ptr{Cchar}, (BinaryenExportRef,), export_)
end

"""
    BinaryenAddCustomSection(_module, name, contents, contentsSize)

========= Custom sections =========
"""
function BinaryenAddCustomSection(_module, name, contents, contentsSize)
    ccall((:BinaryenAddCustomSection, libbinaryen), Cvoid, (BinaryenModuleRef, Ptr{Cchar}, Ptr{Cchar}, BinaryenIndex), _module, name, contents, contentsSize)
end

"""
========= Effect analyzer =========
"""
const BinaryenSideEffects = UInt32

function BinaryenSideEffectNone()
    ccall((:BinaryenSideEffectNone, libbinaryen), BinaryenSideEffects, ())
end

function BinaryenSideEffectBranches()
    ccall((:BinaryenSideEffectBranches, libbinaryen), BinaryenSideEffects, ())
end

function BinaryenSideEffectCalls()
    ccall((:BinaryenSideEffectCalls, libbinaryen), BinaryenSideEffects, ())
end

function BinaryenSideEffectReadsLocal()
    ccall((:BinaryenSideEffectReadsLocal, libbinaryen), BinaryenSideEffects, ())
end

function BinaryenSideEffectWritesLocal()
    ccall((:BinaryenSideEffectWritesLocal, libbinaryen), BinaryenSideEffects, ())
end

function BinaryenSideEffectReadsGlobal()
    ccall((:BinaryenSideEffectReadsGlobal, libbinaryen), BinaryenSideEffects, ())
end

function BinaryenSideEffectWritesGlobal()
    ccall((:BinaryenSideEffectWritesGlobal, libbinaryen), BinaryenSideEffects, ())
end

function BinaryenSideEffectReadsMemory()
    ccall((:BinaryenSideEffectReadsMemory, libbinaryen), BinaryenSideEffects, ())
end

function BinaryenSideEffectWritesMemory()
    ccall((:BinaryenSideEffectWritesMemory, libbinaryen), BinaryenSideEffects, ())
end

function BinaryenSideEffectReadsTable()
    ccall((:BinaryenSideEffectReadsTable, libbinaryen), BinaryenSideEffects, ())
end

function BinaryenSideEffectWritesTable()
    ccall((:BinaryenSideEffectWritesTable, libbinaryen), BinaryenSideEffects, ())
end

function BinaryenSideEffectImplicitTrap()
    ccall((:BinaryenSideEffectImplicitTrap, libbinaryen), BinaryenSideEffects, ())
end

function BinaryenSideEffectTrapsNeverHappen()
    ccall((:BinaryenSideEffectTrapsNeverHappen, libbinaryen), BinaryenSideEffects, ())
end

function BinaryenSideEffectIsAtomic()
    ccall((:BinaryenSideEffectIsAtomic, libbinaryen), BinaryenSideEffects, ())
end

function BinaryenSideEffectThrows()
    ccall((:BinaryenSideEffectThrows, libbinaryen), BinaryenSideEffects, ())
end

function BinaryenSideEffectDanglingPop()
    ccall((:BinaryenSideEffectDanglingPop, libbinaryen), BinaryenSideEffects, ())
end

function BinaryenSideEffectAny()
    ccall((:BinaryenSideEffectAny, libbinaryen), BinaryenSideEffects, ())
end

function BinaryenExpressionGetSideEffects(expr, _module)
    ccall((:BinaryenExpressionGetSideEffects, libbinaryen), BinaryenSideEffects, (BinaryenExpressionRef, BinaryenModuleRef), expr, _module)
end

mutable struct Relooper end

const RelooperRef = Ptr{Relooper}

mutable struct RelooperBlock end

const RelooperBlockRef = Ptr{RelooperBlock}

"""
    RelooperCreate(_module)

Create a relooper instance
"""
function RelooperCreate(_module)
    ccall((:RelooperCreate, libbinaryen), RelooperRef, (BinaryenModuleRef,), _module)
end

"""
    RelooperAddBlock(relooper, code)

Create a basic block that ends with nothing, or with some simple branching
"""
function RelooperAddBlock(relooper, code)
    ccall((:RelooperAddBlock, libbinaryen), RelooperBlockRef, (RelooperRef, BinaryenExpressionRef), relooper, code)
end

"""
    RelooperAddBranch(from, to, condition, code)

Create a branch to another basic block
The branch can have code on it, that is executed as the branch happens. this
is useful for phis. otherwise, code can be NULL
"""
function RelooperAddBranch(from, to, condition, code)
    ccall((:RelooperAddBranch, libbinaryen), Cvoid, (RelooperBlockRef, RelooperBlockRef, BinaryenExpressionRef, BinaryenExpressionRef), from, to, condition, code)
end

"""
    RelooperAddBlockWithSwitch(relooper, code, condition)

Create a basic block that ends a switch on a condition
"""
function RelooperAddBlockWithSwitch(relooper, code, condition)
    ccall((:RelooperAddBlockWithSwitch, libbinaryen), RelooperBlockRef, (RelooperRef, BinaryenExpressionRef, BinaryenExpressionRef), relooper, code, condition)
end

"""
    RelooperAddBranchForSwitch(from, to, indexes, numIndexes, code)

Create a switch-style branch to another basic block. The block's switch table
will have these indexes going to that target
"""
function RelooperAddBranchForSwitch(from, to, indexes, numIndexes, code)
    ccall((:RelooperAddBranchForSwitch, libbinaryen), Cvoid, (RelooperBlockRef, RelooperBlockRef, Ptr{BinaryenIndex}, BinaryenIndex, BinaryenExpressionRef), from, to, indexes, numIndexes, code)
end

"""
    RelooperRenderAndDispose(relooper, entry, labelHelper)

Generate structed wasm control flow from the CFG of blocks and branches that
were created on this relooper instance. This returns the rendered output, and
also disposes of the relooper and its blocks and branches, as they are no
longer needed.
@param labelHelper To render irreducible control flow, we may need a helper
       variable to guide us to the right target label. This value should be
an index of an i32 local variable that is free for us to use.
"""
function RelooperRenderAndDispose(relooper, entry, labelHelper)
    ccall((:RelooperRenderAndDispose, libbinaryen), BinaryenExpressionRef, (RelooperRef, RelooperBlockRef, BinaryenIndex), relooper, entry, labelHelper)
end

mutable struct CExpressionRunner end

const ExpressionRunnerRef = Ptr{CExpressionRunner}

const ExpressionRunnerFlags = UInt32

# no prototype is found for this function at binaryen-c.h:3451:36, please use with caution
"""
    ExpressionRunnerFlagsDefault()

By default, just evaluate the expression, i.e. all we want to know is whether
it computes down to a concrete value, where it is not necessary to preserve
side effects like those of a `local.tee`.
"""
function ExpressionRunnerFlagsDefault()
    ccall((:ExpressionRunnerFlagsDefault, libbinaryen), ExpressionRunnerFlags, ())
end

# no prototype is found for this function at binaryen-c.h:3458:36, please use with caution
"""
    ExpressionRunnerFlagsPreserveSideeffects()

Be very careful to preserve any side effects. For example, if we are
intending to replace the expression with a constant afterwards, even if we
can technically evaluate down to a constant, we still cannot replace the
expression if it also sets a local, which must be preserved in this scenario
so subsequent code keeps functioning.
"""
function ExpressionRunnerFlagsPreserveSideeffects()
    ccall((:ExpressionRunnerFlagsPreserveSideeffects, libbinaryen), ExpressionRunnerFlags, ())
end

# no prototype is found for this function at binaryen-c.h:3464:36, please use with caution
"""
    ExpressionRunnerFlagsTraverseCalls()

Traverse through function calls, attempting to compute their concrete value.
Must not be used in function-parallel scenarios, where the called function
might be concurrently modified, leading to undefined behavior. Traversing
another function reuses all of this runner's flags.
"""
function ExpressionRunnerFlagsTraverseCalls()
    ccall((:ExpressionRunnerFlagsTraverseCalls, libbinaryen), ExpressionRunnerFlags, ())
end

"""
    ExpressionRunnerCreate(_module, flags, maxDepth, maxLoopIterations)

Creates an ExpressionRunner instance
"""
function ExpressionRunnerCreate(_module, flags, maxDepth, maxLoopIterations)
    ccall((:ExpressionRunnerCreate, libbinaryen), ExpressionRunnerRef, (BinaryenModuleRef, ExpressionRunnerFlags, BinaryenIndex, BinaryenIndex), _module, flags, maxDepth, maxLoopIterations)
end

"""
    ExpressionRunnerSetLocalValue(runner, index, value)

Sets a known local value to use. Order matters if expressions have side
effects. For example, if the expression also sets a local, this side effect
will also happen (not affected by any flags). Returns `true` if the
expression actually evaluates to a constant.
"""
function ExpressionRunnerSetLocalValue(runner, index, value)
    ccall((:ExpressionRunnerSetLocalValue, libbinaryen), Bool, (ExpressionRunnerRef, BinaryenIndex, BinaryenExpressionRef), runner, index, value)
end

"""
    ExpressionRunnerSetGlobalValue(runner, name, value)

Sets a known global value to use. Order matters if expressions have side
effects. For example, if the expression also sets a local, this side effect
will also happen (not affected by any flags). Returns `true` if the
expression actually evaluates to a constant.
"""
function ExpressionRunnerSetGlobalValue(runner, name, value)
    ccall((:ExpressionRunnerSetGlobalValue, libbinaryen), Bool, (ExpressionRunnerRef, Ptr{Cchar}, BinaryenExpressionRef), runner, name, value)
end

"""
    ExpressionRunnerRunAndDispose(runner, expr)

Runs the expression and returns the constant value expression it evaluates
to, if any. Otherwise returns `NULL`. Also disposes the runner.
"""
function ExpressionRunnerRunAndDispose(runner, expr)
    ccall((:ExpressionRunnerRunAndDispose, libbinaryen), BinaryenExpressionRef, (ExpressionRunnerRef, BinaryenExpressionRef), runner, expr)
end

mutable struct TypeBuilder end

const TypeBuilderRef = Ptr{TypeBuilder}

const TypeBuilderErrorReason = UInt32

"""
    TypeBuilderErrorReasonSelfSupertype()

Indicates a cycle in the supertype relation.
"""
function TypeBuilderErrorReasonSelfSupertype()
    ccall((:TypeBuilderErrorReasonSelfSupertype, libbinaryen), TypeBuilderErrorReason, ())
end

"""
    TypeBuilderErrorReasonInvalidSupertype()

Indicates that the declared supertype of a type is invalid.
"""
function TypeBuilderErrorReasonInvalidSupertype()
    ccall((:TypeBuilderErrorReasonInvalidSupertype, libbinaryen), TypeBuilderErrorReason, ())
end

"""
    TypeBuilderErrorReasonForwardSupertypeReference()

Indicates that the declared supertype is an invalid forward reference.
"""
function TypeBuilderErrorReasonForwardSupertypeReference()
    ccall((:TypeBuilderErrorReasonForwardSupertypeReference, libbinaryen), TypeBuilderErrorReason, ())
end

"""
    TypeBuilderErrorReasonForwardChildReference()

Indicates that a child of a type is an invalid forward reference.
"""
function TypeBuilderErrorReasonForwardChildReference()
    ccall((:TypeBuilderErrorReasonForwardChildReference, libbinaryen), TypeBuilderErrorReason, ())
end

const BinaryenBasicHeapType = UInt32

"""
    TypeBuilderCreate(size)

Constructs a new type builder that allows for the construction of recursive
types. Contains a table of `size` mutable heap types.
"""
function TypeBuilderCreate(size)
    ccall((:TypeBuilderCreate, libbinaryen), TypeBuilderRef, (BinaryenIndex,), size)
end

"""
    TypeBuilderGrow(builder, count)

Grows the backing table of the type builder by `count` slots.
"""
function TypeBuilderGrow(builder, count)
    ccall((:TypeBuilderGrow, libbinaryen), Cvoid, (TypeBuilderRef, BinaryenIndex), builder, count)
end

"""
    TypeBuilderGetSize(builder)

Gets the size of the backing table of the type builder.
"""
function TypeBuilderGetSize(builder)
    ccall((:TypeBuilderGetSize, libbinaryen), BinaryenIndex, (TypeBuilderRef,), builder)
end

"""
    TypeBuilderSetSignatureType(builder, index, paramTypes, resultTypes)

Sets the heap type at index `index` to a concrete signature type. Expects
temporary tuple types if multiple parameter and/or result types include
temporary types.
"""
function TypeBuilderSetSignatureType(builder, index, paramTypes, resultTypes)
    ccall((:TypeBuilderSetSignatureType, libbinaryen), Cvoid, (TypeBuilderRef, BinaryenIndex, BinaryenType, BinaryenType), builder, index, paramTypes, resultTypes)
end

"""
    TypeBuilderSetStructType(builder, index, fieldTypes, fieldPackedTypes, fieldMutables, numFields)

Sets the heap type at index `index` to a concrete struct type.
"""
function TypeBuilderSetStructType(builder, index, fieldTypes, fieldPackedTypes, fieldMutables, numFields)
    ccall((:TypeBuilderSetStructType, libbinaryen), Cvoid, (TypeBuilderRef, BinaryenIndex, Ptr{BinaryenType}, Ptr{BinaryenPackedType}, Ptr{Bool}, Cint), builder, index, fieldTypes, fieldPackedTypes, fieldMutables, numFields)
end

"""
    TypeBuilderSetArrayType(builder, index, elementType, elementPackedType, elementMutable)

Sets the heap type at index `index` to a concrete array type.
"""
function TypeBuilderSetArrayType(builder, index, elementType, elementPackedType, elementMutable)
    ccall((:TypeBuilderSetArrayType, libbinaryen), Cvoid, (TypeBuilderRef, BinaryenIndex, BinaryenType, BinaryenPackedType, Cint), builder, index, elementType, elementPackedType, elementMutable)
end

"""
    TypeBuilderGetTempHeapType(builder, index)

Gets the temporary heap type to use at index `index`. Temporary heap types
may only be used to construct temporary types using the type builder.
"""
function TypeBuilderGetTempHeapType(builder, index)
    ccall((:TypeBuilderGetTempHeapType, libbinaryen), BinaryenHeapType, (TypeBuilderRef, BinaryenIndex), builder, index)
end

"""
    TypeBuilderGetTempTupleType(builder, types, numTypes)

Gets a temporary tuple type for use with and owned by the type builder.
"""
function TypeBuilderGetTempTupleType(builder, types, numTypes)
    ccall((:TypeBuilderGetTempTupleType, libbinaryen), BinaryenType, (TypeBuilderRef, Ptr{BinaryenType}, BinaryenIndex), builder, types, numTypes)
end

"""
    TypeBuilderGetTempRefType(builder, heapType, nullable)

Gets a temporary reference type for use with and owned by the type builder.
"""
function TypeBuilderGetTempRefType(builder, heapType, nullable)
    ccall((:TypeBuilderGetTempRefType, libbinaryen), BinaryenType, (TypeBuilderRef, BinaryenHeapType, Cint), builder, heapType, nullable)
end

"""
    TypeBuilderSetSubType(builder, index, superType)

Sets the type at `index` to be a subtype of the given super type.
"""
function TypeBuilderSetSubType(builder, index, superType)
    ccall((:TypeBuilderSetSubType, libbinaryen), Cvoid, (TypeBuilderRef, BinaryenIndex, BinaryenHeapType), builder, index, superType)
end

"""
    TypeBuilderCreateRecGroup(builder, index, length)

Creates a new recursion group in the range `index` inclusive to `index +
length` exclusive. Recursion groups must not overlap.
"""
function TypeBuilderCreateRecGroup(builder, index, length)
    ccall((:TypeBuilderCreateRecGroup, libbinaryen), Cvoid, (TypeBuilderRef, BinaryenIndex, BinaryenIndex), builder, index, length)
end

"""
    TypeBuilderBuildAndDispose(builder, heapTypes, errorIndex, errorReason)

Builds the heap type hierarchy and disposes the builder. Returns `false` and
populates `errorIndex` and `errorReason` on failure.
"""
function TypeBuilderBuildAndDispose(builder, heapTypes, errorIndex, errorReason)
    ccall((:TypeBuilderBuildAndDispose, libbinaryen), Bool, (TypeBuilderRef, Ptr{BinaryenHeapType}, Ptr{BinaryenIndex}, Ptr{TypeBuilderErrorReason}), builder, heapTypes, errorIndex, errorReason)
end

"""
    BinaryenModuleSetTypeName(_module, heapType, name)

Sets the textual name of a compound `heapType`. Has no effect if the type
already has a canonical name.
"""
function BinaryenModuleSetTypeName(_module, heapType, name)
    ccall((:BinaryenModuleSetTypeName, libbinaryen), Cvoid, (BinaryenModuleRef, BinaryenHeapType, Ptr{Cchar}), _module, heapType, name)
end

"""
    BinaryenModuleSetFieldName(_module, heapType, index, name)

Sets the field name of a struct `heapType` at index `index`.
"""
function BinaryenModuleSetFieldName(_module, heapType, index, name)
    ccall((:BinaryenModuleSetFieldName, libbinaryen), Cvoid, (BinaryenModuleRef, BinaryenHeapType, BinaryenIndex, Ptr{Cchar}), _module, heapType, index, name)
end

"""
    BinaryenSetColorsEnabled(enabled)

Enable or disable coloring for the Wasm printer
"""
function BinaryenSetColorsEnabled(enabled)
    ccall((:BinaryenSetColorsEnabled, libbinaryen), Cvoid, (Bool,), enabled)
end

# no prototype is found for this function at binaryen-c.h:3598:19, please use with caution
"""
    BinaryenAreColorsEnabled()

Query whether color is enable for the Wasm printer
"""
function BinaryenAreColorsEnabled()
    ccall((:BinaryenAreColorsEnabled, libbinaryen), Bool, ())
end

# Skipping MacroDefinition: WASM_DEPRECATED __attribute__ ( ( deprecated ) )

# Skipping MacroDefinition: DELEGATE ( CLASS_TO_VISIT ) BINARYEN_API BinaryenExpressionId Binaryen ## CLASS_TO_VISIT ## Id ( void ) ;

# exports
const PREFIXES = ["Binaryen", "Relooper", "ExpressionRunner", "TypeBuilder"]
for name in names(@__MODULE__; all=true), prefix in PREFIXES
    if startswith(string(name), prefix)
        @eval export $name
    end
end

end # module
