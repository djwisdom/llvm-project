; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py UTC_ARGS: --version 5
; RUN: llc < %s -mtriple=nvptx64 -mcpu=sm_100a -mattr=+ptx86| FileCheck --check-prefixes=CHECK-PTX64 %s
; RUN: llc < %s -mtriple=nvptx64 -mcpu=sm_100a -mattr=+ptx86 --nvptx-short-ptr| FileCheck --check-prefixes=CHECK-PTX-SHARED32 %s
; RUN: %if ptxas-12.8 %{ llc < %s -mtriple=nvptx64 -mcpu=sm_100a -mattr=+ptx86| %ptxas-verify -arch=sm_100a %}
; RUN: %if ptxas-12.8 %{ llc < %s -mtriple=nvptx64 -mcpu=sm_100a -mattr=+ptx86 --nvptx-short-ptr| %ptxas-verify -arch=sm_100a %}

target triple = "nvptx64-nvidia-cuda"

declare void @llvm.nvvm.cp.async.bulk.tensor.prefetch.im2col.w.3d(ptr %tm, i32 %d0, i32 %d1, i32 %d2, i16 %wHalo, i16 %wOffset, i64 %ch, i1 %f1);
declare void @llvm.nvvm.cp.async.bulk.tensor.prefetch.im2col.w.4d(ptr %tm, i32 %d0, i32 %d1, i32 %d2, i32 %d3, i16 %wHalo, i16 %wOffset, i64 %ch, i1 %f1);
declare void @llvm.nvvm.cp.async.bulk.tensor.prefetch.im2col.w.5d(ptr %tm, i32 %d0, i32 %d1, i32 %d2, i32 %d3, i32 %d4, i16 %wHalo, i16 %wOffset, i64 %ch, i1 %f1);
declare void @llvm.nvvm.cp.async.bulk.tensor.prefetch.im2col.w.128.3d(ptr %tm, i32 %d0, i32 %d1, i32 %d2, i16 %wHalo, i16 %wOffset, i64 %ch, i1 %f1);
declare void @llvm.nvvm.cp.async.bulk.tensor.prefetch.im2col.w.128.4d(ptr %tm, i32 %d0, i32 %d1, i32 %d2, i32 %d3, i16 %wHalo, i16 %wOffset, i64 %ch, i1 %f1);
declare void @llvm.nvvm.cp.async.bulk.tensor.prefetch.im2col.w.128.5d(ptr %tm, i32 %d0, i32 %d1, i32 %d2, i32 %d3, i32 %d4, i16 %wHalo, i16 %wOffset, i64 %ch, i1 %f1);
declare void @llvm.nvvm.cp.async.bulk.tensor.prefetch.tile.gather4.2d(ptr %tm, i32 %d0, i32 %d1, i32 %d2, i32 %d3, i32 %d4, i64 %ch, i1 %f1);

