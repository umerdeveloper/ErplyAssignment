//
//  WebService.swift
//  ErplyAssignment
//
//  Created by Umer Khan on 20.06.2023.
//

import Foundation

protocol WebService: AnyObject {
    var decoder: JSONDecoder { get }
    func performRequest<T>(_ request: URLRequest, returnType: T.Type) async -> Result<T, NetworkError> where T: Codable
}

class DefaultWebService {

    let session: URLSession

    init(session: URLSession = .shared) {
        self.session = session
    }
}

// MARK: - WebService
extension DefaultWebService: WebService {

    var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }

    func performRequest<T>(_ request: URLRequest, returnType: T.Type) async -> Result<T, NetworkError> where T: Codable {
        do {
            
            Log.info("Did request, \(request)")
            
            let (data, response) = try await session.data(for: request)

            Log.info("Data: \(data.prettyJSONString ?? "Empty"), Request: \(request)")
            
            guard let response = response as? HTTPURLResponse else {
                Log.error("Failed, Request: \(request), invalid response, failed to cast HTTPURLResponse...")
                return .failure(.invalidResponse)
            }
            
            let statusCode = response.statusCode
            
            if response.isClientError(statusCode) {
                Log.error("Client error, code: \(statusCode)")
                return .failure(.clientError(statusCode))
            }
            
            if response.isServerError(statusCode) {
                Log.error("Server error, code: \(statusCode)")
                return .failure(.serverError(statusCode))
            }
            
            if response.isResponseValid(statusCode) {
                
                let result = decoder.doDecoding(T.self, from: data)
                
                switch result {
                    
                case .success(let success):
                    Log.info("Decoding success")
                    return .success(success)
                    
                case .failure:
                    Log.error("Decoding failed, code: \(statusCode)")
                    return .failure(.decodingError)
                }
            }
            
            Log.error("Unknown error, code: \(statusCode)")
            return .failure(.unknownError)
            
        } catch {
            Log.error("Failed, Request: \(request) with network or unknown error...")
            return .failure(.unknownError)
        }
    }
}
