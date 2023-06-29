import UIKit
import SwiftUI

// MARK: - UIKit extensions

public protocol LifecycleObservableController: UIViewController {
    var onDismiss: (() -> ())? { get set }
}

public class HostingController<Content: View>:
    UIHostingController<Content>,
    LifecycleObservableController
{
    public var onDismiss: (() -> ())?

    override public func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if isBeingDismissed || isMovingFromParent {
            onDismiss?()
        }
    }
}

public class NavigationController:
    UINavigationController,
    LifecycleObservableController
{
    public var onDismiss: (() -> ())?

    override public func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if isBeingDismissed || isMovingFromParent {
            onDismiss?()
        }
    }
}

// MARK: - SwiftUI extensions

public extension View {

    func embededInHost() -> HostingController<Self> {
        .init(rootView: self)
    }
}
