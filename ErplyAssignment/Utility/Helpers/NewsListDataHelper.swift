//
//  NewsListDataHelper.swift
//  ErplyAssignment
//
//  Created by Umer Khan on 20.06.2023.
//

import Foundation

struct NewsListDataHelper {
    
    static func getNewsListModelPreview(from model: NewsModel) -> [NewsModelPreview] {

        guard let articles = model.articles, articles.isEmpty == false else { return [] }

        var previewArray: [NewsModelPreview] = []

        articles.forEach { article in
            if let title = article.title,
               let imageUrlString = article.urlToImage,
               let publishedAt = article.publishedAt,
               let author = article.author,
               let description = article.description,
               let sourceOfNewsName = article.source?.name,
               let sourceOfNewsUrl = article.url {
                
                let imageUrl = URL(string: imageUrlString)
                let newsUrl = URL(string: sourceOfNewsUrl)
                let previewDetail = NewsDetailModelPreview(author: author, description: description, sourceOfNewsName: sourceOfNewsName, sourceOfNewsUrl: newsUrl)
                let preview = NewsModelPreview(title: title, imageUrl: imageUrl, publishedAt: publishedAt, details: previewDetail)
                
                previewArray.append(preview)
            } else {
                Log.error("News found which is not presentable, may be some data is null")
            }
        }
        return previewArray
    }
}
