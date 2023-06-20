//
//  NetworkError.swift
//  ErplyAssignment
//
//  Created by Umer Khan on 20.06.2023.
//

import Foundation

enum NetworkError: Error {

    // General
    case invalidResponse
    case serverError(Int)
    case clientError(Int)
    case unknownError
    case decodingError
    case badUrl
}

extension NetworkError: Equatable {
}

enum DecodingErrorType: Error {
    case dataCorrupted
    case keyNotFound
    case valueNotFound
    case typeMismatch
    case unknown
}
