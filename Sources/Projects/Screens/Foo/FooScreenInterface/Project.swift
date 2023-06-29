import ProjectDescription
import ProjectDescriptionHelpers

// sourcery: path="/Screens/Foo"
enum FooScreenInterface: ModuleDescription {
    static let name = "FooScreenInterface"

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
    name: FooScreenInterface.name,
    targets: FooScreenInterface.targets
)
