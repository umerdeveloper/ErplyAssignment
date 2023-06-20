//
//  URL+Extensions.swift
//  PlandayAssignment
//
//  Created by Umer Khan on 17.02.2023.
//

import Foundation

extension URL {

    mutating func appendQueryItem(name: String, value: String?) {
        guard var urlComponents = URLComponents(string: absoluteString) else { return }

        var queryItems: [URLQueryItem] = urlComponents.queryItems ?? []

        let queryItem = URLQueryItem(name: name, value: value)

        queryItems.append(queryItem)

        urlComponents.queryItems = queryItems

        if let url = urlComponents.url {
            self = url
        }
    }
}
