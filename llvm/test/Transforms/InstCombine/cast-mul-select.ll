; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt < %s -passes=instcombine -S | FileCheck %s
; RUN: opt -passes=debugify,instcombine -S < %s | FileCheck %s -check-prefix DBGINFO


target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32"

define i32 @mul(i32 %x, i32 %y) {
; CHECK-LABEL: @mul(
; CHECK-NEXT:    [[C:%.*]] = mul i32 [[X:%.*]], [[Y:%.*]]
; CHECK-NEXT:    [[D:%.*]] = and i32 [[C]], 255
; CHECK-NEXT:    ret i32 [[D]]
;
; DBGINFO-LABEL: @mul(
; DBGINFO-NEXT:      #dbg_value(i32 [[X:%.*]], [[META9:![0-9]+]], !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), [[META15:![0-9]+]])
; DBGINFO-NEXT:      #dbg_value(i32 [[Y:%.*]], [[META11:![0-9]+]], !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), [[META16:![0-9]+]])
; DBGINFO-NEXT:    [[C:%.*]] = mul i32 [[X]], [[Y]], !dbg [[DBG17:![0-9]+]]
; DBGINFO-NEXT:    [[D:%.*]] = and i32 [[C]], 255, !dbg [[DBG18:![0-9]+]]
; DBGINFO-NEXT:      #dbg_value(i32 [[C]], [[META12:![0-9]+]], !DIExpression(), [[DBG17]])
; DBGINFO-NEXT:      #dbg_value(i32 [[D]], [[META13:![0-9]+]], !DIExpression(), [[DBG18]])
; DBGINFO-NEXT:    ret i32 [[D]], !dbg [[DBG19:![0-9]+]]
;

; Test that when zext is evaluated in different type
; we preserve the debug information in the resulting
; instruction.

  %A = trunc i32 %x to i8
  %B = trunc i32 %y to i8
  %C = mul i8 %A, %B
  %D = zext i8 %C to i32
  ret i32 %D
}

define i32 @select1(i1 %cond, i32 %x, i32 %y, i32 %z) {
; CHECK-LABEL: @select1(
; CHECK-NEXT:    [[D:%.*]] = add i32 [[X:%.*]], [[Y:%.*]]
; CHECK-NEXT:    [[E:%.*]] = select i1 [[COND:%.*]], i32 [[Z:%.*]], i32 [[D]]
; CHECK-NEXT:    [[F:%.*]] = and i32 [[E]], 255
; CHECK-NEXT:    ret i32 [[F]]
;
; DBGINFO-LABEL: @select1(
; DBGINFO-NEXT:      #dbg_value(i32 [[X:%.*]], [[META22:![0-9]+]], !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), [[META28:![0-9]+]])
; DBGINFO-NEXT:      #dbg_value(i32 [[Y:%.*]], [[META23:![0-9]+]], !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), [[META29:![0-9]+]])
; DBGINFO-NEXT:      #dbg_value(i32 [[Z:%.*]], [[META24:![0-9]+]], !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), [[META30:![0-9]+]])
; DBGINFO-NEXT:    [[D:%.*]] = add i32 [[X]], [[Y]], !dbg [[DBG31:![0-9]+]]
; DBGINFO-NEXT:      #dbg_value(!DIArgList(i32 [[X]], i32 [[Y]]), [[META25:![0-9]+]], !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_plus, DW_OP_stack_value), [[DBG31]])
; DBGINFO-NEXT:    [[E:%.*]] = select i1 [[COND:%.*]], i32 [[Z]], i32 [[D]], !dbg [[DBG32:![0-9]+]]
; DBGINFO-NEXT:    [[F:%.*]] = and i32 [[E]], 255, !dbg [[DBG33:![0-9]+]]
; DBGINFO-NEXT:      #dbg_value(i32 [[E]], [[META26:![0-9]+]], !DIExpression(), [[DBG32]])
; DBGINFO-NEXT:      #dbg_value(i32 [[F]], [[META27:![0-9]+]], !DIExpression(), [[DBG33]])
; DBGINFO-NEXT:    ret i32 [[F]], !dbg [[DBG34:![0-9]+]]
;
  %A = trunc i32 %x to i8
  %B = trunc i32 %y to i8
  %C = trunc i32 %z to i8
  %D = add i8 %A, %B
  %E = select i1 %cond, i8 %C, i8 %D
  %F = zext i8 %E to i32
  ret i32 %F
}

define i8 @select2(i1 %cond, i8 %x, i8 %y, i8 %z) {
; CHECK-LABEL: @select2(
; CHECK-NEXT:    [[D:%.*]] = add i8 [[X:%.*]], [[Y:%.*]]
; CHECK-NEXT:    [[E:%.*]] = select i1 [[COND:%.*]], i8 [[Z:%.*]], i8 [[D]]
; CHECK-NEXT:    ret i8 [[E]]
;
; DBGINFO-LABEL: @select2(
; DBGINFO-NEXT:      #dbg_value(i8 [[X:%.*]], [[META37:![0-9]+]], !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value), [[META43:![0-9]+]])
; DBGINFO-NEXT:      #dbg_value(i8 [[Y:%.*]], [[META38:![0-9]+]], !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value), [[META44:![0-9]+]])
; DBGINFO-NEXT:      #dbg_value(i8 [[Z:%.*]], [[META39:![0-9]+]], !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value), [[META45:![0-9]+]])
; DBGINFO-NEXT:    [[D:%.*]] = add i8 [[X]], [[Y]], !dbg [[DBG46:![0-9]+]]
; DBGINFO-NEXT:      #dbg_value(!DIArgList(i8 [[X]], i8 [[Y]]), [[META40:![0-9]+]], !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_plus, DW_OP_stack_value), [[DBG46]])
; DBGINFO-NEXT:      #dbg_value(i32 poison, [[META41:![0-9]+]], !DIExpression(), [[META47:![0-9]+]])
; DBGINFO-NEXT:    [[F:%.*]] = select i1 [[COND:%.*]], i8 [[Z]], i8 [[D]], !dbg [[META47]]
; DBGINFO-NEXT:      #dbg_value(i8 [[F]], [[META42:![0-9]+]], !DIExpression(), [[META48:![0-9]+]])
; DBGINFO-NEXT:    ret i8 [[F]], !dbg [[DBG49:![0-9]+]]
;
  %A = zext i8 %x to i32
  %B = zext i8 %y to i32
  %C = zext i8 %z to i32
  %D = add i32 %A, %B
  %E = select i1 %cond, i32 %C, i32 %D
  %F = trunc i32 %E to i8
  ret i8 %F
}

; The next 3 tests could be handled in instcombine, but evaluating values
; with multiple uses may be very slow. Let some other pass deal with it.

define i32 @eval_trunc_multi_use_in_one_inst(i32 %x) {
; CHECK-LABEL: @eval_trunc_multi_use_in_one_inst(
; CHECK-NEXT:    [[Z:%.*]] = zext i32 [[X:%.*]] to i64
; CHECK-NEXT:    [[A:%.*]] = add nuw nsw i64 [[Z]], 15
; CHECK-NEXT:    [[M:%.*]] = mul i64 [[A]], [[A]]
; CHECK-NEXT:    [[T:%.*]] = trunc i64 [[M]] to i32
; CHECK-NEXT:    ret i32 [[T]]
;
; DBGINFO-LABEL: @eval_trunc_multi_use_in_one_inst(
; DBGINFO-NEXT:    [[Z:%.*]] = zext i32 [[X:%.*]] to i64, !dbg [[DBG57:![0-9]+]]
; DBGINFO-NEXT:      #dbg_value(i64 [[Z]], [[META52:![0-9]+]], !DIExpression(), [[DBG57]])
; DBGINFO-NEXT:    [[A:%.*]] = add nuw nsw i64 [[Z]], 15, !dbg [[DBG58:![0-9]+]]
; DBGINFO-NEXT:      #dbg_value(i64 [[A]], [[META54:![0-9]+]], !DIExpression(), [[DBG58]])
; DBGINFO-NEXT:    [[M:%.*]] = mul i64 [[A]], [[A]], !dbg [[DBG59:![0-9]+]]
; DBGINFO-NEXT:      #dbg_value(i64 [[M]], [[META55:![0-9]+]], !DIExpression(), [[DBG59]])
; DBGINFO-NEXT:    [[T:%.*]] = trunc i64 [[M]] to i32, !dbg [[DBG60:![0-9]+]]
; DBGINFO-NEXT:      #dbg_value(i32 [[T]], [[META56:![0-9]+]], !DIExpression(), [[DBG60]])
; DBGINFO-NEXT:    ret i32 [[T]], !dbg [[DBG61:![0-9]+]]
;
  %z = zext i32 %x to i64
  %a = add nsw nuw i64 %z, 15
  %m = mul i64 %a, %a
  %t = trunc i64 %m to i32
  ret i32 %t
}

define i32 @eval_zext_multi_use_in_one_inst(i32 %x) {
; CHECK-LABEL: @eval_zext_multi_use_in_one_inst(
; CHECK-NEXT:    [[T:%.*]] = trunc i32 [[X:%.*]] to i16
; CHECK-NEXT:    [[A:%.*]] = and i16 [[T]], 5
; CHECK-NEXT:    [[M:%.*]] = mul nuw nsw i16 [[A]], [[A]]
; CHECK-NEXT:    [[R:%.*]] = zext nneg i16 [[M]] to i32
; CHECK-NEXT:    ret i32 [[R]]
;
; DBGINFO-LABEL: @eval_zext_multi_use_in_one_inst(
; DBGINFO-NEXT:    [[T:%.*]] = trunc i32 [[X:%.*]] to i16, !dbg [[DBG69:![0-9]+]]
; DBGINFO-NEXT:      #dbg_value(i16 [[T]], [[META64:![0-9]+]], !DIExpression(), [[DBG69]])
; DBGINFO-NEXT:    [[A:%.*]] = and i16 [[T]], 5, !dbg [[DBG70:![0-9]+]]
; DBGINFO-NEXT:      #dbg_value(i16 [[A]], [[META66:![0-9]+]], !DIExpression(), [[DBG70]])
; DBGINFO-NEXT:    [[M:%.*]] = mul nuw nsw i16 [[A]], [[A]], !dbg [[DBG71:![0-9]+]]
; DBGINFO-NEXT:      #dbg_value(i16 [[M]], [[META67:![0-9]+]], !DIExpression(), [[DBG71]])
; DBGINFO-NEXT:    [[R:%.*]] = zext nneg i16 [[M]] to i32, !dbg [[DBG72:![0-9]+]]
; DBGINFO-NEXT:      #dbg_value(i32 [[R]], [[META68:![0-9]+]], !DIExpression(), [[DBG72]])
; DBGINFO-NEXT:    ret i32 [[R]], !dbg [[DBG73:![0-9]+]]
;
  %t = trunc i32 %x to i16
  %a = and i16 %t, 5
  %m = mul nuw nsw i16 %a, %a
  %r = zext i16 %m to i32
  ret i32 %r
}

define i32 @eval_sext_multi_use_in_one_inst(i32 %x) {
; CHECK-LABEL: @eval_sext_multi_use_in_one_inst(
; CHECK-NEXT:    [[T:%.*]] = trunc i32 [[X:%.*]] to i16
; CHECK-NEXT:    [[A:%.*]] = and i16 [[T]], 14
; CHECK-NEXT:    [[M:%.*]] = mul nuw nsw i16 [[A]], [[A]]
; CHECK-NEXT:    [[O:%.*]] = or disjoint i16 [[M]], -32768
; CHECK-NEXT:    [[R:%.*]] = sext i16 [[O]] to i32
; CHECK-NEXT:    ret i32 [[R]]
;
; DBGINFO-LABEL: @eval_sext_multi_use_in_one_inst(
; DBGINFO-NEXT:    [[T:%.*]] = trunc i32 [[X:%.*]] to i16, !dbg [[DBG81:![0-9]+]]
; DBGINFO-NEXT:      #dbg_value(i16 [[T]], [[META76:![0-9]+]], !DIExpression(), [[DBG81]])
; DBGINFO-NEXT:    [[A:%.*]] = and i16 [[T]], 14, !dbg [[DBG82:![0-9]+]]
; DBGINFO-NEXT:      #dbg_value(i16 [[A]], [[META77:![0-9]+]], !DIExpression(), [[DBG82]])
; DBGINFO-NEXT:    [[M:%.*]] = mul nuw nsw i16 [[A]], [[A]], !dbg [[DBG83:![0-9]+]]
; DBGINFO-NEXT:      #dbg_value(i16 [[M]], [[META78:![0-9]+]], !DIExpression(), [[DBG83]])
; DBGINFO-NEXT:    [[O:%.*]] = or disjoint i16 [[M]], -32768, !dbg [[DBG84:![0-9]+]]
; DBGINFO-NEXT:      #dbg_value(i16 [[O]], [[META79:![0-9]+]], !DIExpression(), [[DBG84]])
; DBGINFO-NEXT:    [[R:%.*]] = sext i16 [[O]] to i32, !dbg [[DBG85:![0-9]+]]
; DBGINFO-NEXT:      #dbg_value(i32 [[R]], [[META80:![0-9]+]], !DIExpression(), [[DBG85]])
; DBGINFO-NEXT:    ret i32 [[R]], !dbg [[DBG86:![0-9]+]]
;
  %t = trunc i32 %x to i16
  %a = and i16 %t, 14
  %m = mul nuw nsw i16 %a, %a
  %o = or i16 %m, 32768
  %r = sext i16 %o to i32
  ret i32 %r
}

; If we have a transform to shrink the above 3 cases, make sure it's not
; also trying to look through multiple uses in this test and crashing.

define void @PR36225(i32 %a, i32 %b, i1 %c1, i3 %v1, i3 %v2) {
; CHECK-LABEL: @PR36225(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    br label [[WHILE_BODY:%.*]]
; CHECK:       while.body:
; CHECK-NEXT:    br i1 [[C1:%.*]], label [[FOR_BODY3_US:%.*]], label [[FOR_BODY3:%.*]]
; CHECK:       for.body3.us:
; CHECK-NEXT:    [[TOBOOL:%.*]] = icmp eq i32 [[B:%.*]], 0
; CHECK-NEXT:    [[SPEC_SELECT:%.*]] = select i1 [[TOBOOL]], i8 0, i8 4
; CHECK-NEXT:    switch i3 [[V1:%.*]], label [[EXIT:%.*]] [
; CHECK-NEXT:      i3 0, label [[FOR_END:%.*]]
; CHECK-NEXT:      i3 -1, label [[FOR_END]]
; CHECK-NEXT:    ]
; CHECK:       for.body3:
; CHECK-NEXT:    switch i3 [[V2:%.*]], label [[EXIT]] [
; CHECK-NEXT:      i3 0, label [[FOR_END]]
; CHECK-NEXT:      i3 -1, label [[FOR_END]]
; CHECK-NEXT:    ]
; CHECK:       for.end:
; CHECK-NEXT:    [[H:%.*]] = phi i8 [ [[SPEC_SELECT]], [[FOR_BODY3_US]] ], [ [[SPEC_SELECT]], [[FOR_BODY3_US]] ], [ 0, [[FOR_BODY3]] ], [ 0, [[FOR_BODY3]] ]
; CHECK-NEXT:    [[CONV:%.*]] = zext nneg i8 [[H]] to i32
; CHECK-NEXT:    [[CMP:%.*]] = icmp sgt i32 [[A:%.*]], [[CONV]]
; CHECK-NEXT:    br i1 [[CMP]], label [[EXIT]], label [[EXIT2:%.*]]
; CHECK:       exit2:
; CHECK-NEXT:    unreachable
; CHECK:       exit:
; CHECK-NEXT:    unreachable
;
; DBGINFO-LABEL: @PR36225(
; DBGINFO-NEXT:  entry:
; DBGINFO-NEXT:    br label [[WHILE_BODY:%.*]], !dbg [[DBG94:![0-9]+]]
; DBGINFO:       while.body:
; DBGINFO-NEXT:      #dbg_value(i32 [[B:%.*]], [[META89:![0-9]+]], !DIExpression(DW_OP_lit0, DW_OP_eq, DW_OP_stack_value), [[META95:![0-9]+]])
; DBGINFO-NEXT:    br i1 [[C1:%.*]], label [[FOR_BODY3_US:%.*]], label [[FOR_BODY3:%.*]], !dbg [[DBG96:![0-9]+]]
; DBGINFO:       for.body3.us:
; DBGINFO-NEXT:    [[TOBOOL:%.*]] = icmp eq i32 [[B]], 0, !dbg [[META95]]
; DBGINFO-NEXT:      #dbg_value(i1 [[TOBOOL]], [[META89]], !DIExpression(), [[META95]])
; DBGINFO-NEXT:    [[SPEC_SELECT:%.*]] = select i1 [[TOBOOL]], i8 0, i8 4, !dbg [[DBG97:![0-9]+]]
; DBGINFO-NEXT:      #dbg_value(i8 [[SPEC_SELECT]], [[META90:![0-9]+]], !DIExpression(), [[DBG97]])
; DBGINFO-NEXT:    switch i3 [[V1:%.*]], label [[EXIT:%.*]] [
; DBGINFO-NEXT:      i3 0, label [[FOR_END:%.*]]
; DBGINFO-NEXT:      i3 -1, label [[FOR_END]]
; DBGINFO-NEXT:    ], !dbg [[DBG98:![0-9]+]]
; DBGINFO:       for.body3:
; DBGINFO-NEXT:    switch i3 [[V2:%.*]], label [[EXIT]] [
; DBGINFO-NEXT:      i3 0, label [[FOR_END]]
; DBGINFO-NEXT:      i3 -1, label [[FOR_END]]
; DBGINFO-NEXT:    ], !dbg [[DBG99:![0-9]+]]
; DBGINFO:       for.end:
; DBGINFO-NEXT:    [[H:%.*]] = phi i8 [ [[SPEC_SELECT]], [[FOR_BODY3_US]] ], [ [[SPEC_SELECT]], [[FOR_BODY3_US]] ], [ 0, [[FOR_BODY3]] ], [ 0, [[FOR_BODY3]] ], !dbg [[DBG100:![0-9]+]]
; DBGINFO-NEXT:      #dbg_value(i8 [[H]], [[META91:![0-9]+]], !DIExpression(), [[DBG100]])
; DBGINFO-NEXT:    [[CONV:%.*]] = zext nneg i8 [[H]] to i32, !dbg [[DBG101:![0-9]+]]
; DBGINFO-NEXT:      #dbg_value(i32 [[CONV]], [[META92:![0-9]+]], !DIExpression(), [[DBG101]])
; DBGINFO-NEXT:    [[CMP:%.*]] = icmp sgt i32 [[A:%.*]], [[CONV]], !dbg [[DBG102:![0-9]+]]
; DBGINFO-NEXT:      #dbg_value(i1 [[CMP]], [[META93:![0-9]+]], !DIExpression(), [[DBG102]])
; DBGINFO-NEXT:    br i1 [[CMP]], label [[EXIT]], label [[EXIT2:%.*]], !dbg [[DBG103:![0-9]+]]
; DBGINFO:       exit2:
; DBGINFO-NEXT:    unreachable, !dbg [[DBG104:![0-9]+]]
; DBGINFO:       exit:
; DBGINFO-NEXT:    unreachable, !dbg [[DBG105:![0-9]+]]
;
entry:
  br label %while.body

while.body:
  %tobool = icmp eq i32 %b, 0
  br i1 %c1, label %for.body3.us, label %for.body3

for.body3.us:
  %spec.select = select i1 %tobool, i8 0, i8 4
  switch i3 %v1, label %exit [
  i3 0, label %for.end
  i3 -1, label %for.end
  ]

for.body3:
  switch i3 %v2, label %exit [
  i3 0, label %for.end
  i3 -1, label %for.end
  ]

for.end:
  %h = phi i8 [ %spec.select, %for.body3.us ], [ %spec.select, %for.body3.us ], [ 0, %for.body3 ], [ 0, %for.body3 ]
  %conv = sext i8 %h to i32
  %cmp = icmp sgt i32 %a, %conv
  br i1 %cmp, label %exit, label %exit2

exit2:
  unreachable

exit:
  unreachable
}

; Check that we don't drop debug info when a zext is removed.
define i1 @foo(i1 zeroext %b) {
; CHECK-LABEL: @foo(
; CHECK-NEXT:    ret i1 [[B:%.*]]
;
; DBGINFO-LABEL: @foo(
; DBGINFO-NEXT:      #dbg_value(i1 [[B:%.*]], [[META108:![0-9]+]], !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), [[META109:![0-9]+]])
; DBGINFO-NEXT:    ret i1 [[B]], !dbg [[DBG110:![0-9]+]]
;

  %frombool = zext i1 %b to i8
  ret i1 %b
}
