// swift-tools-version: 6.3.1

import PackageDescription

let package = Package(
    name: "swift-cpu",
    platforms: [
        .macOS(.v26),
        .iOS(.v26),
        .tvOS(.v26),
        .watchOS(.v26),
        .visionOS(.v26)
    ],
    products: [
        .library(
            name: "CPU",
            targets: ["CPU"]
        )
    ],
    dependencies: [
        .package(path: "../../swift-primitives/swift-cpu-primitives"),
        .package(path: "../../swift-intel/swift-x86-standard"),
        .package(path: "../../swift-arm-ltd/swift-arm-standard"),
    ],
    targets: [
        .target(
            name: "CPU",
            dependencies: [
                .product(name: "CPU Primitives", package: "swift-cpu-primitives"),
                .product(name: "X86 Standard", package: "swift-x86-standard",
                         condition: .when(platforms: [.macOS, .iOS, .tvOS, .watchOS, .linux, .windows])),
                .product(name: "ARM Standard", package: "swift-arm-standard",
                         condition: .when(platforms: [.macOS, .iOS, .tvOS, .watchOS, .linux])),
            ]
        ),
        .testTarget(
            name: "CPU Tests",
            dependencies: [
                "CPU",
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("LifetimeDependence"),
        .enableExperimentalFeature("Lifetimes"),
        .enableExperimentalFeature("SuppressedAssociatedTypes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
        .enableUpcomingFeature("LifetimeDependence"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
