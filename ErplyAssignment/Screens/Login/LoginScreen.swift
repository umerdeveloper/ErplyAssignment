//
//  LoginScreen.swift
//  ErplyAssignment
//
//  Created by Umer Khan on 19.06.2023.
//

import SwiftUI

enum Field: Hashable {
    case email
}

struct LoginScreen: View {

    @StateObject var viewModel = LoginViewModel()
    @FocusState private var focusedField: Field?

    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            TextField("Email", text: $viewModel.email)
                .padding()
                .textFieldStyle(.roundedBorder)
                .keyboardType(.emailAddress)
                .focused($focusedField, equals: .email)
            
            Button {
                focusedField = nil
                viewModel.perform(action: .handleLogin)
            } label: {
                Text("Login")
            }
            .buttonStyle(.borderedProminent)
            .disabled(viewModel.isValidEmail == false)
            
            Spacer()
        }
        .onAppear {
            focusedField = .email
        }
        .contentShape(Rectangle()) // Otherwise tap gesture doesn't work on spaces or blank white areas
        .onTapGesture {
            focusedField = nil
        }
        .navigationTitle("Login")
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
