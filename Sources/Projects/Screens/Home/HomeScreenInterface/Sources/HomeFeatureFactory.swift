import FeatureSupport

public protocol HomeScreenFactory {

    func make() -> LifecycleObservableController
}
