import ArgumentParser
import Foundation
import SwiftShell

// MARK: - generate

struct Add: ParsableCommand {

    static var configuration = CommandConfiguration(
        abstract: "Creates new module"
    )

    enum ModuleType: String, CaseIterable {
        case module
        case screen
    }

    // MARK: - Arguments

    @Argument(help: "Type of module: \(ModuleType.list)")
    var type: String

    @Option(help: "Relative path from base directory (e.g. Projects/Features)")
    var path: String = ""

    @Option(help: "Module name")
    var name: String

    @Flag(
        name: .shortAndLong,
        help: "This flag triggers project generation after adding the module"
    )
    var regenerate = false

    // MARK: - Script

    mutating func run() throws {
        print("⚙️  Adding new module...")

        guard projectDirectory != nil else {
            print("No project directory set")
            throw ExitCode(1)
        }

        guard let moduleType = ModuleType(rawValue: type) else {
            print("Unknown module type")
            throw ExitCode(1)
        }

        let path = formattedPath(moduleType: moduleType)

        switch moduleType {
        case .screen:
            try scaffold(
                type: "screen-interface",
                name: name,
                path: path
            )
            try scaffold(
                type: "screen",
                name: name,
                path: path
            )
        case .module:
            try scaffold(
                type: "module",
                name: name,
                path: path
            )
        }

        if regenerate {
            try generateProject(shouldFetch: false)
        }

        try runScript(.generateModuleNames)
    }

    // MARK: - Helpers

    private func formattedPath(moduleType: ModuleType) -> String {
        var path = path

        if path.last == "/" {
            path.removeLast()
        }

        if !path.isEmpty, path.first != "/" {
            path = "/" + path
        }

        switch moduleType {
        case .screen:
            if path.isEmpty { path = "/\(name)" }
            return path
        default:
            return path
        }
    }

    private func scaffold(
        type: String,
        name: String,
        path: String
    ) throws {
        try tuist(
            .scaffold, type,
            "--name", name,
            "--mpath", path
        )
    }
}

private extension Add.ModuleType {

    static var list: String {
        Self.allCases
            .map { $0.rawValue }
            .joined(separator: ", ")
    }
}
