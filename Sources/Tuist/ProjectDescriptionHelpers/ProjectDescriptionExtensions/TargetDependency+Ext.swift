import ProjectDescription

// This extension describes project dependencies helpers
public extension ProjectDescription.TargetDependency {

    static func module(_ name: ModuleName) -> Self {
        project(
            path: name.path,
            name: name.rawValue
        )
    }

    static func project(
        target: String? = nil,
        path: String,
        name: String
    ) -> Self {
        .project(
            target: target ?? name,
            path: .relativeToRoot("Projects\(path)/\(name)")
        )
    }
}
