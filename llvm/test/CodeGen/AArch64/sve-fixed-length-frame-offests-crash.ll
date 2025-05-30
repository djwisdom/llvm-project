; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s | FileCheck %s

target triple = "aarch64-unknown-linux-gnu"

; Ensure we don't crash by trying to fold fixed length frame indexes into
; loads/stores that don't support an appropriate addressing mode, hence creating
; too many extra vregs during frame lowering, when we don't have an emergency
; spill slot.

define dso_local void @func1(ptr %v1, ptr %v2, ptr %v3, ptr %v4, ptr %v5, ptr %v6, ptr %v7, ptr %v8,
; CHECK-LABEL: func1:
; CHECK:       // %bb.0:
; CHECK-NEXT:    str x29, [sp, #-48]! // 8-byte Folded Spill
; CHECK-NEXT:    stp x22, x21, [sp, #16] // 16-byte Folded Spill
; CHECK-NEXT:    stp x20, x19, [sp, #32] // 16-byte Folded Spill
; CHECK-NEXT:    .cfi_def_cfa_offset 48
; CHECK-NEXT:    .cfi_offset w19, -8
; CHECK-NEXT:    .cfi_offset w20, -16
; CHECK-NEXT:    .cfi_offset w21, -24
; CHECK-NEXT:    .cfi_offset w22, -32
; CHECK-NEXT:    .cfi_offset w29, -48
; CHECK-NEXT:    add x10, sp, #176
; CHECK-NEXT:    add x8, sp, #48
; CHECK-NEXT:    add x9, sp, #144
; CHECK-NEXT:    ldr z3, [x10]
; CHECK-NEXT:    ldr z0, [x8]
; CHECK-NEXT:    add x8, sp, #112
; CHECK-NEXT:    ldr z2, [x9]
; CHECK-NEXT:    ldr z1, [x8]
; CHECK-NEXT:    add x20, sp, #176
; CHECK-NEXT:    ldp x9, x8, [sp, #328]
; CHECK-NEXT:    ldr x15, [sp, #104]
; CHECK-NEXT:    ldp x11, x10, [sp, #312]
; CHECK-NEXT:    ldur q4, [sp, #88]
; CHECK-NEXT:    ldp x13, x12, [sp, #296]
; CHECK-NEXT:    ldr x19, [sp, #272]
; CHECK-NEXT:    ldp x18, x14, [sp, #280]
; CHECK-NEXT:    ldp x16, x17, [sp, #208]
; CHECK-NEXT:    ldp x21, x22, [sp, #352]
; CHECK-NEXT:    str z3, [x20]
; CHECK-NEXT:    add x20, sp, #144
; CHECK-NEXT:    str z2, [x20]
; CHECK-NEXT:    add x20, sp, #112
; CHECK-NEXT:    str z1, [x20]
; CHECK-NEXT:    add x20, sp, #48
; CHECK-NEXT:    str z0, [x20]
; CHECK-NEXT:    stp x21, x22, [sp, #352]
; CHECK-NEXT:    ldp x22, x21, [sp, #16] // 16-byte Folded Reload
; CHECK-NEXT:    stp x19, x18, [sp, #272]
; CHECK-NEXT:    ldp x20, x19, [sp, #32] // 16-byte Folded Reload
; CHECK-NEXT:    stp x16, x17, [sp, #208]
; CHECK-NEXT:    stur q4, [sp, #88]
; CHECK-NEXT:    str x15, [sp, #104]
; CHECK-NEXT:    stp x14, x13, [sp, #288]
; CHECK-NEXT:    stp x12, x11, [sp, #304]
; CHECK-NEXT:    stp x10, x9, [sp, #320]
; CHECK-NEXT:    str x8, [sp, #336]
; CHECK-NEXT:    ldr x29, [sp], #48 // 8-byte Folded Reload
; CHECK-NEXT:    b func2
                             ptr %v9, ptr %v10, ptr %v11, ptr %v12, ptr %v13, ptr %v14,  ptr %v15, ptr %v16,
                             ptr %v17, ptr %v18, ptr %v19, ptr %v20, ptr %v21, ptr %v22, ptr %v23, ptr %v24,
                             ptr %v25, ptr %v26, ptr %v27, ptr %v28, ptr %v29, ptr %v30, ptr %v31, ptr %v32,
                             ptr %v33, ptr %v34, ptr %v35, ptr %v36, ptr %v37, ptr %v38, ptr %v39, ptr %v40,
                             ptr %v41, ptr %v42, ptr %v43, ptr %v44, ptr %v45, ptr %v46, ptr %v47, ptr %v48,
                             i64 %v49) #0 {
  tail call void @func2(ptr %v1, ptr %v2, ptr %v3, ptr %v4, ptr %v5, ptr %v6, ptr %v7, ptr %v8,
                        ptr %v9, ptr %v10, ptr %v11, ptr %v12, ptr undef, ptr %v14, ptr %v15, ptr %v16,
                        ptr %v17, ptr %v18, ptr %v19, ptr %v20, ptr %v21, ptr %v22, ptr %v23, ptr %v24,
                        ptr %v25, ptr %v26, ptr %v27, ptr %v28, ptr %v29, ptr %v30, ptr undef, ptr undef,
                        ptr undef, ptr undef, ptr undef, ptr undef, ptr %v37, ptr %v38, ptr %v39, ptr %v40,
                        ptr %v41, ptr %v42, ptr %v43, ptr %v44, ptr %v45, ptr undef, ptr %v47, ptr %v48,
                        i64 undef)
  ret void
}

declare dso_local void @func2(ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr,
                              ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr,
                              ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr,
                              ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr,
                              ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr,
                              ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr,
                              i64)

attributes #0 = { "target-features"="+sve" vscale_range(2,2) }
