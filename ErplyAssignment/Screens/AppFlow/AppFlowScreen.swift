//
//  NewsHomeScreen.swift
//  ErplyAssignment
//
//  Created by Umer Khan on 19.06.2023.
//

import SwiftUI

struct AppFlowScreen: View {
    
    @EnvironmentObject var appFlowManager: AppFlowManager
    
    var body: some View {
        NavigationView {
            content(appFlowManager.state)
        }
        .onAppear {
            appFlowManager.perform(action: .startFlow)
        }
    }

    @ViewBuilder private func content(_ state: AppFlowScreenState) -> some View {

        switch state {
        case .login:
            LoginScreen()
        case .news:
            NewsScreen()
        case .none:
            EmptyView()
        }
    }
}
