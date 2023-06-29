import ProjectDescription

public enum Scripts {

    public static let preLint = TargetScript.pre(
        path: .relativeToRoot("../Scripts/Lint/pre-lint.sh"),
        name: "Pre-lint",
        basedOnDependencyAnalysis: false
    )
    
    public static func lint(name: String) -> TargetScript {
        .pre(
            path: .relativeToRoot("../Scripts/Lint/lint.sh"),
            arguments: "$SRCROOT",
            name: "Lint",
            inputFileListPaths: [
                "$(SRCROOT)/.build/\(name)_swiftlint.xcfilelist"
            ],
            outputPaths: [
                "$(SRCROOT)/.build/\(name)_swiftlint_static_output"
            ],
            basedOnDependencyAnalysis: true
        )
    }
}
