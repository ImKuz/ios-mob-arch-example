import ProjectDescription
import ProjectDescriptionHelpers

// sourcery: path="/Modules/Utilities"
enum FeatureSupport: ModuleDescription {
    static let name = "FeatureSupport"

    static let targets = [
        Target.framework(
            name: "FeatureSupport",
            dependencies: [
                .external(name: "ComposableArchitecture"),
            ]
        )
    ]
}

let project = Project(
    name: FeatureSupport.name,
    targets: FeatureSupport.targets
)
