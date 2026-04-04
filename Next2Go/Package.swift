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
        .package(url: "https://github.com/hmlongco/Factory", .upToNextMajor(from: "2.5.3"))
    ],
    targets: [
        .target(
            name: "Model"
        ),
        .target(
            name: "ViewModel",
            dependencies: [
                "Model"
            ]
        ),
        .target(
            name: "Services",
            dependencies: [
                "Model"
            ]
        ),
        .target(
            name: "Next2GoUI",
            dependencies: [
                "ViewModel",
                .product(name: "Factory", package: "Factory")
            ]
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
                "Services"
            ]
        )
    ],
    swiftLanguageModes: [.v6]
)
