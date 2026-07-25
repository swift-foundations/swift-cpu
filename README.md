# swift-cpu

![Development Status](https://img.shields.io/badge/status-active--development-blue.svg)

Conditional re-export router for the CPU architecture stack: composes cross-platform CPU vocabulary with the architecture-specific ISA spec for the build target.

`import CPU` to get the cross-platform vocabulary — `CPU.Atomic`, `CPU.Barrier`, `CPU.Cache`, and related types — plus the ISA-specific surface for the target (`CPU.X86.*` on x86, `CPU.ARM.*` on ARM).

## Installation

```swift
dependencies: [
    .package(url: "https://github.com/swift-foundations/swift-cpu.git", branch: "main")
]
```

Add the product to your target:

```swift
.target(
    name: "YourTarget",
    dependencies: [
        .product(name: "CPU", package: "swift-cpu")
    ]
)
```

## License

Apache 2.0. See [LICENSE](LICENSE.md).
