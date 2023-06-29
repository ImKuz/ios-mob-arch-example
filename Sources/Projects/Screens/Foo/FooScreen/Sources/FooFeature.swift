import FeatureSupport
import SwiftUI

// MARK: - Model

enum FooAction: FeatureAction {

    enum ViewAction {
        case none
    }

    enum LogicAction {
        case none
    }

    case view(ViewAction)
    case logic(LogicAction)
}

struct FooState: Equatable {

}

// MARK: - Reducer

struct FooReducer: ReducerProtocol {

    typealias Action = FooAction
    typealias State = FooState

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

struct FooReducerMock: ReducerProtocol {

    typealias State = FooReducer.State
    typealias Action = FooReducer.Action

    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        .none
    }
}
