import UIKit
import FeatureSupport
import DI

import HomeScreenInterface
import FooScreenInterface

// MARK: - Interface

protocol AppCoordinator: AnyObject {

}

enum AppScreen {
    case home
    case foo
}

// MARK: - Implementation

final class AppCoordinatorImpl: AppCoordinator {

    private let screenProvider: AppScreenProvider

    init(screenProvider: AppScreenProvider) {
        self.screenProvider = screenProvider
    }

    func start() -> UIViewController {
        screenProvider.view(.home)
    }
}

// MARK: - ScreenProvider

final class AppScreenProvider {

    private let container: Container

    init(container: Container) {
        self.container = container
    }

    func view(_ screen: AppScreen) -> LifecycleObservableController {
        switch screen {
        case .home:
            guard let factory = container.resolve(HomeScreenFactory.self) else { fatalError() }
            return factory.make()
        case .foo:
            guard let factory = container.resolve(FooScreenFactory.self) else { fatalError() }
            return factory.make()
        }
    }
}
