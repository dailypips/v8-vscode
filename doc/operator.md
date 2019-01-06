# Operator
```
// An operator represents description of the "computation" of a node in the
// compiler IR. A computation takes values (i.e. data) as input and produces
// zero or more values as output. The side-effects of a computation must be
// captured by additional control and data dependencies which are part of the
// IR graph.
// Operators are immutable and describe the statically-known parts of a
// computation. Thus they can be safely shared by many different nodes in the
// IR graph, or even globally between graphs. Operators can have "static
// parameters" which are compile-time constant parameters to the operator, such
// as the name for a named field access, the ID of a runtime function, etc.
// Static parameters are private to the operator and only semantically
// meaningful to the operator itself.
```
## Operator::Properties
* kNoProperties = 0,
* kCommutative = 1 << 0,  // OP(a, b) == OP(b, a) for all inputs.
* kAssociative = 1 << 1,  // OP(a, OP(b,c)) == OP(OP(a,b), c) for all inputs.
* kIdempotent = 1 << 2,   // OP(a); OP(a) == OP(a).
* kNoRead = 1 << 3,       // Has no scheduling dependency on Effects
* kNoWrite = 1 << 4,      // Does not modify any Effects and thereby,create new scheduling dependencies.
* kNoThrow = 1 << 5,      // Can never generate an exception.
* kNoDeopt = 1 << 6,      // Can never generate an eager deoptimization exit.
* kFoldable = kNoRead | kNoWrite,
* kKontrol = kNoDeopt | kFoldable | kNoThrow,
* kEliminatable = kNoDeopt | kNoWrite | kNoThrow,
* kPure = kNoDeopt | kNoRead | kNoWrite | kNoThrow | kIdempotent

## 成员
* Opcode
* Properties
* mnemonic
* value_in
* effect_in
* control_in
* value_out
* effect_out
* control_out

## 派生类
### Common Op
* Dead
* Unreachable
* IfTrue
* IfFalse
* IfSuccess
* IfException
* Throw
* Terminate
* OsrNormalEntry
* OsrLoopEntry
* LoopExit
* LoopExitValue
* LoopExitEffect
* Checkpoint
* FinishRegion
* Retain
* EndOperator
* ReturnOperator
* EffectPhiOperator
* LoopOperator
* MergeOperator
* InductionVariablePhiOperator
### machine-operator
* Word32AtomicPairLoad
* Word32AtomicPairStore
* Word32AtomicPairAdd
* Word32AtomicPairSub
* Word32AtomicPairAnd
* Word32AtomicPairOr
* Word32AtomicPairXor
* Word32AtomicPairExchange
* Word32AtomicPairCompareExchange
* BitcastWordToTagged
* BitcastTaggedToWord
* BitcastMaybeObjectToWord
* TaggedPoisonOnSpeculation
* Word32PoisonOnSpeculation
* Word64PoisonOnSpeculation
* SpeculationFenceOperator
* DebugAbortOperator
* DebugBreakOperator
* UnsafePointerAddOperator
* CommentOperator: Operator1<const char*>

