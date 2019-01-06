# LinkageLocation
<p>Describes the location for a parameter or a return value to a call.</p>

## LocationType
* REGISTER
* STACK_SLOT

## 成员
* MachineType
* LocationType(index) 

# CallDescriptor
<p>Describes a call to various parts of the compiler. Every call has the notion of a "target", which is the first input to the call.</p>

## Kind
* kCallCodeObject // target is a Code object
* kCallJSFunction // target is a JSFunction object
* kCallAddress // target is a machine pointer
* kCallWasmFunction // target is a wasm function
* kCallWasmImportWrapper // target is a wasm import wrapper
* kCallBuiltinPointer // target is a builtin pointer

## 成员
* Kind
* MachineType
* LinkageLocation
* Signature<LinkageLocation>
* StackParamCount
* Operator::Properties
* RegList callee_saved_registers
* RegList callee_saved_fp_registers,
* Flags flags
* string debug_name
* RegList allocatable_register = 0
* StackReturnCount = 0