import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "AppAssembler",
    targets: [
        .framework(
            name: "AppAssembler",
            dependencies: AppAssemblerDependencies.list + [
                .module(.DI),
            ]
        )
    ]
)

struct AppAssemblerDependencies: AppAssemblerDependenciesGenerated {

// sourcery:inline:auto:AppAssemblerDependencies.DependencyList
    static var list: [TargetDependency] = [
        .module(.FooScreen),
        .module(.HomeScreen),
        .module(.SomeService),
    ]
// sourcery:end
}
