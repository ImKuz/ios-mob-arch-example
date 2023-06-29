import ArgumentParser
import Foundation

@main
struct Main: ParsableCommand {

    static var configuration = CommandConfiguration(
        commandName: "arcli",
        subcommands: [
            Generate.self,
            Add.self,
        ]
    )
}
