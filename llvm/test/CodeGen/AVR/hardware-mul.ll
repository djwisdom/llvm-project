; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py UTC_ARGS: --version 2
; RUN: llc -mattr=mul,movw < %s -mtriple=avr | FileCheck %s

; Tests lowering of multiplication to hardware instructions.

define i8 @mult8(i8 %a, i8 %b) {
; CHECK-LABEL: mult8:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    muls r22, r24
; CHECK-NEXT:    clr r1
; CHECK-NEXT:    mov r24, r0
; CHECK-NEXT:    ret
  %mul = mul i8 %b, %a
  ret i8 %mul
}

define i16 @mult16(i16 %a, i16 %b) {
; CHECK-LABEL: mult16:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    muls r22, r25
; CHECK-NEXT:    mov r25, r0
; CHECK-NEXT:    clr r1
; CHECK-NEXT:    mul r22, r24
; CHECK-NEXT:    mov r18, r0
; CHECK-NEXT:    mov r19, r1
; CHECK-NEXT:    clr r1
; CHECK-NEXT:    add r19, r25
; CHECK-NEXT:    muls r23, r24
; CHECK-NEXT:    clr r1
; CHECK-NEXT:    mov r24, r0
; CHECK-NEXT:    add r24, r19
; CHECK-NEXT:    mov r20, r24
; CHECK-NEXT:    clr r21
; CHECK-NEXT:    mov r21, r20
; CHECK-NEXT:    clr r20
; CHECK-NEXT:    mov r24, r18
; CHECK-NEXT:    clr r25
; CHECK-NEXT:    or r24, r20
; CHECK-NEXT:    or r25, r21
; CHECK-NEXT:    ret
  %mul = mul nsw i16 %b, %a
  ret i16 %mul
}
