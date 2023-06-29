import Foundation

var projectDirectory: String? { UserDefaults.shared.string(forKey: "project-directory") }

extension UserDefaults {
    static var shared: UserDefaults {
        return UserDefaults(suiteName: "arcli")!
    }
}

