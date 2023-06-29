import ProjectDescription

fileprivate let name: Template.Attribute = .required("name")
fileprivate let path: Template.Attribute = .optional("mpath", default: "")

fileprivate let basePath = "Projects/Modules\(path)"

let module = Template(
    description: "Common module template",
    attributes: [
        name, path
    ], items: [
        .file(
            path: "\(basePath)/\(name)/Project.swift",
            templatePath: "module-project.stencil"
        ),
        .file(
            path: "\(basePath)/\(name)/Sources/\(name)Assembly.swift",
            templatePath: "module-assembly.stencil"
        ),
    ]
)
