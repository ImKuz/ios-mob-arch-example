import FeatureSupport
import SwiftUI
import Spec

struct HomeView: View {

    @ObservedObject
    var viewStore: ViewStore<HomeState, HomeAction.ViewAction>

    init(store: StoreOf<HomeReducer>) {
        viewStore = ViewStore(
            store.scope(state: { $0 }, action: { .view($0) }),
            observe: { $0 }
        )
    }

    var body: some View {
        SpecAsset.autoAwesome.swiftUIImage
            .resizable()
            .scaledToFit()
    }
}

// MARK: - Previews

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(store: .init(
            initialState: .init(),
            reducer: HomeReducerMock()
        ))
    }
}
