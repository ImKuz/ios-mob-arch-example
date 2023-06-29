import FeatureSupport
import SwiftUI

struct FooView: View {

    @ObservedObject
    var viewStore: ViewStore<FooState, FooAction.ViewAction>

    init(store: StoreOf<FooReducer>) {
        viewStore = ViewStore(
            store.scope(state: { $0 }, action: { .view($0) }),
            observe: { $0 }
        )
    }

    var body: some View {
        EmptyView()
    }
}

// MARK: - Previews

struct FooView_Previews: PreviewProvider {
    static var previews: some View {
        FooView(store: .init(
            initialState: .init(),
            reducer: FooReducerMock()
        ))
    }
}
