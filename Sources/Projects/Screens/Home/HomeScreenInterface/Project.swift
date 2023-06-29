import ProjectDescription
import ProjectDescriptionHelpers

// sourcery: path="/Screens/Home"
enum HomeScreenInterface: ModuleDescription {
    static let name = "HomeScreenInterface"

    static let targets = [
        Target.framework(
            name: name,
            dependencies: [
                .module(.FeatureSupport),
            ]
        )
    ]
}

let project = Project(
    name: HomeScreenInterface.name,
    targets: HomeScreenInterface.targets
)
