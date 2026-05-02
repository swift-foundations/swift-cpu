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

// MARK: - CPU namespace marker
//
// The `CPU` namespace itself is declared at L1 (`swift-cpu-primitives`),
// not here. This file exists as a structural marker for the swift-cpu
// L3-unifier package — its L3-policy role is purely conditional
// re-export routing (see exports.swift). No L3-level types are added at
// this layer.
//
// Future additions per memory `project_cpu_isa_three_layer_split.md`
// (runtime CPU feature detection, ISA dispatch composition) are deferred
// to a separate envelope; Item 5's scope is the [PLAT-ARCH-008e] violation
// fix at swift-kernel only.
