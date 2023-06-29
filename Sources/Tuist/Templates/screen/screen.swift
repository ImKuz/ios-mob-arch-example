import ProjectDescription

/// e.g --name Settings -> SettingsScreen
fileprivate let name: Template.Attribute = .required("name")
fileprivate let mpath: Template.Attribute = .optional("mpath", default: "")

fileprivate let basePath = "Projects/Screens\(mpath)/\(name)Screen"

let screen = Template(
    description: "Screen module template",
    attributes: [
        name, mpath
    ], items: [
        .file(
            path: "\(basePath)/Project.swift",
            templatePath: "screen-project.stencil"
        ),
        .file(
            path: "\(basePath)/Sources/\(name)Assembly.swift",
            templatePath: "screen-assembly.stencil"
        ),
        .file(
            path: "\(basePath)/Sources/\(name)ScreenFactory.swift",
            templatePath: "screen-factory.stencil"
        ),
        .file(
            path: "\(basePath)/Sources/\(name)Feature.swift",
            templatePath: "../common/feature.stencil"
        ),
        .file(
            path: "\(basePath)/Sources/\(name)View.swift",
            templatePath: "screen-view.stencil"
        ),
    ]
)
