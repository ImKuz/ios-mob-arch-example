import AppAssembler
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    private let assembler = AppAssembler()
    private lazy var container = assembler.rootContainer()
    private var coordinator: AppCoordinator?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        window = UIWindow()
        window?.rootViewController = assembleRootFeature()
        window?.makeKeyAndVisible()
        return true
    }

    private func assembleRootFeature() -> UIViewController {
        let screenProvider = AppScreenProvider(container: container)
        let coordinator = AppCoordinatorImpl(screenProvider: screenProvider)
        self.coordinator = coordinator
        return coordinator.start()
    }
}
