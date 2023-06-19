//
//  NewsScreen.swift
//  ErplyAssignment
//
//  Created by Umer Khan on 19.06.2023.
//

import SwiftUI

struct NewsScreen: View {
    
    @EnvironmentObject var appFlowManager: AppFlowManager
    
    @StateObject var viewModel = NewsViewModel()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .navigationTitle("News")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        logoutTapped()
                    } label: {
                        Text("Logout")
                    }
                }
            }
    }

    private func logoutTapped() {
        // Remove email from storage
        viewModel.perform(action: .removeEmailFromStorage)
        
        // Update state
        appFlowManager.perform(action: .updateState(.login))
    }
}

struct NewsScreen_Previews: PreviewProvider {
    static var previews: some View {
        NewsScreen()
    }
}
