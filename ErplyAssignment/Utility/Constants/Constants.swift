//
//  Constants.swift
//  ErplyAssignment
//
//  Created by Umer Khan on 20.06.2023.
//

import Foundation

struct APIConstants {
    static let apiKey = "c4ee96db222d4dd493bf2dfde857d4dd"
    static let baseUrl = "https://newsapi.org/v2/top-headlines/"
}

struct StatusCode {
    static let validResponseRange = 200...299
    static let serverErrorRange = 500...599
    static let clientErrorRange = 400...499
}
