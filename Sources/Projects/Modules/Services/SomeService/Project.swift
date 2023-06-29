import ProjectDescription
import ProjectDescriptionHelpers

// sourcery: path="/Modules/Services"
enum SomeService: ModuleDescription {
    static let name = "SomeService"

    static let targets = [
        Target.framework(
            name: "SomeService",
            dependencies: [
                .module(.DI),
            ]
        )
    ]
}

let project = Project(
    name: SomeService.name,
    targets: SomeService.targets
)
