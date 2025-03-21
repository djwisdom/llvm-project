//===-------- Tasking.cpp - NVPTX OpenMP tasks support ------------ C++ -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// Task implementation support.
//
// TODO: We should not allocate and execute the task in two steps. A new API is
//       needed for that though.
//
//===----------------------------------------------------------------------===//

#include "DeviceTypes.h"
#include "DeviceUtils.h"
#include "Interface.h"
#include "State.h"

using namespace ompx;

extern "C" {

TaskDescriptorTy *__kmpc_omp_task_alloc(IdentTy *, int32_t, int32_t,
                                        size_t TaskSizeInclPrivateValues,
                                        size_t SharedValuesSize,
                                        TaskFnTy TaskFn) {
  auto TaskSizeInclPrivateValuesPadded =
      utils::roundUp(TaskSizeInclPrivateValues, sizeof(void *));
  auto TaskSizeTotal = TaskSizeInclPrivateValuesPadded + SharedValuesSize;
  TaskDescriptorTy *TaskDescriptor = (TaskDescriptorTy *)memory::allocGlobal(
      TaskSizeTotal, "explicit task descriptor");
  TaskDescriptor->Payload =
      utils::advancePtr(TaskDescriptor, TaskSizeInclPrivateValuesPadded);
  TaskDescriptor->TaskFn = TaskFn;

  return TaskDescriptor;
}

int32_t __kmpc_omp_task(IdentTy *Loc, uint32_t TId,
                        TaskDescriptorTy *TaskDescriptor) {
  return __kmpc_omp_task_with_deps(Loc, TId, TaskDescriptor, 0, 0, 0, 0);
}

int32_t __kmpc_omp_task_with_deps(IdentTy *Loc, uint32_t TId,
                                  TaskDescriptorTy *TaskDescriptor, int32_t,
                                  void *, int32_t, void *) {
  state::DateEnvironmentRAII DERAII(Loc);

  TaskDescriptor->TaskFn(0, TaskDescriptor);

  memory::freeGlobal(TaskDescriptor, "explicit task descriptor");
  return 0;
}

void __kmpc_omp_task_begin_if0(IdentTy *Loc, uint32_t TId,
                               TaskDescriptorTy *TaskDescriptor) {
  state::enterDataEnvironment(Loc);
}

void __kmpc_omp_task_complete_if0(IdentTy *Loc, uint32_t TId,
                                  TaskDescriptorTy *TaskDescriptor) {
  state::exitDataEnvironment();

  memory::freeGlobal(TaskDescriptor, "explicit task descriptor");
}

void __kmpc_omp_wait_deps(IdentTy *Loc, uint32_t TId, int32_t, void *, int32_t,
                          void *) {}

void __kmpc_taskgroup(IdentTy *Loc, uint32_t TId) {}

void __kmpc_end_taskgroup(IdentTy *Loc, uint32_t TId) {}

int32_t __kmpc_omp_taskyield(IdentTy *Loc, uint32_t TId, int) { return 0; }

int32_t __kmpc_omp_taskwait(IdentTy *Loc, uint32_t TId) { return 0; }

void __kmpc_taskloop(IdentTy *Loc, uint32_t TId,
                     TaskDescriptorTy *TaskDescriptor, int,
                     uint64_t *LowerBound, uint64_t *UpperBound, int64_t, int,
                     int32_t, uint64_t, void *) {
  // Skip task entirely if empty iteration space.
  if (*LowerBound > *UpperBound)
    return;

  // The compiler has already stored lb and ub in the TaskDescriptorTy structure
  // as we are using a single task to execute the entire loop, we can leave
  // the initial task_t untouched
  __kmpc_omp_task_with_deps(Loc, TId, TaskDescriptor, 0, 0, 0, 0);
}

int omp_in_final(void) {
  // treat all tasks as final... Specs may expect runtime to keep
  // track more precisely if a task was actively set by users... This
  // is not explicitly specified; will treat as if runtime can
  // actively decide to put a non-final task into a final one.
  return 1;
}

int omp_get_max_task_priority(void) { return 0; }
}
