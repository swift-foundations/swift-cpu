// ===----------------------------------------------------------------------===//
//
// This source file is part of the swift-cpu open source project
//
// Copyright (c) 2024-2026 Coen ten Thije Boonkkamp and the swift-cpu project authors
// Licensed under Apache License v2.0
//
// See LICENSE.md for license information
//
// ===----------------------------------------------------------------------===//

// MARK: - CPU L3 unifier — conditional re-export router
//
// swift-cpu is the L3-policy package for the CPU architecture stack
// (Item 5 of post-Path-X cycles, 2026-05-02). Per [PLAT-ARCH-008e],
// the L3-unifier (swift-kernel) MUST compose only over its peer
// L3-policy tier; reaching directly into L2 spec packages is forbidden.
//
// Pre-Item-5 violation: swift-kernel/Sources/Kernel Core/exports.swift
// directly imported X86_Standard + ARM_Standard (L2 ISA spec modules).
// This file (the swift-cpu L3-policy unifier) hosts the conditional
// re-export logic so that swift-kernel imports `CPU` (L3-policy) and
// the arch dispatch happens here, preserving composition discipline.
//
// The CPU stack is structurally simpler than the descriptor stack:
// the L1 `CPU` namespace is cross-platform, and L2 ISA modules
// (`X86_Standard`, `ARM_Standard`) extend L1 `CPU` directly with
// arch-specific sub-namespaces (`CPU.X86`, `CPU.ARM`). No typealias
// chain is needed — only conditional re-exports.

@_exported public import CPU_Primitives

#if arch(x86_64) || arch(i386)
    @_exported public import X86_Standard
#elseif arch(arm64) || arch(arm)
    @_exported public import ARM_Standard
#endif
