//
//  AppFlowManager.swift
//  ErplyAssignment
//
//  Created by Umer Khan on 19.06.2023.
//

import Foundation

enum AppFlowScreenState: CaseIterable {
    case login
    case news
    case none
}

final class AppFlowManager: ObservableObject {

    @Published var state: AppFlowScreenState = .none
    let storage: UserDefaultStorage = DefaultUserDefaultStorage()
}

// MARK: - Action
extension AppFlowManager {
    enum Action {
        case startFlow
        case updateState(AppFlowScreenState)
    }

    func perform(action: Action) {
        switch action {
        case .startFlow:
            startFlow()
        case .updateState(let state):
            updateState(state)
        }
    }
}

// MARK: - Helping methods
extension AppFlowManager {

    private func updateState(_ state: AppFlowScreenState) {
        DispatchQueue.main.async {
            self.state = state
        }
    }

    private func startFlow() {

        guard (storage.get(key: UserDefaultsStorageKey.login, decode: String.self)) != nil else {
            updateState(.login)
            return
        }

        updateState(.news)
    }
}
