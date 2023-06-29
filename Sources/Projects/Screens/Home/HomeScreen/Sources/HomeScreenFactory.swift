import HomeScreenInterface
import FeatureSupport
import UIKit

// MARK: - Implementation

final class HomeScreenFactoryImpl: HomeScreenFactory {

    func make() -> LifecycleObservableController {
        let store = StoreOf<HomeReducer>(
            initialState: .init(),
            reducer: HomeReducer()
        )

        return HomeView(store: store).embededInHost()
    }
}
