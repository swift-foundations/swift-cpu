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

import Testing
import CPU

@Suite("CPU sanity")
struct CPUSanityTests {

    // MARK: - L1 cross-platform vocabulary visible

    @Test
    func `CPU.Atomic vocabulary visible`() {
        // Compile-time assertion: CPU.Atomic.Load.Ordering type is reachable
        // via the `import CPU` umbrella (transitively re-exports CPU_Primitives).
        let _: CPU.Atomic.Load.Ordering.Type = CPU.Atomic.Load.Ordering.self
    }

    @Test
    func `CPU.Cache.Padded vocabulary visible`() {
        // Cross-platform cache-line padding type from L1 CPU primitives.
        let _: CPU.Cache.Padded<Int>.Type = CPU.Cache.Padded<Int>.self
    }

    // MARK: - L2 ISA spec arch-conditional visibility

    #if arch(x86_64) || arch(i386)
    @Test
    func `CPU.X86 ISA spec visible on x86`() {
        // Compile-time assertion: arch-conditional re-export resolves
        // X86_Standard's L2 extension types under CPU.X86 on x86.
        let _: CPU.X86.Identification.Leaf.Type = CPU.X86.Identification.Leaf.self
    }
    #elseif arch(arm64) || arch(arm)
    @Test
    func `CPU.ARM ISA spec visible on ARM`() {
        // Compile-time assertion: arch-conditional re-export resolves
        // ARM_Standard's L2 extension types under CPU.ARM on ARM.
        let _: CPU.ARM.Counter.Frequency.Type = CPU.ARM.Counter.Frequency.self
    }
    #endif
}
