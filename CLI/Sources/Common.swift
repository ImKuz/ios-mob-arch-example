import ArgumentParser
import SwiftShell
import Foundation

enum Const {
    static let sourcesSubDir = "/Sources"
    static let projectDirectory = UserDefaults.shared.string(forKey: "project-directory")
}

// MARK: - Common execution

extension ParsableCommand {

    func runCommand(_ exec: String, args: Any...) {
        let command = runAsync(exec, args)

        let handler: (ReadableStream) -> () = {
            if var text = $0.readSome(), !text.isEmpty {
                text.removeLast()
                print(text)
            }
        }

        command.stdout.onOutput(handler)
        command.stderror.onOutput(handler)

        do {
            try command.finish()
        } catch let CommandError.returnedErrorCode(command, errorcode) {
            print("Command '\(command)' finished with exit code \(errorcode).")
        } catch {
            Self.exit(withError: error)
        }
    }
}

// MARK: - Tuist

enum TuistCommand: String {
    case generate
    case fetch
    case scaffold
}

extension ParsableCommand {

    func tuist(_ command: TuistCommand, _ args: Any...) throws {
        guard let projectDirectory else {
            print("No project directory set")
            throw ExitCode(1)
        }

        runCommand(
            "tuist",
            args: command.rawValue, args,
            "-p", "\(projectDirectory)\(Const.sourcesSubDir)"
        )
    }
}

// MARK: - Scripts

enum Script {
    case preGeneration
    case generateModuleNames
}

extension ParsableCommand {

    func runScript(_ script: Script) throws {
        runCommand("sh", args: try scriptExec(script))
    }

    private func scriptExec(_ script: Script) throws -> [Any] {
        guard let projectDirectory else {
            print("No project directory set")
            throw ExitCode(1)
        }

        let basePath = "\(projectDirectory)/Scripts/"
        let scriptPath: String
        let args = [Any]()

        switch script {
        case .preGeneration:
            scriptPath = "pre-generation.sh"
        case .generateModuleNames:
            scriptPath = "CodeGeneration/module-names/script.sh"
        }

        return [basePath + scriptPath] + args
    }
}
