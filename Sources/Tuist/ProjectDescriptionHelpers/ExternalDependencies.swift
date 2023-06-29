import ProjectDescription

public let dependencyList: [ExternalDependency] = [
    .init(
        name: "Swinject",
        url: "https://github.com/Swinject/Swinject",
        requirments: .upToNextMinor(from: "2.8.3")
    ),
    .init(
        name: "ComposableArchitecture",
        url: "https://github.com/pointfreeco/swift-composable-architecture",
        requirments: .upToNextMinor(from: "0.52.0")
    ),
]
