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
        List {

            ForEach(viewModel.newsList, id: \.id) { news in

                // Hide right arrow on navigation link
                ZStack {
                    NewsCellView(news: news)
                    NavigationLink(destination: NewsDetailScreen(newsDetail: news.details)) {
                        EmptyView()
                    }
                    .opacity(0)
                }
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 8, trailing: 0))
                .listRowSeparator(.hidden)
            }
            
            if viewModel.isNewsListFull == false {
                ListLoadingView()
                .onAppear {
                    self.viewModel.perform(action: .getNews)
                }
            }
            
            if viewModel.isPresentedEmptyListMessage {
                EmptyListMessageView(message: "Oops something went wrong, please come later...")
            }
        }
        .onViewDidLoad {
            viewModel.perform(action: .getNews)
        }
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
