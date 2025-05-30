; NOTE: Assertions have been autogenerated by utils/update_analyze_test_checks.py
; RUN: opt < %s -passes="print<cost-model>" 2>&1 -disable-output -S -mtriple=riscv64 -mattr=+v,+f,+d,+zfh,+zvfh,+zvfbfmin | FileCheck %s
; RUN: opt < %s -passes="print<cost-model>" 2>&1 -disable-output -S -mtriple=riscv64 -mattr=+v,+f,+d,+zfh,+zvfhmin,+zvfbfmin | FileCheck %s
; RUN: opt < %s -passes="print<cost-model>" -cost-kind=code-size 2>&1 -disable-output -S -mtriple=riscv64 -mattr=+v,+f,+d,+zfh,+zvfh | FileCheck %s --check-prefix=SIZE
; RUN: opt < %s -passes="print<cost-model>" -cost-kind=code-size 2>&1 -disable-output -S -mtriple=riscv64 -mattr=+v,+f,+d,+zfh,+zvfhmin | FileCheck %s --check-prefix=SIZE

define void @vector_splice() {
; CHECK-LABEL: 'vector_splice'
; CHECK-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %splice.nxv1i8 = call <vscale x 1 x i8> @llvm.vector.splice.nxv1i8(<vscale x 1 x i8> zeroinitializer, <vscale x 1 x i8> zeroinitializer, i32 -1)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %splice.nxv2i8 = call <vscale x 2 x i8> @llvm.vector.splice.nxv2i8(<vscale x 2 x i8> zeroinitializer, <vscale x 2 x i8> zeroinitializer, i32 -1)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %splice.nxv4i8 = call <vscale x 4 x i8> @llvm.vector.splice.nxv4i8(<vscale x 4 x i8> zeroinitializer, <vscale x 4 x i8> zeroinitializer, i32 -1)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %splice.nxv8i8 = call <vscale x 8 x i8> @llvm.vector.splice.nxv8i8(<vscale x 8 x i8> zeroinitializer, <vscale x 8 x i8> zeroinitializer, i32 -1)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %splice.nxv16i8 = call <vscale x 16 x i8> @llvm.vector.splice.nxv16i8(<vscale x 16 x i8> zeroinitializer, <vscale x 16 x i8> zeroinitializer, i32 -1)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %splice.nxv32i8 = call <vscale x 32 x i8> @llvm.vector.splice.nxv32i8(<vscale x 32 x i8> zeroinitializer, <vscale x 32 x i8> zeroinitializer, i32 -1)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 16 for instruction: %splice.nxv64i8 = call <vscale x 64 x i8> @llvm.vector.splice.nxv64i8(<vscale x 64 x i8> zeroinitializer, <vscale x 64 x i8> zeroinitializer, i32 -1)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %splice.nxv1i16 = call <vscale x 1 x i16> @llvm.vector.splice.nxv1i16(<vscale x 1 x i16> zeroinitializer, <vscale x 1 x i16> zeroinitializer, i32 -1)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %splice.nxv2i16 = call <vscale x 2 x i16> @llvm.vector.splice.nxv2i16(<vscale x 2 x i16> zeroinitializer, <vscale x 2 x i16> zeroinitializer, i32 -1)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %splice.nxv4i16 = call <vscale x 4 x i16> @llvm.vector.splice.nxv4i16(<vscale x 4 x i16> zeroinitializer, <vscale x 4 x i16> zeroinitializer, i32 -1)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %splice.nxv8i16 = call <vscale x 8 x i16> @llvm.vector.splice.nxv8i16(<vscale x 8 x i16> zeroinitializer, <vscale x 8 x i16> zeroinitializer, i32 -1)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %splice.nxv16i16 = call <vscale x 16 x i16> @llvm.vector.splice.nxv16i16(<vscale x 16 x i16> zeroinitializer, <vscale x 16 x i16> zeroinitializer, i32 -1)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 16 for instruction: %splice.nxv32i16 = call <vscale x 32 x i16> @llvm.vector.splice.nxv32i16(<vscale x 32 x i16> zeroinitializer, <vscale x 32 x i16> zeroinitializer, i32 -1)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 32 for instruction: %splice.nxv64i16 = call <vscale x 64 x i16> @llvm.vector.splice.nxv64i16(<vscale x 64 x i16> zeroinitializer, <vscale x 64 x i16> zeroinitializer, i32 -1)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %splice.nxv1i32 = call <vscale x 1 x i32> @llvm.vector.splice.nxv1i32(<vscale x 1 x i32> zeroinitializer, <vscale x 1 x i32> zeroinitializer, i32 -1)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %splice.nxv2i32 = call <vscale x 2 x i32> @llvm.vector.splice.nxv2i32(<vscale x 2 x i32> zeroinitializer, <vscale x 2 x i32> zeroinitializer, i32 -1)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %splice.nxv4i32 = call <vscale x 4 x i32> @llvm.vector.splice.nxv4i32(<vscale x 4 x i32> zeroinitializer, <vscale x 4 x i32> zeroinitializer, i32 -1)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %splice.nxv8i32 = call <vscale x 8 x i32> @llvm.vector.splice.nxv8i32(<vscale x 8 x i32> zeroinitializer, <vscale x 8 x i32> zeroinitializer, i32 -1)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 16 for instruction: %splice.nxv16i32 = call <vscale x 16 x i32> @llvm.vector.splice.nxv16i32(<vscale x 16 x i32> zeroinitializer, <vscale x 16 x i32> zeroinitializer, i32 -1)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 32 for instruction: %splice.nxv32i32 = call <vscale x 32 x i32> @llvm.vector.splice.nxv32i32(<vscale x 32 x i32> zeroinitializer, <vscale x 32 x i32> zeroinitializer, i32 -1)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 64 for instruction: %splice.nxv64i32 = call <vscale x 64 x i32> @llvm.vector.splice.nxv64i32(<vscale x 64 x i32> zeroinitializer, <vscale x 64 x i32> zeroinitializer, i32 -1)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %splice.nxv1i64 = call <vscale x 1 x i64> @llvm.vector.splice.nxv1i64(<vscale x 1 x i64> zeroinitializer, <vscale x 1 x i64> zeroinitializer, i32 -1)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %splice.nxv2i64 = call <vscale x 2 x i64> @llvm.vector.splice.nxv2i64(<vscale x 2 x i64> zeroinitializer, <vscale x 2 x i64> zeroinitializer, i32 -1)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %splice.nxv4i64 = call <vscale x 4 x i64> @llvm.vector.splice.nxv4i64(<vscale x 4 x i64> zeroinitializer, <vscale x 4 x i64> zeroinitializer, i32 -1)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 16 for instruction: %splice.nxv8i64 = call <vscale x 8 x i64> @llvm.vector.splice.nxv8i64(<vscale x 8 x i64> zeroinitializer, <vscale x 8 x i64> zeroinitializer, i32 -1)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 32 for instruction: %splice.nxv16i64 = call <vscale x 16 x i64> @llvm.vector.splice.nxv16i64(<vscale x 16 x i64> zeroinitializer, <vscale x 16 x i64> zeroinitializer, i32 -1)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 64 for instruction: %splice.nxv32i64 = call <vscale x 32 x i64> @llvm.vector.splice.nxv32i64(<vscale x 32 x i64> zeroinitializer, <vscale x 32 x i64> zeroinitializer, i32 -1)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 128 for instruction: %splice.nxv64i64 = call <vscale x 64 x i64> @llvm.vector.splice.nxv64i64(<vscale x 64 x i64> zeroinitializer, <vscale x 64 x i64> zeroinitializer, i32 -1)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %splice.nxv1bf16 = call <vscale x 1 x bfloat> @llvm.vector.splice.nxv1bf16(<vscale x 1 x bfloat> zeroinitializer, <vscale x 1 x bfloat> zeroinitializer, i32 -1)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %splice.nxv2bf16 = call <vscale x 2 x bfloat> @llvm.vector.splice.nxv2bf16(<vscale x 2 x bfloat> zeroinitializer, <vscale x 2 x bfloat> zeroinitializer, i32 -1)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %splice.nxv4bf16 = call <vscale x 4 x bfloat> @llvm.vector.splice.nxv4bf16(<vscale x 4 x bfloat> zeroinitializer, <vscale x 4 x bfloat> zeroinitializer, i32 -1)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %splice.nxv8bf16 = call <vscale x 8 x bfloat> @llvm.vector.splice.nxv8bf16(<vscale x 8 x bfloat> zeroinitializer, <vscale x 8 x bfloat> zeroinitializer, i32 -1)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %splice.nxv16bf16 = call <vscale x 16 x bfloat> @llvm.vector.splice.nxv16bf16(<vscale x 16 x bfloat> zeroinitializer, <vscale x 16 x bfloat> zeroinitializer, i32 -1)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 16 for instruction: %splice.nxv32bf16 = call <vscale x 32 x bfloat> @llvm.vector.splice.nxv32bf16(<vscale x 32 x bfloat> zeroinitializer, <vscale x 32 x bfloat> zeroinitializer, i32 -1)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 32 for instruction: %splice.nxv64bf16 = call <vscale x 64 x bfloat> @llvm.vector.splice.nxv64bf16(<vscale x 64 x bfloat> zeroinitializer, <vscale x 64 x bfloat> zeroinitializer, i32 -1)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %splice.nxv1f16 = call <vscale x 1 x half> @llvm.vector.splice.nxv1f16(<vscale x 1 x half> zeroinitializer, <vscale x 1 x half> zeroinitializer, i32 -1)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %splice.nxv2f16 = call <vscale x 2 x half> @llvm.vector.splice.nxv2f16(<vscale x 2 x half> zeroinitializer, <vscale x 2 x half> zeroinitializer, i32 -1)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %splice.nxv4f16 = call <vscale x 4 x half> @llvm.vector.splice.nxv4f16(<vscale x 4 x half> zeroinitializer, <vscale x 4 x half> zeroinitializer, i32 -1)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %splice.nxv8f16 = call <vscale x 8 x half> @llvm.vector.splice.nxv8f16(<vscale x 8 x half> zeroinitializer, <vscale x 8 x half> zeroinitializer, i32 -1)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %splice.nxv16f16 = call <vscale x 16 x half> @llvm.vector.splice.nxv16f16(<vscale x 16 x half> zeroinitializer, <vscale x 16 x half> zeroinitializer, i32 -1)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 16 for instruction: %splice.nxv32f16 = call <vscale x 32 x half> @llvm.vector.splice.nxv32f16(<vscale x 32 x half> zeroinitializer, <vscale x 32 x half> zeroinitializer, i32 -1)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 32 for instruction: %splice.nxv64f16 = call <vscale x 64 x half> @llvm.vector.splice.nxv64f16(<vscale x 64 x half> zeroinitializer, <vscale x 64 x half> zeroinitializer, i32 -1)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %splice.nxv1f32 = call <vscale x 1 x float> @llvm.vector.splice.nxv1f32(<vscale x 1 x float> zeroinitializer, <vscale x 1 x float> zeroinitializer, i32 -1)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %splice.nxv2f32 = call <vscale x 2 x float> @llvm.vector.splice.nxv2f32(<vscale x 2 x float> zeroinitializer, <vscale x 2 x float> zeroinitializer, i32 -1)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %splice.nxv4f32 = call <vscale x 4 x float> @llvm.vector.splice.nxv4f32(<vscale x 4 x float> zeroinitializer, <vscale x 4 x float> zeroinitializer, i32 -1)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %splice.nxv8f32 = call <vscale x 8 x float> @llvm.vector.splice.nxv8f32(<vscale x 8 x float> zeroinitializer, <vscale x 8 x float> zeroinitializer, i32 -1)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 16 for instruction: %splice.nxv16f32 = call <vscale x 16 x float> @llvm.vector.splice.nxv16f32(<vscale x 16 x float> zeroinitializer, <vscale x 16 x float> zeroinitializer, i32 -1)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 32 for instruction: %splice.nxv32f32 = call <vscale x 32 x float> @llvm.vector.splice.nxv32f32(<vscale x 32 x float> zeroinitializer, <vscale x 32 x float> zeroinitializer, i32 -1)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 64 for instruction: %splice.nxv64f32 = call <vscale x 64 x float> @llvm.vector.splice.nxv64f32(<vscale x 64 x float> zeroinitializer, <vscale x 64 x float> zeroinitializer, i32 -1)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %splice.nxv1f64 = call <vscale x 1 x double> @llvm.vector.splice.nxv1f64(<vscale x 1 x double> zeroinitializer, <vscale x 1 x double> zeroinitializer, i32 -1)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %splice.nxv2f64 = call <vscale x 2 x double> @llvm.vector.splice.nxv2f64(<vscale x 2 x double> zeroinitializer, <vscale x 2 x double> zeroinitializer, i32 -1)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %splice.nxv4f64 = call <vscale x 4 x double> @llvm.vector.splice.nxv4f64(<vscale x 4 x double> zeroinitializer, <vscale x 4 x double> zeroinitializer, i32 -1)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 16 for instruction: %splice.nxv8f64 = call <vscale x 8 x double> @llvm.vector.splice.nxv8f64(<vscale x 8 x double> zeroinitializer, <vscale x 8 x double> zeroinitializer, i32 -1)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 32 for instruction: %splice.nxv16f64 = call <vscale x 16 x double> @llvm.vector.splice.nxv16f64(<vscale x 16 x double> zeroinitializer, <vscale x 16 x double> zeroinitializer, i32 -1)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 64 for instruction: %splice.nxv32f64 = call <vscale x 32 x double> @llvm.vector.splice.nxv32f64(<vscale x 32 x double> zeroinitializer, <vscale x 32 x double> zeroinitializer, i32 -1)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 128 for instruction: %splice.nxv64f64 = call <vscale x 64 x double> @llvm.vector.splice.nxv64f64(<vscale x 64 x double> zeroinitializer, <vscale x 64 x double> zeroinitializer, i32 -1)
; CHECK-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret void
;
; SIZE-LABEL: 'vector_splice'
; SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %splice.nxv1i8 = call <vscale x 1 x i8> @llvm.vector.splice.nxv1i8(<vscale x 1 x i8> zeroinitializer, <vscale x 1 x i8> zeroinitializer, i32 -1)
; SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %splice.nxv2i8 = call <vscale x 2 x i8> @llvm.vector.splice.nxv2i8(<vscale x 2 x i8> zeroinitializer, <vscale x 2 x i8> zeroinitializer, i32 -1)
; SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %splice.nxv4i8 = call <vscale x 4 x i8> @llvm.vector.splice.nxv4i8(<vscale x 4 x i8> zeroinitializer, <vscale x 4 x i8> zeroinitializer, i32 -1)
; SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %splice.nxv8i8 = call <vscale x 8 x i8> @llvm.vector.splice.nxv8i8(<vscale x 8 x i8> zeroinitializer, <vscale x 8 x i8> zeroinitializer, i32 -1)
; SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %splice.nxv16i8 = call <vscale x 16 x i8> @llvm.vector.splice.nxv16i8(<vscale x 16 x i8> zeroinitializer, <vscale x 16 x i8> zeroinitializer, i32 -1)
; SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %splice.nxv32i8 = call <vscale x 32 x i8> @llvm.vector.splice.nxv32i8(<vscale x 32 x i8> zeroinitializer, <vscale x 32 x i8> zeroinitializer, i32 -1)
; SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %splice.nxv64i8 = call <vscale x 64 x i8> @llvm.vector.splice.nxv64i8(<vscale x 64 x i8> zeroinitializer, <vscale x 64 x i8> zeroinitializer, i32 -1)
; SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %splice.nxv1i16 = call <vscale x 1 x i16> @llvm.vector.splice.nxv1i16(<vscale x 1 x i16> zeroinitializer, <vscale x 1 x i16> zeroinitializer, i32 -1)
; SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %splice.nxv2i16 = call <vscale x 2 x i16> @llvm.vector.splice.nxv2i16(<vscale x 2 x i16> zeroinitializer, <vscale x 2 x i16> zeroinitializer, i32 -1)
; SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %splice.nxv4i16 = call <vscale x 4 x i16> @llvm.vector.splice.nxv4i16(<vscale x 4 x i16> zeroinitializer, <vscale x 4 x i16> zeroinitializer, i32 -1)
; SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %splice.nxv8i16 = call <vscale x 8 x i16> @llvm.vector.splice.nxv8i16(<vscale x 8 x i16> zeroinitializer, <vscale x 8 x i16> zeroinitializer, i32 -1)
; SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %splice.nxv16i16 = call <vscale x 16 x i16> @llvm.vector.splice.nxv16i16(<vscale x 16 x i16> zeroinitializer, <vscale x 16 x i16> zeroinitializer, i32 -1)
; SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %splice.nxv32i16 = call <vscale x 32 x i16> @llvm.vector.splice.nxv32i16(<vscale x 32 x i16> zeroinitializer, <vscale x 32 x i16> zeroinitializer, i32 -1)
; SIZE-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %splice.nxv64i16 = call <vscale x 64 x i16> @llvm.vector.splice.nxv64i16(<vscale x 64 x i16> zeroinitializer, <vscale x 64 x i16> zeroinitializer, i32 -1)
; SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %splice.nxv1i32 = call <vscale x 1 x i32> @llvm.vector.splice.nxv1i32(<vscale x 1 x i32> zeroinitializer, <vscale x 1 x i32> zeroinitializer, i32 -1)
; SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %splice.nxv2i32 = call <vscale x 2 x i32> @llvm.vector.splice.nxv2i32(<vscale x 2 x i32> zeroinitializer, <vscale x 2 x i32> zeroinitializer, i32 -1)
; SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %splice.nxv4i32 = call <vscale x 4 x i32> @llvm.vector.splice.nxv4i32(<vscale x 4 x i32> zeroinitializer, <vscale x 4 x i32> zeroinitializer, i32 -1)
; SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %splice.nxv8i32 = call <vscale x 8 x i32> @llvm.vector.splice.nxv8i32(<vscale x 8 x i32> zeroinitializer, <vscale x 8 x i32> zeroinitializer, i32 -1)
; SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %splice.nxv16i32 = call <vscale x 16 x i32> @llvm.vector.splice.nxv16i32(<vscale x 16 x i32> zeroinitializer, <vscale x 16 x i32> zeroinitializer, i32 -1)
; SIZE-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %splice.nxv32i32 = call <vscale x 32 x i32> @llvm.vector.splice.nxv32i32(<vscale x 32 x i32> zeroinitializer, <vscale x 32 x i32> zeroinitializer, i32 -1)
; SIZE-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %splice.nxv64i32 = call <vscale x 64 x i32> @llvm.vector.splice.nxv64i32(<vscale x 64 x i32> zeroinitializer, <vscale x 64 x i32> zeroinitializer, i32 -1)
; SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %splice.nxv1i64 = call <vscale x 1 x i64> @llvm.vector.splice.nxv1i64(<vscale x 1 x i64> zeroinitializer, <vscale x 1 x i64> zeroinitializer, i32 -1)
; SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %splice.nxv2i64 = call <vscale x 2 x i64> @llvm.vector.splice.nxv2i64(<vscale x 2 x i64> zeroinitializer, <vscale x 2 x i64> zeroinitializer, i32 -1)
; SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %splice.nxv4i64 = call <vscale x 4 x i64> @llvm.vector.splice.nxv4i64(<vscale x 4 x i64> zeroinitializer, <vscale x 4 x i64> zeroinitializer, i32 -1)
; SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %splice.nxv8i64 = call <vscale x 8 x i64> @llvm.vector.splice.nxv8i64(<vscale x 8 x i64> zeroinitializer, <vscale x 8 x i64> zeroinitializer, i32 -1)
; SIZE-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %splice.nxv16i64 = call <vscale x 16 x i64> @llvm.vector.splice.nxv16i64(<vscale x 16 x i64> zeroinitializer, <vscale x 16 x i64> zeroinitializer, i32 -1)
; SIZE-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %splice.nxv32i64 = call <vscale x 32 x i64> @llvm.vector.splice.nxv32i64(<vscale x 32 x i64> zeroinitializer, <vscale x 32 x i64> zeroinitializer, i32 -1)
; SIZE-NEXT:  Cost Model: Found an estimated cost of 16 for instruction: %splice.nxv64i64 = call <vscale x 64 x i64> @llvm.vector.splice.nxv64i64(<vscale x 64 x i64> zeroinitializer, <vscale x 64 x i64> zeroinitializer, i32 -1)
; SIZE-NEXT:  Cost Model: Invalid cost for instruction: %splice.nxv1bf16 = call <vscale x 1 x bfloat> @llvm.vector.splice.nxv1bf16(<vscale x 1 x bfloat> zeroinitializer, <vscale x 1 x bfloat> zeroinitializer, i32 -1)
; SIZE-NEXT:  Cost Model: Invalid cost for instruction: %splice.nxv2bf16 = call <vscale x 2 x bfloat> @llvm.vector.splice.nxv2bf16(<vscale x 2 x bfloat> zeroinitializer, <vscale x 2 x bfloat> zeroinitializer, i32 -1)
; SIZE-NEXT:  Cost Model: Invalid cost for instruction: %splice.nxv4bf16 = call <vscale x 4 x bfloat> @llvm.vector.splice.nxv4bf16(<vscale x 4 x bfloat> zeroinitializer, <vscale x 4 x bfloat> zeroinitializer, i32 -1)
; SIZE-NEXT:  Cost Model: Invalid cost for instruction: %splice.nxv8bf16 = call <vscale x 8 x bfloat> @llvm.vector.splice.nxv8bf16(<vscale x 8 x bfloat> zeroinitializer, <vscale x 8 x bfloat> zeroinitializer, i32 -1)
; SIZE-NEXT:  Cost Model: Invalid cost for instruction: %splice.nxv16bf16 = call <vscale x 16 x bfloat> @llvm.vector.splice.nxv16bf16(<vscale x 16 x bfloat> zeroinitializer, <vscale x 16 x bfloat> zeroinitializer, i32 -1)
; SIZE-NEXT:  Cost Model: Invalid cost for instruction: %splice.nxv32bf16 = call <vscale x 32 x bfloat> @llvm.vector.splice.nxv32bf16(<vscale x 32 x bfloat> zeroinitializer, <vscale x 32 x bfloat> zeroinitializer, i32 -1)
; SIZE-NEXT:  Cost Model: Invalid cost for instruction: %splice.nxv64bf16 = call <vscale x 64 x bfloat> @llvm.vector.splice.nxv64bf16(<vscale x 64 x bfloat> zeroinitializer, <vscale x 64 x bfloat> zeroinitializer, i32 -1)
; SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %splice.nxv1f16 = call <vscale x 1 x half> @llvm.vector.splice.nxv1f16(<vscale x 1 x half> zeroinitializer, <vscale x 1 x half> zeroinitializer, i32 -1)
; SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %splice.nxv2f16 = call <vscale x 2 x half> @llvm.vector.splice.nxv2f16(<vscale x 2 x half> zeroinitializer, <vscale x 2 x half> zeroinitializer, i32 -1)
; SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %splice.nxv4f16 = call <vscale x 4 x half> @llvm.vector.splice.nxv4f16(<vscale x 4 x half> zeroinitializer, <vscale x 4 x half> zeroinitializer, i32 -1)
; SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %splice.nxv8f16 = call <vscale x 8 x half> @llvm.vector.splice.nxv8f16(<vscale x 8 x half> zeroinitializer, <vscale x 8 x half> zeroinitializer, i32 -1)
; SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %splice.nxv16f16 = call <vscale x 16 x half> @llvm.vector.splice.nxv16f16(<vscale x 16 x half> zeroinitializer, <vscale x 16 x half> zeroinitializer, i32 -1)
; SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %splice.nxv32f16 = call <vscale x 32 x half> @llvm.vector.splice.nxv32f16(<vscale x 32 x half> zeroinitializer, <vscale x 32 x half> zeroinitializer, i32 -1)
; SIZE-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %splice.nxv64f16 = call <vscale x 64 x half> @llvm.vector.splice.nxv64f16(<vscale x 64 x half> zeroinitializer, <vscale x 64 x half> zeroinitializer, i32 -1)
; SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %splice.nxv1f32 = call <vscale x 1 x float> @llvm.vector.splice.nxv1f32(<vscale x 1 x float> zeroinitializer, <vscale x 1 x float> zeroinitializer, i32 -1)
; SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %splice.nxv2f32 = call <vscale x 2 x float> @llvm.vector.splice.nxv2f32(<vscale x 2 x float> zeroinitializer, <vscale x 2 x float> zeroinitializer, i32 -1)
; SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %splice.nxv4f32 = call <vscale x 4 x float> @llvm.vector.splice.nxv4f32(<vscale x 4 x float> zeroinitializer, <vscale x 4 x float> zeroinitializer, i32 -1)
; SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %splice.nxv8f32 = call <vscale x 8 x float> @llvm.vector.splice.nxv8f32(<vscale x 8 x float> zeroinitializer, <vscale x 8 x float> zeroinitializer, i32 -1)
; SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %splice.nxv16f32 = call <vscale x 16 x float> @llvm.vector.splice.nxv16f32(<vscale x 16 x float> zeroinitializer, <vscale x 16 x float> zeroinitializer, i32 -1)
; SIZE-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %splice.nxv32f32 = call <vscale x 32 x float> @llvm.vector.splice.nxv32f32(<vscale x 32 x float> zeroinitializer, <vscale x 32 x float> zeroinitializer, i32 -1)
; SIZE-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %splice.nxv64f32 = call <vscale x 64 x float> @llvm.vector.splice.nxv64f32(<vscale x 64 x float> zeroinitializer, <vscale x 64 x float> zeroinitializer, i32 -1)
; SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %splice.nxv1f64 = call <vscale x 1 x double> @llvm.vector.splice.nxv1f64(<vscale x 1 x double> zeroinitializer, <vscale x 1 x double> zeroinitializer, i32 -1)
; SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %splice.nxv2f64 = call <vscale x 2 x double> @llvm.vector.splice.nxv2f64(<vscale x 2 x double> zeroinitializer, <vscale x 2 x double> zeroinitializer, i32 -1)
; SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %splice.nxv4f64 = call <vscale x 4 x double> @llvm.vector.splice.nxv4f64(<vscale x 4 x double> zeroinitializer, <vscale x 4 x double> zeroinitializer, i32 -1)
; SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %splice.nxv8f64 = call <vscale x 8 x double> @llvm.vector.splice.nxv8f64(<vscale x 8 x double> zeroinitializer, <vscale x 8 x double> zeroinitializer, i32 -1)
; SIZE-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %splice.nxv16f64 = call <vscale x 16 x double> @llvm.vector.splice.nxv16f64(<vscale x 16 x double> zeroinitializer, <vscale x 16 x double> zeroinitializer, i32 -1)
; SIZE-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %splice.nxv32f64 = call <vscale x 32 x double> @llvm.vector.splice.nxv32f64(<vscale x 32 x double> zeroinitializer, <vscale x 32 x double> zeroinitializer, i32 -1)
; SIZE-NEXT:  Cost Model: Found an estimated cost of 16 for instruction: %splice.nxv64f64 = call <vscale x 64 x double> @llvm.vector.splice.nxv64f64(<vscale x 64 x double> zeroinitializer, <vscale x 64 x double> zeroinitializer, i32 -1)
; SIZE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: ret void
;
  %splice.nxv1i8 = call <vscale x 1 x i8> @llvm.vector.splice.nxv1i8(<vscale x 1 x i8> zeroinitializer, <vscale x 1 x i8> zeroinitializer, i32 -1)
  %splice.nxv2i8 = call <vscale x 2 x i8> @llvm.vector.splice.nxv2i8(<vscale x 2 x i8> zeroinitializer, <vscale x 2 x i8> zeroinitializer, i32 -1)
  %splice.nxv4i8 = call <vscale x 4 x i8> @llvm.vector.splice.nxv4i8(<vscale x 4 x i8> zeroinitializer, <vscale x 4 x i8> zeroinitializer, i32 -1)
  %splice.nxv8i8 = call <vscale x 8 x i8> @llvm.vector.splice.nxv8i8(<vscale x 8 x i8> zeroinitializer, <vscale x 8 x i8> zeroinitializer, i32 -1)
  %splice.nxv16i8 = call <vscale x 16 x i8> @llvm.vector.splice.nxv16i8(<vscale x 16 x i8> zeroinitializer, <vscale x 16 x i8> zeroinitializer, i32 -1)
  %splice.nxv32i8 = call <vscale x 32 x i8> @llvm.vector.splice.nxv32i8(<vscale x 32 x i8> zeroinitializer, <vscale x 32 x i8> zeroinitializer, i32 -1)
  %splice.nxv64i8 = call <vscale x 64 x i8> @llvm.vector.splice.nxv64i8(<vscale x 64 x i8> zeroinitializer, <vscale x 64 x i8> zeroinitializer, i32 -1)

  %splice.nxv1i16 = call <vscale x 1 x i16> @llvm.vector.splice.nxv1i16(<vscale x 1 x i16> zeroinitializer, <vscale x 1 x i16> zeroinitializer, i32 -1)
  %splice.nxv2i16 = call <vscale x 2 x i16> @llvm.vector.splice.nxv2i16(<vscale x 2 x i16> zeroinitializer, <vscale x 2 x i16> zeroinitializer, i32 -1)
  %splice.nxv4i16 = call <vscale x 4 x i16> @llvm.vector.splice.nxv4i16(<vscale x 4 x i16> zeroinitializer, <vscale x 4 x i16> zeroinitializer, i32 -1)
  %splice.nxv8i16 = call <vscale x 8 x i16> @llvm.vector.splice.nxv8i16(<vscale x 8 x i16> zeroinitializer, <vscale x 8 x i16> zeroinitializer, i32 -1)
  %splice.nxv16i16 = call <vscale x 16 x i16> @llvm.vector.splice.nxv16i16(<vscale x 16 x i16> zeroinitializer, <vscale x 16 x i16> zeroinitializer, i32 -1)
  %splice.nxv32i16 = call <vscale x 32 x i16> @llvm.vector.splice.nxv32i16(<vscale x 32 x i16> zeroinitializer, <vscale x 32 x i16> zeroinitializer, i32 -1)
  %splice.nxv64i16 = call <vscale x 64 x i16> @llvm.vector.splice.nxv64i16(<vscale x 64 x i16> zeroinitializer, <vscale x 64 x i16> zeroinitializer, i32 -1)

  %splice.nxv1i32 = call <vscale x 1 x i32> @llvm.vector.splice.nxv1i32(<vscale x 1 x i32> zeroinitializer, <vscale x 1 x i32> zeroinitializer, i32 -1)
  %splice.nxv2i32 = call <vscale x 2 x i32> @llvm.vector.splice.nxv2i32(<vscale x 2 x i32> zeroinitializer, <vscale x 2 x i32> zeroinitializer, i32 -1)
  %splice.nxv4i32 = call <vscale x 4 x i32> @llvm.vector.splice.nxv4i32(<vscale x 4 x i32> zeroinitializer, <vscale x 4 x i32> zeroinitializer, i32 -1)
  %splice.nxv8i32 = call <vscale x 8 x i32> @llvm.vector.splice.nxv8i32(<vscale x 8 x i32> zeroinitializer, <vscale x 8 x i32> zeroinitializer, i32 -1)
  %splice.nxv16i32 = call <vscale x 16 x i32> @llvm.vector.splice.nxv16i32(<vscale x 16 x i32> zeroinitializer, <vscale x 16 x i32> zeroinitializer, i32 -1)
  %splice.nxv32i32 = call <vscale x 32 x i32> @llvm.vector.splice.nxv32i32(<vscale x 32 x i32> zeroinitializer, <vscale x 32 x i32> zeroinitializer, i32 -1)
  %splice.nxv64i32 = call <vscale x 64 x i32> @llvm.vector.splice.nxv64i32(<vscale x 64 x i32> zeroinitializer, <vscale x 64 x i32> zeroinitializer, i32 -1)

  %splice.nxv1i64 = call <vscale x 1 x i64> @llvm.vector.splice.nxv1i64(<vscale x 1 x i64> zeroinitializer, <vscale x 1 x i64> zeroinitializer, i32 -1)
  %splice.nxv2i64 = call <vscale x 2 x i64> @llvm.vector.splice.nxv2i64(<vscale x 2 x i64> zeroinitializer, <vscale x 2 x i64> zeroinitializer, i32 -1)
  %splice.nxv4i64 = call <vscale x 4 x i64> @llvm.vector.splice.nxv4i64(<vscale x 4 x i64> zeroinitializer, <vscale x 4 x i64> zeroinitializer, i32 -1)
  %splice.nxv8i64 = call <vscale x 8 x i64> @llvm.vector.splice.nxv8i64(<vscale x 8 x i64> zeroinitializer, <vscale x 8 x i64> zeroinitializer, i32 -1)
  %splice.nxv16i64 = call <vscale x 16 x i64> @llvm.vector.splice.nxv16i64(<vscale x 16 x i64> zeroinitializer, <vscale x 16 x i64> zeroinitializer, i32 -1)
  %splice.nxv32i64 = call <vscale x 32 x i64> @llvm.vector.splice.nxv32i64(<vscale x 32 x i64> zeroinitializer, <vscale x 32 x i64> zeroinitializer, i32 -1)
  %splice.nxv64i64 = call <vscale x 64 x i64> @llvm.vector.splice.nxv64i64(<vscale x 64 x i64> zeroinitializer, <vscale x 64 x i64> zeroinitializer, i32 -1)

  %splice.nxv1bf16 = call <vscale x 1 x bfloat> @llvm.vector.splice.nxv1bf16(<vscale x 1 x bfloat> zeroinitializer, <vscale x 1 x bfloat> zeroinitializer, i32 -1)
  %splice.nxv2bf16 = call <vscale x 2 x bfloat> @llvm.vector.splice.nxv2bf16(<vscale x 2 x bfloat> zeroinitializer, <vscale x 2 x bfloat> zeroinitializer, i32 -1)
  %splice.nxv4bf16 = call <vscale x 4 x bfloat> @llvm.vector.splice.nxv4bf16(<vscale x 4 x bfloat> zeroinitializer, <vscale x 4 x bfloat> zeroinitializer, i32 -1)
  %splice.nxv8bf16 = call <vscale x 8 x bfloat> @llvm.vector.splice.nxv8bf16(<vscale x 8 x bfloat> zeroinitializer, <vscale x 8 x bfloat> zeroinitializer, i32 -1)
  %splice.nxv16bf16 = call <vscale x 16 x bfloat> @llvm.vector.splice.nxv16bf16(<vscale x 16 x bfloat> zeroinitializer, <vscale x 16 x bfloat> zeroinitializer, i32 -1)
  %splice.nxv32bf16 = call <vscale x 32 x bfloat> @llvm.vector.splice.nxv32bf16(<vscale x 32 x bfloat> zeroinitializer, <vscale x 32 x bfloat> zeroinitializer, i32 -1)
  %splice.nxv64bf16 = call <vscale x 64 x bfloat> @llvm.vector.splice.nxv64bf16(<vscale x 64 x bfloat> zeroinitializer, <vscale x 64 x bfloat> zeroinitializer, i32 -1)

  %splice.nxv1f16 = call <vscale x 1 x half> @llvm.vector.splice.nxv1f16(<vscale x 1 x half> zeroinitializer, <vscale x 1 x half> zeroinitializer, i32 -1)
  %splice.nxv2f16 = call <vscale x 2 x half> @llvm.vector.splice.nxv2f16(<vscale x 2 x half> zeroinitializer, <vscale x 2 x half> zeroinitializer, i32 -1)
  %splice.nxv4f16 = call <vscale x 4 x half> @llvm.vector.splice.nxv4f16(<vscale x 4 x half> zeroinitializer, <vscale x 4 x half> zeroinitializer, i32 -1)
  %splice.nxv8f16 = call <vscale x 8 x half> @llvm.vector.splice.nxv8f16(<vscale x 8 x half> zeroinitializer, <vscale x 8 x half> zeroinitializer, i32 -1)
  %splice.nxv16f16 = call <vscale x 16 x half> @llvm.vector.splice.nxv16f16(<vscale x 16 x half> zeroinitializer, <vscale x 16 x half> zeroinitializer, i32 -1)
  %splice.nxv32f16 = call <vscale x 32 x half> @llvm.vector.splice.nxv32f16(<vscale x 32 x half> zeroinitializer, <vscale x 32 x half> zeroinitializer, i32 -1)
  %splice.nxv64f16 = call <vscale x 64 x half> @llvm.vector.splice.nxv64f16(<vscale x 64 x half> zeroinitializer, <vscale x 64 x half> zeroinitializer, i32 -1)

  %splice.nxv1f32 = call <vscale x 1 x float> @llvm.vector.splice.nxv1f32(<vscale x 1 x float> zeroinitializer, <vscale x 1 x float> zeroinitializer, i32 -1)
  %splice.nxv2f32 = call <vscale x 2 x float> @llvm.vector.splice.nxv2f32(<vscale x 2 x float> zeroinitializer, <vscale x 2 x float> zeroinitializer, i32 -1)
  %splice.nxv4f32 = call <vscale x 4 x float> @llvm.vector.splice.nxv4f32(<vscale x 4 x float> zeroinitializer, <vscale x 4 x float> zeroinitializer, i32 -1)
  %splice.nxv8f32 = call <vscale x 8 x float> @llvm.vector.splice.nxv8f32(<vscale x 8 x float> zeroinitializer, <vscale x 8 x float> zeroinitializer, i32 -1)
  %splice.nxv16f32 = call <vscale x 16 x float> @llvm.vector.splice.nxv16f32(<vscale x 16 x float> zeroinitializer, <vscale x 16 x float> zeroinitializer, i32 -1)
  %splice.nxv32f32 = call <vscale x 32 x float> @llvm.vector.splice.nxv32f32(<vscale x 32 x float> zeroinitializer, <vscale x 32 x float> zeroinitializer, i32 -1)
  %splice.nxv64f32 = call <vscale x 64 x float> @llvm.vector.splice.nxv64f32(<vscale x 64 x float> zeroinitializer, <vscale x 64 x float> zeroinitializer, i32 -1)

  %splice.nxv1f64 = call <vscale x 1 x double> @llvm.vector.splice.nxv1f64(<vscale x 1 x double> zeroinitializer, <vscale x 1 x double> zeroinitializer, i32 -1)
  %splice.nxv2f64 = call <vscale x 2 x double> @llvm.vector.splice.nxv2f64(<vscale x 2 x double> zeroinitializer, <vscale x 2 x double> zeroinitializer, i32 -1)
  %splice.nxv4f64 = call <vscale x 4 x double> @llvm.vector.splice.nxv4f64(<vscale x 4 x double> zeroinitializer, <vscale x 4 x double> zeroinitializer, i32 -1)
  %splice.nxv8f64 = call <vscale x 8 x double> @llvm.vector.splice.nxv8f64(<vscale x 8 x double> zeroinitializer, <vscale x 8 x double> zeroinitializer, i32 -1)
  %splice.nxv16f64 = call <vscale x 16 x double> @llvm.vector.splice.nxv16f64(<vscale x 16 x double> zeroinitializer, <vscale x 16 x double> zeroinitializer, i32 -1)
  %splice.nxv32f64 = call <vscale x 32 x double> @llvm.vector.splice.nxv32f64(<vscale x 32 x double> zeroinitializer, <vscale x 32 x double> zeroinitializer, i32 -1)
  %splice.nxv64f64 = call <vscale x 64 x double> @llvm.vector.splice.nxv64f64(<vscale x 64 x double> zeroinitializer, <vscale x 64 x double> zeroinitializer, i32 -1)

  ret void
}
