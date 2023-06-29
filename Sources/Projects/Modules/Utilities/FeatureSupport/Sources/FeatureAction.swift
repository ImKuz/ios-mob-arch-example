public protocol FeatureAction {

    associatedtype ViewAction
    associatedtype LogicAction

    static func view(_: ViewAction) -> Self
    static func logic(_: LogicAction) -> Self
 }
