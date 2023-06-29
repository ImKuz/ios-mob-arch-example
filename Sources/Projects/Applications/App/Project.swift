import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "App",
    targets: [
        .app(
            projectName: "App",
            targetName: "ArchExample",
            dependencies: [
                .project(path: "/Applications", name: "AppAssembler"),
                .module(.DI),
                .module(.FeatureSupport),
            ]
        )
    ]
)
