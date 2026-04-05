// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Next2Go",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v26),
        .macOS(.v26)
    ],
    products: [
        .library(name: "Next2Go", targets: ["Next2GoUI"])
    ],
    dependencies: [
        // I'm usually not easily taking dependencies onboard.
        // This one is used to save some dev time and demonstrate dependency-injectable notion of services
        // This is far from ideal, but closest one I found to what I wanted
        .package(url: "https://github.com/hmlongco/Factory", .upToNextMajor(from: "2.5.3")),

        // This is to have typed SFSymbols identifiers instead of freeform text ones
        .package(url: "https://github.com/SFSafeSymbols/SFSafeSymbols", .upToNextMajor(from: "7.0.0"))
    ],
    targets: [
        .target(
            name: "Model"
        ),
        .target(
            name: "ViewModel",
            dependencies: [
                "Model",
                "Services",
                .product(name: "Factory", package: "Factory"),
                .product(name: "SFSafeSymbols", package: "SFSafeSymbols")
            ]
        ),
        .target(
            name: "Services",
            dependencies: [
                "Model",
                .product(name: "Factory", package: "Factory")
            ]
        ),
        .target(
            name: "Next2GoUI",
            dependencies: [
                "ViewModel",
                .product(name: "SFSafeSymbols", package: "SFSafeSymbols")
            ],
            path: "Sources/Next2GoUI"
        ),
        .testTarget(
            name: "ModelTests",
            dependencies: ["Model"],
            resources: [
                .process("Resources")
            ]
        ),
        .testTarget(
            name: "ViewModelTests",
            dependencies: [
                "ViewModel"
            ]
        ),
        .testTarget(
            name: "ServicesTests",
            dependencies: [
                "Services",
                .product(name: "Factory", package: "Factory")
            ]
        )
    ],
    swiftLanguageModes: [.v6]
)
