import FooScreenInterface
import FeatureSupport
import UIKit

// MARK: - Implementation

final class FooScreenFactoryImpl: FooScreenFactory {

    func make() -> LifecycleObservableController {
        let store = StoreOf<FooReducer>(
            initialState: .init(),
            reducer: FooReducer()
        )

        return FooView(store: store).embededInHost()
    }
}
