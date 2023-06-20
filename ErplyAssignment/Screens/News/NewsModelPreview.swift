//
//  NewsModelPreview.swift
//  ErplyAssignment
//
//  Created by Umer Khan on 20.06.2023.
//

import Foundation

struct NewsModelPreview: Identifiable {
    let id = UUID()
    let title: String
    let imageUrl: URL?
    let publishedAt: String
    let details: NewsDetailModelPreview
}

extension NewsModelPreview {
    var publishedDate: Date? {
        publishedAt.asDate
    }
}


extension NewsModelPreview: Equatable {
    static func == (lhs: NewsModelPreview, rhs: NewsModelPreview) -> Bool {
        lhs.details.sourceOfNewsUrl == rhs.details.sourceOfNewsUrl
    }
}
