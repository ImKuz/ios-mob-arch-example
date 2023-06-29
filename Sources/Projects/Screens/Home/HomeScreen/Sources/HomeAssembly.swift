import DI
import HomeScreenInterface

// sourcery:assembly=HomeScreen
public struct HomeScreenAssembly: Assembly {

    public init() {}

    public func assemble(container: Container) {
        container.register(HomeScreenFactory.self) { _ in
            HomeScreenFactoryImpl()
        }
    }
}
