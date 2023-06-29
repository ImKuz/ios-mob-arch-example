import ProjectDescription
import ProjectDescriptionHelpers

let dependencies = Dependencies(
    swiftPackageManager: .from(dependencyList),
    platforms: [.iOS]
)