### simplified-operato
#### PURE_OP_LIST
* BooleanNot, Operator::kNoProperties, 1, 0)                   \
* NumberEqual, Operator::kCommutative, 2, 0)                   \
* NumberLessThan, Operator::kNoProperties, 2, 0)               \
* NumberLessThanOrEqual, Operator::kNoProperties, 2, 0)        \
* NumberAdd, Operator::kCommutative, 2, 0)                     \
* NumberSubtract, Operator::kNoProperties, 2, 0)               \
* NumberMultiply, Operator::kCommutative, 2, 0)                \
* NumberDivide, Operator::kNoProperties, 2, 0)                 \
* NumberModulus, Operator::kNoProperties, 2, 0)                \
* NumberBitwiseOr, Operator::kCommutative, 2, 0)               \
* NumberBitwiseXor, Operator::kCommutative, 2, 0)              \
* NumberBitwiseAnd, Operator::kCommutative, 2, 0)              \
* NumberShiftLeft, Operator::kNoProperties, 2, 0)              \
* NumberShiftRight, Operator::kNoProperties, 2, 0)             \
* NumberShiftRightLogical, Operator::kNoProperties, 2, 0)      \
* NumberImul, Operator::kCommutative, 2, 0)                    \
* NumberAbs, Operator::kNoProperties, 1, 0)                    \
* NumberClz32, Operator::kNoProperties, 1, 0)                  \
* NumberCeil, Operator::kNoProperties, 1, 0)                   \
* NumberFloor, Operator::kNoProperties, 1, 0)                  \
* NumberFround, Operator::kNoProperties, 1, 0)                 \
* NumberAcos, Operator::kNoProperties, 1, 0)                   \
* NumberAcosh, Operator::kNoProperties, 1, 0)                  \
* NumberAsin, Operator::kNoProperties, 1, 0)                   \
* NumberAsinh, Operator::kNoProperties, 1, 0)                  \
* NumberAtan, Operator::kNoProperties, 1, 0)                   \
* NumberAtan2, Operator::kNoProperties, 2, 0)                  \
* NumberAtanh, Operator::kNoProperties, 1, 0)                  \
* NumberCbrt, Operator::kNoProperties, 1, 0)                   \
* NumberCos, Operator::kNoProperties, 1, 0)                    \
* NumberCosh, Operator::kNoProperties, 1, 0)                   \
* NumberExp, Operator::kNoProperties, 1, 0)                    \
* NumberExpm1, Operator::kNoProperties, 1, 0)                  \
* NumberLog, Operator::kNoProperties, 1, 0)                    \
* NumberLog1p, Operator::kNoProperties, 1, 0)                  \
* NumberLog10, Operator::kNoProperties, 1, 0)                  \
* NumberLog2, Operator::kNoProperties, 1, 0)                   \
* NumberMax, Operator::kNoProperties, 2, 0)                    \
* NumberMin, Operator::kNoProperties, 2, 0)                    \
* NumberPow, Operator::kNoProperties, 2, 0)                    \
* NumberRound, Operator::kNoProperties, 1, 0)                  \
* NumberSign, Operator::kNoProperties, 1, 0)                   \
* NumberSin, Operator::kNoProperties, 1, 0)                    \
* NumberSinh, Operator::kNoProperties, 1, 0)                   \
* NumberSqrt, Operator::kNoProperties, 1, 0)                   \
* NumberTan, Operator::kNoProperties, 1, 0)                    \
* NumberTanh, Operator::kNoProperties, 1, 0)                   \
* NumberTrunc, Operator::kNoProperties, 1, 0)                  \
* NumberToBoolean, Operator::kNoProperties, 1, 0)              \
* NumberToInt32, Operator::kNoProperties, 1, 0)                \
* NumberToString, Operator::kNoProperties, 1, 0)               \
* NumberToUint32, Operator::kNoProperties, 1, 0)               \
* NumberToUint8Clamped, Operator::kNoProperties, 1, 0)         \
* NumberSilenceNaN, Operator::kNoProperties, 1, 0)             \
* StringConcat, Operator::kNoProperties, 3, 0)                 \
* StringToNumber, Operator::kNoProperties, 1, 0)               \
* StringFromSingleCharCode, Operator::kNoProperties, 1, 0)     \
* StringIndexOf, Operator::kNoProperties, 3, 0)                \
* StringLength, Operator::kNoProperties, 1, 0)                 \
* StringToLowerCaseIntl, Operator::kNoProperties, 1, 0)        \
* StringToUpperCaseIntl, Operator::kNoProperties, 1, 0)        \
* TypeOf, Operator::kNoProperties, 1, 1)                       \
* PlainPrimitiveToNumber, Operator::kNoProperties, 1, 0)       \
* PlainPrimitiveToWord32, Operator::kNoProperties, 1, 0)       \
* PlainPrimitiveToFloat64, Operator::kNoProperties, 1, 0)      \
* ChangeTaggedSignedToInt32, Operator::kNoProperties, 1, 0)    \
* ChangeTaggedSignedToInt64, Operator::kNoProperties, 1, 0)    \
* ChangeTaggedToInt32, Operator::kNoProperties, 1, 0)          \
* ChangeTaggedToInt64, Operator::kNoProperties, 1, 0)          \
* ChangeTaggedToUint32, Operator::kNoProperties, 1, 0)         \
* ChangeTaggedToFloat64, Operator::kNoProperties, 1, 0)        \
* ChangeTaggedToTaggedSigned, Operator::kNoProperties, 1, 0)   \
* ChangeFloat64ToTaggedPointer, Operator::kNoProperties, 1, 0) \
* ChangeInt31ToTaggedSigned, Operator::kNoProperties, 1, 0)    \
* ChangeInt32ToTagged, Operator::kNoProperties, 1, 0)          \
* ChangeInt64ToTagged, Operator::kNoProperties, 1, 0)          \
* ChangeUint32ToTagged, Operator::kNoProperties, 1, 0)         \
* ChangeUint64ToTagged, Operator::kNoProperties, 1, 0)         \
* ChangeTaggedToBit, Operator::kNoProperties, 1, 0)            \
* ChangeBitToTagged, Operator::kNoProperties, 1, 0)            \
* TruncateTaggedToBit, Operator::kNoProperties, 1, 0)          \
* TruncateTaggedPointerToBit, Operator::kNoProperties, 1, 0)   \
* TruncateTaggedToWord32, Operator::kNoProperties, 1, 0)       \
* TruncateTaggedToFloat64, Operator::kNoProperties, 1, 0)      \
* ObjectIsArrayBufferView, Operator::kNoProperties, 1, 0)      \
* ObjectIsBigInt, Operator::kNoProperties, 1, 0)               \
* ObjectIsCallable, Operator::kNoProperties, 1, 0)             \
* ObjectIsConstructor, Operator::kNoProperties, 1, 0)          \
* ObjectIsDetectableCallable, Operator::kNoProperties, 1, 0)   \
* ObjectIsMinusZero, Operator::kNoProperties, 1, 0)            \
* NumberIsMinusZero, Operator::kNoProperties, 1, 0)            \
* ObjectIsNaN, Operator::kNoProperties, 1, 0)                  \
* NumberIsNaN, Operator::kNoProperties, 1, 0)                  \
* ObjectIsNonCallable, Operator::kNoProperties, 1, 0)          \
* ObjectIsNumber, Operator::kNoProperties, 1, 0)               \
* ObjectIsReceiver, Operator::kNoProperties, 1, 0)             \
* ObjectIsSmi, Operator::kNoProperties, 1, 0)                  \
* ObjectIsString, Operator::kNoProperties, 1, 0)               \
* ObjectIsSymbol, Operator::kNoProperties, 1, 0)               \
* ObjectIsUndetectable, Operator::kNoProperties, 1, 0)         \
* NumberIsFloat64Hole, Operator::kNoProperties, 1, 0)          \
* NumberIsFinite, Operator::kNoProperties, 1, 0)               \
* ObjectIsFiniteNumber, Operator::kNoProperties, 1, 0)         \
* NumberIsInteger, Operator::kNoProperties, 1, 0)              \
* ObjectIsSafeInteger, Operator::kNoProperties, 1, 0)          \
* NumberIsSafeInteger, Operator::kNoProperties, 1, 0)          \
* ObjectIsInteger, Operator::kNoProperties, 1, 0)              \
* ConvertTaggedHoleToUndefined, Operator::kNoProperties, 1, 0) \
* SameValue, Operator::kCommutative, 2, 0)                     \
* ReferenceEqual, Operator::kCommutative, 2, 0)                \
* StringEqual, Operator::kCommutative, 2, 0)                   \
* StringLessThan, Operator::kNoProperties, 2, 0)               \
* StringLessThanOrEqual, Operator::kNoProperties, 2, 0)        \
* ToBoolean, Operator::kNoProperties, 1, 0)                    \
* NewConsString, Operator::kNoProperties, 3, 0)                \
* PoisonIndex, Operator::kNoProperties, 1, 0)

