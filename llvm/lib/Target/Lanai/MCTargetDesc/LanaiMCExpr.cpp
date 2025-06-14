//===-- LanaiMCExpr.cpp - Lanai specific MC expression classes ------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#include "LanaiMCExpr.h"
#include "llvm/MC/MCAssembler.h"
#include "llvm/MC/MCContext.h"
#include "llvm/MC/MCStreamer.h"
using namespace llvm;

#define DEBUG_TYPE "lanaimcexpr"

const LanaiMCExpr *LanaiMCExpr::create(Spec S, const MCExpr *Expr,
                                       MCContext &Ctx) {
  return new (Ctx) LanaiMCExpr(Expr, S);
}

void LanaiMCExpr::printImpl(raw_ostream &OS, const MCAsmInfo *MAI) const {
  if (specifier == VK_Lanai_None) {
    Expr->print(OS, MAI);
    return;
  }

  switch (specifier) {
  default:
    llvm_unreachable("Invalid kind!");
  case VK_Lanai_ABS_HI:
    OS << "hi";
    break;
  case VK_Lanai_ABS_LO:
    OS << "lo";
    break;
  }

  OS << '(';
  const MCExpr *Expr = getSubExpr();
  Expr->print(OS, MAI);
  OS << ')';
}
