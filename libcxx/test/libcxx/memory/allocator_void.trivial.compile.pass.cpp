//===----------------------------------------------------------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

// Make sure that std::allocator<void> is trivial. This was the case before C++20
// with the std::allocator<void> explicit specialization, and this test makes sure
// that we maintain that property across all standards.
//
// This is important since triviality has implications on how the type is passed
// as a function argument in the ABI.

#include <memory>
#include <type_traits>

typedef std::allocator<void> A1;
struct A2 : std::allocator<void> { };

static_assert(std::is_trivially_default_constructible<A1>::value, "");
static_assert(std::is_trivially_copyable<A1>::value, "");

static_assert(std::is_trivially_default_constructible<A2>::value, "");
static_assert(std::is_trivially_copyable<A2>::value, "");
