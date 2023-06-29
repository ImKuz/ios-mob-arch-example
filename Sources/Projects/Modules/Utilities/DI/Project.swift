import ProjectDescription
import ProjectDescriptionHelpers

// sourcery: path="/Modules/Utilities"
enum DI: ModuleDescription {

    static let name = "DI"

    static let targets = [
        Target.framework(
            name: name,
            dependencies: [
                .external(name: "Swinject"),
            ]
        )
    ]
}

let project = Project(
    name: DI.name,
    targets: DI.targets
)
