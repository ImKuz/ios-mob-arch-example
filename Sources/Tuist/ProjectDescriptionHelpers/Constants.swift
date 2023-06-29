import ProjectDescription

public enum GlobalConstants {
    public static let targetVersion = "16.0"
    public static let packageNamePrefix = "com.arch-example."
}

public let infoPlistExtension: [_: InfoPlist.Value] = [
    "CFBundleShortVersionString": "1.0",
    "CFBundleVersion": "1",
    "UIMainStoryboardFile": "",
    "UILaunchStoryboardName": "",
]
