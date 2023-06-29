import ProjectDescription
import ProjectDescriptionHelpers

// sourcery: path="/Screens/Home"
enum HomeScreen: ModuleDescription {
    static let name = "HomeScreen"

    static let targets = [
        Target.framework(
            name: name,
            dependencies: [
                .module(.DI),
                .module(.FeatureSupport),
                .module(.HomeScreenInterface),
            ]
        )
    ]
}

let project = Project(
    name: HomeScreen.name,
    targets: HomeScreen.targets
)
