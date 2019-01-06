# MachineType (MachineRepresentation, MachineSemantic)
## MachineRepresentation(u8)
  * kNone,
  * kBit,
  * kWord8,
  * kWord16,
  * kWord32,
  * kWord64,
  * kTaggedSigned,
  * kTaggedPointer,
  * kTagged,
  * kFloat32,
  * kFloat64,
  * kSimd128,
## MachineSemantic(u8)
  * KNone
  * KBool
  * kInt32
  * KUint32
  * kInt64
  * kUint64
  * kNumber
  * kAny
  
# Signature<T>
<p>Describes the inputs and outputs of a function or call.</p>

* return_count
* parameter_count

<p>使用 Builder模式构建 Signature</p>

```c++
typedef Signature<MachineType> MachineSignature
```