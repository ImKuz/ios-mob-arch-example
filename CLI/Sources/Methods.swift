import ArgumentParser
import SwiftShell

extension ParsableCommand {

    func generateProject(shouldFetch: Bool) throws {
        try runScript(.preGeneration)
        if shouldFetch { try tuist(.fetch) }
        try tuist(.generate)
    }
}
