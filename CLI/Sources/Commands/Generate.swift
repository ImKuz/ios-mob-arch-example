import ArgumentParser
import Foundation
import SwiftShell

// MARK: - generate

struct Generate: ParsableCommand {

    static var configuration = CommandConfiguration(abstract: "Generates Xcode project")

    // MARK: - Arguments

    @Flag(
        name: .shortAndLong,
        help: "Add this flag to fetch dependencies during the generation."
    )
    var fetch = false

    // MARK: - Script

    mutating func run() throws {
        print("🦾 Generating the project...")
        try generateProject(shouldFetch: fetch)
    }
}
