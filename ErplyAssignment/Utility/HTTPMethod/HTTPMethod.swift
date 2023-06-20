//
//  HTTPMethod.swift
//  ErplyAssignment
//
//  Created by Umer Khan on 20.06.2023.
//

import Foundation

enum HTTPMethod {
    case get
    case post
    
    func apply(to request: inout URLRequest) {
        switch self {
        case .get:
            request.httpMethod = "GET"
        case .post:
            request.httpMethod = "POST"
        }
    }
}