#### EFFECT_DEPENDENT_OP_LIST(V)
  V(StringCharCodeAt, Operator::kNoProperties, 2, 1) \
  V(StringSubstring, Operator::kNoProperties, 3, 1)  \
  V(DateNow, Operator::kNoProperties, 0, 1)

#### SPECULATIVE_NUMBER_BINOP_LIST(V)
* SIMPLIFIED_SPECULATIVE_NUMBER_BINOP_LIST(V) \
* SpeculativeNumberEqual)                   \
* SpeculativeNumberLessThan)                \
* SpeculativeNumberLessThanOrEqual)

#### CHECKED_OP_LIST(V)                \
* CheckEqualsInternalizedString, 2, 0)  \
* CheckEqualsSymbol, 2, 0)              \
* CheckHeapObject, 1, 1)                \
* CheckInternalizedString, 1, 1)        \
* CheckNotTaggedHole, 1, 1)             \
* CheckReceiver, 1, 1)                  \
* CheckReceiverOrNullOrUndefined, 1, 1) \
* CheckSymbol, 1, 1)                    \
* CheckedInt32Add, 2, 1)                \
* CheckedInt32Div, 2, 1)                \
* CheckedInt32Mod, 2, 1)                \
* CheckedInt32Sub, 2, 1)                \
* CheckedUint32Div, 2, 1)               \
* CheckedUint32Mod, 2, 1)

