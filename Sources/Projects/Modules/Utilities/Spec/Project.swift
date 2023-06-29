import ProjectDescription
import ProjectDescriptionHelpers

// sourcery: path="/Modules/Utilities"
enum Spec: ModuleDescription {

    static let name = "Spec"

    static let targets = [
        Target.framework(
            name: name,
            sources: "Sources/**",
            dependencies: [],
            resources: [
                "Resources/*.xcassets",
            ]
        )
    ]
}

let project = Project(
    name: Spec.name,
    targets: Spec.targets,
    resourceSynthesizers: [
        .assets()
    ]
)
