import FeatureSupport
import SwiftUI

// MARK: - Model

enum HomeAction: FeatureAction {

    enum ViewAction {
        case none
    }

    enum LogicAction {
        case none
    }

    case view(ViewAction)
    case logic(LogicAction)
}

struct HomeState: Equatable {

}

// MARK: - Reducer

struct HomeReducer: ReducerProtocol {

    typealias Action = HomeAction
    typealias State = HomeState

    // MARK: - Reducer

    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
        case let .view(action):
            return reduce(viewAction: action, into: &state).map { .logic($0) }
        case let .logic(action):
            return reduce(logicAction: action, into: &state).map { .logic($0) }
        }
    }

    private func reduce(
        viewAction: Action.ViewAction,
        into state: inout State
    ) -> EffectTask<Action.LogicAction> {
        .none
    }

    private func reduce(
        logicAction: Action.LogicAction,
        into state: inout State
    ) -> EffectTask<Action.LogicAction> {
        .none
    }
}

// MARK: - Mock

struct HomeReducerMock: ReducerProtocol {

    typealias State = HomeReducer.State
    typealias Action = HomeReducer.Action

    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        .none
    }
}