#### CHECKED_WITH_FEEDBACK_OP_LIST(V) \
* CheckBounds, 2, 1)                   \
* CheckNumber, 1, 1)                   \
* CheckSmi, 1, 1)                      \
* CheckString, 1, 1)                   \
* CheckedInt32ToTaggedSigned, 1, 1)    \
* CheckedInt64ToInt32, 1, 1)           \
* CheckedInt64ToTaggedSigned, 1, 1)    \
* CheckedTaggedSignedToInt32, 1, 1)    \
* CheckedTaggedToTaggedPointer, 1, 1)  \
* CheckedTaggedToTaggedSigned, 1, 1)   \
* CheckedUint32Bounds, 2, 1)           \
* CheckedUint32ToInt32, 1, 1)          \
* CheckedUint32ToTaggedSigned, 1, 1)   \
* CheckedUint64Bounds, 2, 1)           \
* CheckedUint64ToInt32, 1, 1)          \
* CheckedUint64ToTaggedSigned, 1, 1)

#### Other
* FindOrderedHashMapEntryOperator
* FindOrderedHashMapEntryForInt32KeyOperator
* ArgumentsFrameOperator
* ChangeFloat64ToTaggedOperator: Operator1<CheckForMinusZeroMode>
* CheckedInt32MulOperator
* CheckedFloat64ToInt32Operator
* CheckedFloat64ToInt64Operator
* CheckedTaggedToInt32Operator
* CheckedTaggedToInt64Operator
* CheckedTaggedToFloat64Operator
* CheckedTruncateTaggedToWord32Operator
* ConvertReceiverOperator
* CheckFloat64HoleNaNOperator
* EnsureWritableFastElementsOperator
* GrowFastElementsOperator
* LoadFieldByIndexOperator
* SpeculativeToNumberOperator

