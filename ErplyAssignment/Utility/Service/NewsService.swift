//
//  NewsService.swift
//  ErplyAssignment
//
//  Created by Umer Khan on 20.06.2023.
//

import Foundation

protocol NewsService: AnyObject {
    func getNewsList(query: NewsListQuery) async -> Result<NewsModel, NetworkError>
}

final class DefaultNewsService {
    let webService: WebService

    init(webService: WebService = DefaultWebService()) {
        self.webService = webService
    }
}

// MARK: - NewsService
extension DefaultNewsService: NewsService {
    func getNewsList(query: NewsListQuery) async -> Result<NewsModel, NetworkError> {

        let endpoint = NewsListEndpoint.getNewsList(query: query)
        let request = endpoint.buildRequest()

        switch request {

        case .success(let request):
            return await webService.performRequest(request, returnType: NewsModel.self)

        case .failure(let networkError):
            return .failure(networkError)
        }
    }
}
