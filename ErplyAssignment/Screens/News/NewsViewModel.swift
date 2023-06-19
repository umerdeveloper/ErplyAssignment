//
//  NewsViewModel.swift
//  ErplyAssignment
//
//  Created by Umer Khan on 19.06.2023.
//

import Foundation
import SwiftUI

final class NewsViewModel: ObservableObject {

    let storage: UserDefaultStorage = DefaultUserDefaultStorage()
}

// MARK: - Action
extension NewsViewModel {
    enum Action {
        case removeEmailFromStorage
    }
    
    func perform(action: Action) {
        switch action {
        case .removeEmailFromStorage:
            removeEmailFromStorage()
        }
    }
}

// MARK: - Action methods
extension NewsViewModel {
    private func removeEmailFromStorage() {
        storage.remove(key: UserDefaultsStorageKey.login)
    }
}
