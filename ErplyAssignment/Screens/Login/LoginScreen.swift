//
//  LoginScreen.swift
//  ErplyAssignment
//
//  Created by Umer Khan on 19.06.2023.
//

import SwiftUI

struct LoginScreen: View {

    @StateObject var viewModel = LoginViewModel()

    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            TextField("Email", text: $viewModel.email)
                .padding()
                .textFieldStyle(.roundedBorder)
            
            Button {
                viewModel.perform(action: .handleLogin)
            } label: {
                Text("Login")
            }
            .buttonStyle(.borderedProminent)
            .disabled(viewModel.isValidEmail == false)
        }
        .navigationTitle("Login")
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
