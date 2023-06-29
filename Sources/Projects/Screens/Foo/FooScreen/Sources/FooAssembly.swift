import DI
import FooScreenInterface

// sourcery:assembly=FooScreen
public struct FooScreenAssembly: Assembly {

    public init() {}

    public func assemble(container: Container) {
        container.register(FooScreenFactory.self) { _ in
            FooScreenFactoryImpl()
        }
    }
}
