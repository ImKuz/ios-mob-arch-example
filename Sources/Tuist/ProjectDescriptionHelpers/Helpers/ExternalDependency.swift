import ProjectDescription

public struct ExternalDependency {

    public let name: String
    public let url: String
    public let requirments: Package.Requirement

    public init(
        name: String,
        url: String,
        requirments: Package.Requirement
    ) {
        self.name = name
        self.url = url
        self.requirments = requirments
    }
}

public extension SwiftPackageManagerDependencies {

    static func from(_ list: [ExternalDependency]) -> Self {
        var packages = [ProjectDescription.Package]()
        var productTypes = [String: ProjectDescription.Product]()

        for dependency in list {
            packages.append(
                .package(
                    url: dependency.url,
                    dependency.requirments
                )
            )

            productTypes[dependency.name] = .framework
        }

        return .init(packages, productTypes: productTypes)
    }
}
