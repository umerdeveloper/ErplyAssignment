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
    
    @Published var newsList: [NewsModelPreview] = []
    @Published var isPresentedError: Bool = false
    @Published var isNewsListFull: Bool = false
    @Published var isPresentedEmptyListMessage: Bool = false

    let newsService: NewsService
    private(set) var currentPage: Int = 1
    private(set) var pageSize: Int = 10

    init(newsService: NewsService = DefaultNewsService()) {
        self.newsService = newsService
    }
}

// MARK: - Action
extension NewsViewModel {
    enum Action {
        case getNews
        case removeEmailFromStorage
    }
    
    func perform(action: Action) {
        switch action {
        case .removeEmailFromStorage:
            removeEmailFromStorage()
        case .getNews:
            getNews()
        }
    }
}

// MARK: - Action methods
extension NewsViewModel {
    private func removeEmailFromStorage() {
        storage.remove(key: UserDefaultsStorageKey.login)
    }
    
    private func getNews() {

        let query = NewsListQuery(currentPage: currentPage)

        Log.info("Going to fetch page: \(currentPage)")

        Task {
            let result = await newsService.getNewsList(query: query)
            
            switch result {
            case .success(let newsListModel):
                handleData(newsListModel)

            case .failure:
                handleError()
            }
        }
    }
}

// MARK: - Helping methods
extension NewsViewModel {
    private func handleData(_ page: NewsModel) {
        
        guard let articles = page.articles else { return }

        // Handle message view
        let needsToDisplayEmptyListMessage = currentPage == 1 && articles.isEmpty
        if needsToDisplayEmptyListMessage {
            self.isPresentedEmptyListMessage = true
        }

        currentPage += 1

        // Handle progress view
        let isLastPage: Bool = articles.count < pageSize
        if isLastPage {
            self.isNewsListFull = true
        }
        
        // Data preparation
        let newsModelPreviewArray = NewsListDataHelper.getNewsListModelPreview(from: page)

        // For duplicates handling, we're checking based on news url
        var temporaryNewsModelPreviewArray: [NewsModelPreview] = []

        newsModelPreviewArray.forEach { news in
            temporaryNewsModelPreviewArray.appendIfNotContains(news)
        }

        DispatchQueue.main.async {
            self.newsList.append(contentsOf: temporaryNewsModelPreviewArray)
        }
    }

    private func handleError() {

        // Show error alert
        self.isPresentedError = true
        
        // Show message
        self.isPresentedEmptyListMessage = true
        
        // Hide progress
        self.isNewsListFull = true
    }
}
