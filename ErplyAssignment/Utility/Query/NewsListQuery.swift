//
//  NewsListQuery.swift
//  ErplyAssignment
//
//  Created by Umer Khan on 20.06.2023.
//

import Foundation

struct NewsListQuery {
    let pageSize: Int = 10
    let currentPage: Int
}

extension NewsListQuery {
    func build() -> [URLQueryItem] {
        return [
            URLQueryItem(name: "pageSize", value: "\(pageSize)"),
            URLQueryItem(name: "page", value: "\(currentPage)"),
            URLQueryItem(name: "language", value: "en")
        ]
    }
}
