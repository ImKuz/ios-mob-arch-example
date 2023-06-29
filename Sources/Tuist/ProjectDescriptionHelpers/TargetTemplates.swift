import ProjectDescription

public extension Target {

    enum Constants {
        public static let defaultSources: ProjectDescription.SourceFilesList = [ "Sources/**" ]
    }

    static func app(
        projectName: String,
        targetName: String,
        dependencies: [ProjectDescription.TargetDependency]
    ) -> Target {
        Target(
            name: targetName,
            platform: .iOS,
            product: .app,
            bundleId: bundleID(with: "app"),
            deploymentTarget: .iOS(
                targetVersion: GlobalConstants.targetVersion,
                devices: .iphone
            ),
            infoPlist: .extendingDefault(with: infoPlistExtension),
            sources: [ "Sources/**" ],
            scripts: [
                Scripts.preLint,
                Scripts.lint(name: "App")
            ],
            dependencies: dependencies
        )
    }

    static func framework(
        name: String,
        sources: ProjectDescription.SourceFilesList = Constants.defaultSources,
        dependencies: [ProjectDescription.TargetDependency] = [],
        resources: ProjectDescription.ResourceFileElements? = []
    ) -> Target {
        Target(
            name: name,
            platform: .iOS,
            product: .framework,
            bundleId: bundleID(with: name + ".framework"),
            deploymentTarget: .iOS(
                targetVersion: GlobalConstants.targetVersion,
                devices: .iphone
            ),
            sources: sources,
            resources: resources,
            scripts: [
                Scripts.preLint,
                Scripts.lint(name: name)
            ],
            dependencies: dependencies
        )
    }
}

// MARK: - Helpers

public func bundleID(with addition: String) -> String {
    (GlobalConstants.packageNamePrefix + addition).lowercased()
}