## JSOperator
### CACHED_OP_LIST
* BitwiseOr, Operator::kNoProperties, 2, 1)                            \
* BitwiseXor, Operator::kNoProperties, 2, 1)                           \
* BitwiseAnd, Operator::kNoProperties, 2, 1)                           \
* ShiftLeft, Operator::kNoProperties, 2, 1)                            \
* ShiftRight, Operator::kNoProperties, 2, 1)                           \
* ShiftRightLogical, Operator::kNoProperties, 2, 1)                    \
* Subtract, Operator::kNoProperties, 2, 1)                             \
* Multiply, Operator::kNoProperties, 2, 1)                             \
* Divide, Operator::kNoProperties, 2, 1)                               \
* Modulus, Operator::kNoProperties, 2, 1)                              \
* Exponentiate, Operator::kNoProperties, 2, 1)                         \
* BitwiseNot, Operator::kNoProperties, 1, 1)                           \
* Decrement, Operator::kNoProperties, 1, 1)                            \
* Increment, Operator::kNoProperties, 1, 1)                            \
* Negate, Operator::kNoProperties, 1, 1)                               \
* ToLength, Operator::kNoProperties, 1, 1)                             \
* ToName, Operator::kNoProperties, 1, 1)                               \
* ToNumber, Operator::kNoProperties, 1, 1)                             \
* ToNumberConvertBigInt, Operator::kNoProperties, 1, 1)                \
* ToNumeric, Operator::kNoProperties, 1, 1)                            \
* ToObject, Operator::kFoldable, 1, 1)                                 \
* ToString, Operator::kNoProperties, 1, 1)                             \
* Create, Operator::kNoProperties, 2, 1)                               \
* CreateIterResultObject, Operator::kEliminatable, 2, 1)               \
* CreateStringIterator, Operator::kEliminatable, 1, 1)                 \
* CreateKeyValueArray, Operator::kEliminatable, 2, 1)                  \
* CreatePromise, Operator::kEliminatable, 0, 1)                        \
* CreateTypedArray, Operator::kNoProperties, 5, 1)                     \
* CreateObject, Operator::kNoProperties, 1, 1)                         \
* ObjectIsArray, Operator::kNoProperties, 1, 1)                        \
* HasProperty, Operator::kNoProperties, 2, 1)                          \
* HasInPrototypeChain, Operator::kNoProperties, 2, 1)                  \
* OrdinaryHasInstance, Operator::kNoProperties, 2, 1)                  \
* ForInEnumerate, Operator::kNoProperties, 1, 1)                       \
* AsyncFunctionEnter, Operator::kNoProperties, 2, 1)                   \
* AsyncFunctionReject, Operator::kNoDeopt | Operator::kNoThrow, 3, 1)  \
* AsyncFunctionResolve, Operator::kNoDeopt | Operator::kNoThrow, 3, 1) \
* LoadMessage, Operator::kNoThrow | Operator::kNoWrite, 0, 1)          \
* StoreMessage, Operator::kNoRead | Operator::kNoThrow, 1, 0)          \
* GeneratorRestoreContinuation, Operator::kNoThrow, 1, 1)              \
* GeneratorRestoreContext, Operator::kNoThrow, 1, 1)                   \
* GeneratorRestoreInputOrDebugPos, Operator::kNoThrow, 1, 1)           \
* StackCheck, Operator::kNoWrite, 0, 0)                                \
* Debugger, Operator::kNoProperties, 0, 0)                             \
* FulfillPromise, Operator::kNoDeopt | Operator::kNoThrow, 2, 1)       \
* PerformPromiseThen, Operator::kNoDeopt | Operator::kNoThrow, 4, 1)   \
* PromiseResolve, Operator::kNoProperties, 2, 1)                       \
* RejectPromise, Operator::kNoDeopt | Operator::kNoThrow, 3, 1)        \
* ResolvePromise, Operator::kNoDeopt | Operator::kNoThrow, 2, 1)       \
* GetSuperConstructor, Operator::kNoWrite, 1, 1)                       \
* ParseInt, Operator::kNoProperties, 2, 1)                             \
* RegExpTest, Operator::kNoProperties, 2, 1)

### BINARY_OP_LIST
* Add
### COMPARE_OP_LIST
* Equal, Operator::kNoProperties)           \
* StrictEqual, Operator::kPure)             \
* LessThan, Operator::kNoProperties)        \
* GreaterThan, Operator::kNoProperties)     \
* LessThanOrEqual, Operator::kNoProperties) \
* GreaterThanOrEqual, Operator::kNoProperties)
