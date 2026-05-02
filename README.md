# swift-cpu

L3-unifier package for the CPU architecture stack. Conditional re-export router
that composes L1 `swift-cpu-primitives` (cross-platform vocabulary) with
arch-conditional L2 ISA spec packages (`swift-x86-standard`, `swift-arm-standard`).

`import CPU` to get `CPU.Atomic`, `CPU.Barrier`, `CPU.Cache`, etc. (L1
vocabulary) plus the appropriate ISA spec types (`CPU.X86.*` on x86,
`CPU.ARM.*` on ARM).

Position in the platform stack: L3 swift-cpu (Foundations / re-export router)
↑ L2 swift-x86-standard, swift-arm-standard (Standards / ISA specs)
↑ L1 swift-cpu-primitives (Primitives / cross-platform vocabulary).

Created 2026-05-02 to satisfy [PLAT-ARCH-008e] L3-unifier composition
discipline at the CPU layer (Item 5 of post-Path-X cycles).
