//
//  Endpoint.swift
//  ErplyAssignment
//
//  Created by Umer Khan on 20.06.2023.
//

import Foundation

protocol Endpoint {
    var baseURL: URL? { get }
    var headers: [String: String] { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var queryItems: [URLQueryItem] { get }
}

extension Endpoint {

    var baseURL: URL? {
        URL(string: APIConstants.baseUrl)
    }

    var headers: [String : String] {
        [
            "accept": "application/json",
            "Authorization": APIConstants.apiKey
        ]
    }
    
    var queryItems: [URLQueryItem] { [] }
}

extension Endpoint {
    func buildRequest() -> Result<URLRequest, NetworkError> {
        guard let baseURL = baseURL,
              let urlWithPath = buildRequestUrl(baseUrl: baseURL) else { return .failure(.badUrl) }

        var request = URLRequest(url: urlWithPath)
        method.apply(to: &request)

        for (field, value) in headers {
            request.setValue(value, forHTTPHeaderField: field)
        }

        if queryItems.isEmpty == false {
            queryItems.forEach { item in
                request.url?.appendQueryItem(name: item.name, value: item.value)
            }
        }

        return .success(request)
    }
    
    private func buildRequestUrl(baseUrl: URL) -> URL? {
        let completeUrl = baseUrl.appendingPathComponent(path)
        let urlComponents = URLComponents(url: completeUrl, resolvingAgainstBaseURL: false)
        let url = urlComponents?.url
        return url
    }
}

