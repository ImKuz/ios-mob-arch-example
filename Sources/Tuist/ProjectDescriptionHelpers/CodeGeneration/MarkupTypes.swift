import ProjectDescription

public protocol ModuleDescription {
    static var name: String { get }
    static var targets: [Target] { get }
}

public protocol AppAssemblerDependenciesGenerated {}
