import ProjectDescription

/// e.g --name Settings -> SettingsFeatureInterface
fileprivate let name: Template.Attribute = .required("name")
fileprivate let mpath: Template.Attribute = .optional("mpath", default: "")

fileprivate let basePath = "Projects/Screens\(mpath)/\(name)ScreenInterface"

let interface = Template(
    description: "Screen interface template",
    attributes: [
        name, mpath
    ], items: [
        .file(
            path: "\(basePath)/Project.swift",
            templatePath: "screen-interface-project.stencil"
        ),
        .file(
            path: "\(basePath)/Sources/\(name)FeatureFactory.swift",
            templatePath: "screen-interface-factory.stencil"
        )
    ]
)
