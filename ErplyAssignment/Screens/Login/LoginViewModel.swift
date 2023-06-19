//
//  LoginViewModel.swift
//  ErplyAssignment
//
//  Created by Umer Khan on 19.06.2023.
//

import Foundation
import SwiftUI

final class LoginViewModel: ObservableObject {

    @Published var email: String = ""

    let storage: UserDefaultStorage = DefaultUserDefaultStorage()

    var isValidEmail: Bool {
        isValidEmailAddress()
    }
}

// MARK: - Action
extension LoginViewModel {
    enum Action: CaseIterable {
        case handleLogin
    }
    
    func perform(action: Action) {
        switch action {
        case .handleLogin:
            handleLoginTap()
        }
    }
}

// MARK: - Action methods
extension LoginViewModel {
    private func handleLoginTap() {
        storage.set(data: email, key: UserDefaultsStorageKey.login)
    }

    private func isValidEmailAddress() -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
}
