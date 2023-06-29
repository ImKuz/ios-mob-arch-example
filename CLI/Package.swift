// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ArcCLI",
    dependencies: [
        .package(
            url: "https://github.com/apple/swift-argument-parser.git",
            from: "1.0.0"
        ),
        .package( // TODO: Remove.
            url: "https://github.com/kareman/SwiftShell",
            from: "5.1.0"
        ),
    ],
    targets: [
        .executableTarget(
            name: "arcli",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .product(name: "SwiftShell", package: "SwiftShell"),
            ],
            path: "./Sources"
        ),
    ]
)