define void @test_cp_async_bulk_tensor_prefetch_3d(i32 %flag, ptr %tmap, i32 %d0, i32 %d1, i32 %d2, i16 %wHalo, i16 %wOffset, i64 %ch) {
; CHECK-PTX64-LABEL: test_cp_async_bulk_tensor_prefetch_3d(
; CHECK-PTX64:       {
; CHECK-PTX64-NEXT:    .reg .b16 %rs<3>;
; CHECK-PTX64-NEXT:    .reg .b32 %r<4>;
; CHECK-PTX64-NEXT:    .reg .b64 %rd<3>;
; CHECK-PTX64-EMPTY:
; CHECK-PTX64-NEXT:  // %bb.0:
; CHECK-PTX64-NEXT:    ld.param.b64 %rd1, [test_cp_async_bulk_tensor_prefetch_3d_param_1];
; CHECK-PTX64-NEXT:    ld.param.b32 %r1, [test_cp_async_bulk_tensor_prefetch_3d_param_2];
; CHECK-PTX64-NEXT:    ld.param.b32 %r2, [test_cp_async_bulk_tensor_prefetch_3d_param_3];
; CHECK-PTX64-NEXT:    ld.param.b32 %r3, [test_cp_async_bulk_tensor_prefetch_3d_param_4];
; CHECK-PTX64-NEXT:    ld.param.b16 %rs1, [test_cp_async_bulk_tensor_prefetch_3d_param_5];
; CHECK-PTX64-NEXT:    ld.param.b16 %rs2, [test_cp_async_bulk_tensor_prefetch_3d_param_6];
; CHECK-PTX64-NEXT:    ld.param.b64 %rd2, [test_cp_async_bulk_tensor_prefetch_3d_param_7];
; CHECK-PTX64-NEXT:    cp.async.bulk.prefetch.tensor.3d.L2.global.im2col::w [%rd1, {%r1, %r2, %r3}], {%rs1, %rs2};
; CHECK-PTX64-NEXT:    cp.async.bulk.prefetch.tensor.3d.L2.global.im2col::w.L2::cache_hint [%rd1, {%r1, %r2, %r3}], {%rs1, %rs2}, %rd2;
; CHECK-PTX64-NEXT:    cp.async.bulk.prefetch.tensor.3d.L2.global.im2col::w::128 [%rd1, {%r1, %r2, %r3}], {%rs1, %rs2};
; CHECK-PTX64-NEXT:    cp.async.bulk.prefetch.tensor.3d.L2.global.im2col::w::128.L2::cache_hint [%rd1, {%r1, %r2, %r3}], {%rs1, %rs2}, %rd2;
; CHECK-PTX64-NEXT:    ret;
;
; CHECK-PTX-SHARED32-LABEL: test_cp_async_bulk_tensor_prefetch_3d(
; CHECK-PTX-SHARED32:       {
; CHECK-PTX-SHARED32-NEXT:    .reg .b16 %rs<3>;
; CHECK-PTX-SHARED32-NEXT:    .reg .b32 %r<4>;
; CHECK-PTX-SHARED32-NEXT:    .reg .b64 %rd<3>;
; CHECK-PTX-SHARED32-EMPTY:
; CHECK-PTX-SHARED32-NEXT:  // %bb.0:
; CHECK-PTX-SHARED32-NEXT:    ld.param.b64 %rd1, [test_cp_async_bulk_tensor_prefetch_3d_param_1];
; CHECK-PTX-SHARED32-NEXT:    ld.param.b32 %r1, [test_cp_async_bulk_tensor_prefetch_3d_param_2];
; CHECK-PTX-SHARED32-NEXT:    ld.param.b32 %r2, [test_cp_async_bulk_tensor_prefetch_3d_param_3];
; CHECK-PTX-SHARED32-NEXT:    ld.param.b32 %r3, [test_cp_async_bulk_tensor_prefetch_3d_param_4];
; CHECK-PTX-SHARED32-NEXT:    ld.param.b16 %rs1, [test_cp_async_bulk_tensor_prefetch_3d_param_5];
; CHECK-PTX-SHARED32-NEXT:    ld.param.b16 %rs2, [test_cp_async_bulk_tensor_prefetch_3d_param_6];
; CHECK-PTX-SHARED32-NEXT:    ld.param.b64 %rd2, [test_cp_async_bulk_tensor_prefetch_3d_param_7];
; CHECK-PTX-SHARED32-NEXT:    cp.async.bulk.prefetch.tensor.3d.L2.global.im2col::w [%rd1, {%r1, %r2, %r3}], {%rs1, %rs2};
; CHECK-PTX-SHARED32-NEXT:    cp.async.bulk.prefetch.tensor.3d.L2.global.im2col::w.L2::cache_hint [%rd1, {%r1, %r2, %r3}], {%rs1, %rs2}, %rd2;
; CHECK-PTX-SHARED32-NEXT:    cp.async.bulk.prefetch.tensor.3d.L2.global.im2col::w::128 [%rd1, {%r1, %r2, %r3}], {%rs1, %rs2};
; CHECK-PTX-SHARED32-NEXT:    cp.async.bulk.prefetch.tensor.3d.L2.global.im2col::w::128.L2::cache_hint [%rd1, {%r1, %r2, %r3}], {%rs1, %rs2}, %rd2;
; CHECK-PTX-SHARED32-NEXT:    ret;
  tail call void @llvm.nvvm.cp.async.bulk.tensor.prefetch.im2col.w.3d(ptr %tmap, i32 %d0, i32 %d1, i32 %d2, i16 %wHalo, i16 %wOffset, i64 %ch, i1 0)
  tail call void @llvm.nvvm.cp.async.bulk.tensor.prefetch.im2col.w.3d(ptr %tmap, i32 %d0, i32 %d1, i32 %d2, i16 %wHalo, i16 %wOffset, i64 %ch, i1 1)

  tail call void @llvm.nvvm.cp.async.bulk.tensor.prefetch.im2col.w.128.3d(ptr %tmap, i32 %d0, i32 %d1, i32 %d2, i16 %wHalo, i16 %wOffset, i64 %ch, i1 0)
  tail call void @llvm.nvvm.cp.async.bulk.tensor.prefetch.im2col.w.128.3d(ptr %tmap, i32 %d0, i32 %d1, i32 %d2, i16 %wHalo, i16 %wOffset, i64 %ch, i1 1)
  ret void
}

define void @test_cp_async_bulk_tensor_prefetch_4d(i32 %flag, ptr %tmap, i32 %d0, i32 %d1, i32 %d2, i32 %d3, i16 %wHalo, i16 %wOffset, i64 %ch) {
; CHECK-PTX64-LABEL: test_cp_async_bulk_tensor_prefetch_4d(
; CHECK-PTX64:       {
; CHECK-PTX64-NEXT:    .reg .b16 %rs<3>;
; CHECK-PTX64-NEXT:    .reg .b32 %r<5>;
; CHECK-PTX64-NEXT:    .reg .b64 %rd<3>;
; CHECK-PTX64-EMPTY:
; CHECK-PTX64-NEXT:  // %bb.0:
; CHECK-PTX64-NEXT:    ld.param.b64 %rd1, [test_cp_async_bulk_tensor_prefetch_4d_param_1];
; CHECK-PTX64-NEXT:    ld.param.b32 %r1, [test_cp_async_bulk_tensor_prefetch_4d_param_2];
; CHECK-PTX64-NEXT:    ld.param.b32 %r2, [test_cp_async_bulk_tensor_prefetch_4d_param_3];
; CHECK-PTX64-NEXT:    ld.param.b32 %r3, [test_cp_async_bulk_tensor_prefetch_4d_param_4];
; CHECK-PTX64-NEXT:    ld.param.b32 %r4, [test_cp_async_bulk_tensor_prefetch_4d_param_5];
; CHECK-PTX64-NEXT:    ld.param.b16 %rs1, [test_cp_async_bulk_tensor_prefetch_4d_param_6];
; CHECK-PTX64-NEXT:    ld.param.b16 %rs2, [test_cp_async_bulk_tensor_prefetch_4d_param_7];
; CHECK-PTX64-NEXT:    ld.param.b64 %rd2, [test_cp_async_bulk_tensor_prefetch_4d_param_8];
; CHECK-PTX64-NEXT:    cp.async.bulk.prefetch.tensor.4d.L2.global.im2col::w [%rd1, {%r1, %r2, %r3, %r4}], {%rs1, %rs2};
; CHECK-PTX64-NEXT:    cp.async.bulk.prefetch.tensor.4d.L2.global.im2col::w.L2::cache_hint [%rd1, {%r1, %r2, %r3, %r4}], {%rs1, %rs2}, %rd2;
; CHECK-PTX64-NEXT:    cp.async.bulk.prefetch.tensor.4d.L2.global.im2col::w::128 [%rd1, {%r1, %r2, %r3, %r4}], {%rs1, %rs2};
; CHECK-PTX64-NEXT:    cp.async.bulk.prefetch.tensor.4d.L2.global.im2col::w::128.L2::cache_hint [%rd1, {%r1, %r2, %r3, %r4}], {%rs1, %rs2}, %rd2;
; CHECK-PTX64-NEXT:    ret;
;
; CHECK-PTX-SHARED32-LABEL: test_cp_async_bulk_tensor_prefetch_4d(
; CHECK-PTX-SHARED32:       {
; CHECK-PTX-SHARED32-NEXT:    .reg .b16 %rs<3>;
; CHECK-PTX-SHARED32-NEXT:    .reg .b32 %r<5>;
; CHECK-PTX-SHARED32-NEXT:    .reg .b64 %rd<3>;
; CHECK-PTX-SHARED32-EMPTY:
; CHECK-PTX-SHARED32-NEXT:  // %bb.0:
; CHECK-PTX-SHARED32-NEXT:    ld.param.b64 %rd1, [test_cp_async_bulk_tensor_prefetch_4d_param_1];
; CHECK-PTX-SHARED32-NEXT:    ld.param.b32 %r1, [test_cp_async_bulk_tensor_prefetch_4d_param_2];
; CHECK-PTX-SHARED32-NEXT:    ld.param.b32 %r2, [test_cp_async_bulk_tensor_prefetch_4d_param_3];
; CHECK-PTX-SHARED32-NEXT:    ld.param.b32 %r3, [test_cp_async_bulk_tensor_prefetch_4d_param_4];
; CHECK-PTX-SHARED32-NEXT:    ld.param.b32 %r4, [test_cp_async_bulk_tensor_prefetch_4d_param_5];
; CHECK-PTX-SHARED32-NEXT:    ld.param.b16 %rs1, [test_cp_async_bulk_tensor_prefetch_4d_param_6];
; CHECK-PTX-SHARED32-NEXT:    ld.param.b16 %rs2, [test_cp_async_bulk_tensor_prefetch_4d_param_7];
; CHECK-PTX-SHARED32-NEXT:    ld.param.b64 %rd2, [test_cp_async_bulk_tensor_prefetch_4d_param_8];
; CHECK-PTX-SHARED32-NEXT:    cp.async.bulk.prefetch.tensor.4d.L2.global.im2col::w [%rd1, {%r1, %r2, %r3, %r4}], {%rs1, %rs2};
; CHECK-PTX-SHARED32-NEXT:    cp.async.bulk.prefetch.tensor.4d.L2.global.im2col::w.L2::cache_hint [%rd1, {%r1, %r2, %r3, %r4}], {%rs1, %rs2}, %rd2;
; CHECK-PTX-SHARED32-NEXT:    cp.async.bulk.prefetch.tensor.4d.L2.global.im2col::w::128 [%rd1, {%r1, %r2, %r3, %r4}], {%rs1, %rs2};
; CHECK-PTX-SHARED32-NEXT:    cp.async.bulk.prefetch.tensor.4d.L2.global.im2col::w::128.L2::cache_hint [%rd1, {%r1, %r2, %r3, %r4}], {%rs1, %rs2}, %rd2;
; CHECK-PTX-SHARED32-NEXT:    ret;
  tail call void @llvm.nvvm.cp.async.bulk.tensor.prefetch.im2col.w.4d(ptr %tmap, i32 %d0, i32 %d1, i32 %d2, i32 %d3, i16 %wHalo, i16 %wOffset, i64 %ch, i1 0)
  tail call void @llvm.nvvm.cp.async.bulk.tensor.prefetch.im2col.w.4d(ptr %tmap, i32 %d0, i32 %d1, i32 %d2, i32 %d3, i16 %wHalo, i16 %wOffset, i64 %ch, i1 1)

  tail call void @llvm.nvvm.cp.async.bulk.tensor.prefetch.im2col.w.128.4d(ptr %tmap, i32 %d0, i32 %d1, i32 %d2, i32 %d3, i16 %wHalo, i16 %wOffset, i64 %ch, i1 0)
  tail call void @llvm.nvvm.cp.async.bulk.tensor.prefetch.im2col.w.128.4d(ptr %tmap, i32 %d0, i32 %d1, i32 %d2, i32 %d3, i16 %wHalo, i16 %wOffset, i64 %ch, i1 1)
  ret void
}

define void @test_cp_async_bulk_tensor_prefetch_5d(i32 %flag, ptr %tmap, i32 %d0, i32 %d1, i32 %d2, i32 %d3, i32 %d4, i16 %wHalo, i16 %wOffset, i64 %ch) {
; CHECK-PTX64-LABEL: test_cp_async_bulk_tensor_prefetch_5d(
; CHECK-PTX64:       {
; CHECK-PTX64-NEXT:    .reg .b16 %rs<3>;
; CHECK-PTX64-NEXT:    .reg .b32 %r<6>;
; CHECK-PTX64-NEXT:    .reg .b64 %rd<3>;
; CHECK-PTX64-EMPTY:
; CHECK-PTX64-NEXT:  // %bb.0:
; CHECK-PTX64-NEXT:    ld.param.b64 %rd1, [test_cp_async_bulk_tensor_prefetch_5d_param_1];
; CHECK-PTX64-NEXT:    ld.param.b32 %r1, [test_cp_async_bulk_tensor_prefetch_5d_param_2];
; CHECK-PTX64-NEXT:    ld.param.b32 %r2, [test_cp_async_bulk_tensor_prefetch_5d_param_3];
; CHECK-PTX64-NEXT:    ld.param.b32 %r3, [test_cp_async_bulk_tensor_prefetch_5d_param_4];
; CHECK-PTX64-NEXT:    ld.param.b32 %r4, [test_cp_async_bulk_tensor_prefetch_5d_param_5];
; CHECK-PTX64-NEXT:    ld.param.b32 %r5, [test_cp_async_bulk_tensor_prefetch_5d_param_6];
; CHECK-PTX64-NEXT:    ld.param.b16 %rs1, [test_cp_async_bulk_tensor_prefetch_5d_param_7];
; CHECK-PTX64-NEXT:    ld.param.b16 %rs2, [test_cp_async_bulk_tensor_prefetch_5d_param_8];
; CHECK-PTX64-NEXT:    ld.param.b64 %rd2, [test_cp_async_bulk_tensor_prefetch_5d_param_9];
; CHECK-PTX64-NEXT:    cp.async.bulk.prefetch.tensor.5d.L2.global.im2col::w [%rd1, {%r1, %r2, %r3, %r4, %r5}], {%rs1, %rs2};
; CHECK-PTX64-NEXT:    cp.async.bulk.prefetch.tensor.5d.L2.global.im2col::w.L2::cache_hint [%rd1, {%r1, %r2, %r3, %r4, %r5}], {%rs1, %rs2}, %rd2;
; CHECK-PTX64-NEXT:    cp.async.bulk.prefetch.tensor.5d.L2.global.im2col::w::128 [%rd1, {%r1, %r2, %r3, %r4, %r5}], {%rs1, %rs2};
; CHECK-PTX64-NEXT:    cp.async.bulk.prefetch.tensor.5d.L2.global.im2col::w::128.L2::cache_hint [%rd1, {%r1, %r2, %r3, %r4, %r5}], {%rs1, %rs2}, %rd2;
; CHECK-PTX64-NEXT:    ret;
;
; CHECK-PTX-SHARED32-LABEL: test_cp_async_bulk_tensor_prefetch_5d(
; CHECK-PTX-SHARED32:       {
; CHECK-PTX-SHARED32-NEXT:    .reg .b16 %rs<3>;
; CHECK-PTX-SHARED32-NEXT:    .reg .b32 %r<6>;
; CHECK-PTX-SHARED32-NEXT:    .reg .b64 %rd<3>;
; CHECK-PTX-SHARED32-EMPTY:
; CHECK-PTX-SHARED32-NEXT:  // %bb.0:
; CHECK-PTX-SHARED32-NEXT:    ld.param.b64 %rd1, [test_cp_async_bulk_tensor_prefetch_5d_param_1];
; CHECK-PTX-SHARED32-NEXT:    ld.param.b32 %r1, [test_cp_async_bulk_tensor_prefetch_5d_param_2];
; CHECK-PTX-SHARED32-NEXT:    ld.param.b32 %r2, [test_cp_async_bulk_tensor_prefetch_5d_param_3];
; CHECK-PTX-SHARED32-NEXT:    ld.param.b32 %r3, [test_cp_async_bulk_tensor_prefetch_5d_param_4];
; CHECK-PTX-SHARED32-NEXT:    ld.param.b32 %r4, [test_cp_async_bulk_tensor_prefetch_5d_param_5];
; CHECK-PTX-SHARED32-NEXT:    ld.param.b32 %r5, [test_cp_async_bulk_tensor_prefetch_5d_param_6];
; CHECK-PTX-SHARED32-NEXT:    ld.param.b16 %rs1, [test_cp_async_bulk_tensor_prefetch_5d_param_7];
; CHECK-PTX-SHARED32-NEXT:    ld.param.b16 %rs2, [test_cp_async_bulk_tensor_prefetch_5d_param_8];
; CHECK-PTX-SHARED32-NEXT:    ld.param.b64 %rd2, [test_cp_async_bulk_tensor_prefetch_5d_param_9];
; CHECK-PTX-SHARED32-NEXT:    cp.async.bulk.prefetch.tensor.5d.L2.global.im2col::w [%rd1, {%r1, %r2, %r3, %r4, %r5}], {%rs1, %rs2};
; CHECK-PTX-SHARED32-NEXT:    cp.async.bulk.prefetch.tensor.5d.L2.global.im2col::w.L2::cache_hint [%rd1, {%r1, %r2, %r3, %r4, %r5}], {%rs1, %rs2}, %rd2;
; CHECK-PTX-SHARED32-NEXT:    cp.async.bulk.prefetch.tensor.5d.L2.global.im2col::w::128 [%rd1, {%r1, %r2, %r3, %r4, %r5}], {%rs1, %rs2};
; CHECK-PTX-SHARED32-NEXT:    cp.async.bulk.prefetch.tensor.5d.L2.global.im2col::w::128.L2::cache_hint [%rd1, {%r1, %r2, %r3, %r4, %r5}], {%rs1, %rs2}, %rd2;
; CHECK-PTX-SHARED32-NEXT:    ret;
  tail call void @llvm.nvvm.cp.async.bulk.tensor.prefetch.im2col.w.5d(ptr %tmap, i32 %d0, i32 %d1, i32 %d2, i32 %d3, i32 %d4, i16 %wHalo, i16 %wOffset, i64 %ch, i1 0)
  tail call void @llvm.nvvm.cp.async.bulk.tensor.prefetch.im2col.w.5d(ptr %tmap, i32 %d0, i32 %d1, i32 %d2, i32 %d3, i32 %d4, i16 %wHalo, i16 %wOffset, i64 %ch, i1 1)

  tail call void @llvm.nvvm.cp.async.bulk.tensor.prefetch.im2col.w.128.5d(ptr %tmap, i32 %d0, i32 %d1, i32 %d2, i32 %d3, i32 %d4, i16 %wHalo, i16 %wOffset, i64 %ch, i1 0)
  tail call void @llvm.nvvm.cp.async.bulk.tensor.prefetch.im2col.w.128.5d(ptr %tmap, i32 %d0, i32 %d1, i32 %d2, i32 %d3, i32 %d4, i16 %wHalo, i16 %wOffset, i64 %ch, i1 1)
  ret void
}

define void @test_cp_async_bulk_tensor_prefetch_tile_gather4_2d(ptr %tmap, i32 %d0, i32 %d1, i32 %d2, i32 %d3, i32 %d4, i64 %ch) {
  tail call void @llvm.nvvm.cp.async.bulk.tensor.prefetch.tile.gather4.2d(ptr %tmap, i32 %d0, i32 %d1, i32 %d2, i32 %d3, i32 %d4, i64 %ch, i1 0)
  tail call void @llvm.nvvm.cp.async.bulk.tensor.prefetch.tile.gather4.2d(ptr %tmap, i32 %d0, i32 %d1, i32 %d2, i32 %d3, i32 %d4, i64 %ch, i1 1)
  ret void
}
