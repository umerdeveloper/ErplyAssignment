//
//  NewsListEndpoint.swift
//  ErplyAssignment
//
//  Created by Umer Khan on 20.06.2023.
//

import Foundation

enum NewsListEndpoint {
    case getNewsList(query: NewsListQuery)
}

extension NewsListEndpoint: Endpoint {
    var path: String {
        switch self {
        case .getNewsList:
            return ""
        }
    }

    var method: HTTPMethod {
        switch self {
        case .getNewsList:
            return .get
        }
    }

    var queryItems: [URLQueryItem] {
        switch self {
        case .getNewsList(let query):
            return query.build()
        }
    }
}
