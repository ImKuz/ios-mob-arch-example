import ProjectDescription
import ProjectDescriptionHelpers

// sourcery: path="/Screens/Foo"
enum FooScreen: ModuleDescription {
    static let name = "FooScreen"

    static let targets = [
        Target.framework(
            name: name,
            dependencies: [
                .module(.DI),
                .module(.FeatureSupport),
                .module(.FooScreenInterface),
            ]
        )
    ]
}

let project = Project(
    name: FooScreen.name,
    targets: FooScreen.targets
)
