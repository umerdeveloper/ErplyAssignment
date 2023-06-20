//
//  NewsCellView.swift
//  ErplyAssignment
//
//  Created by Umer Khan on 20.06.2023.
//

import SwiftUI

struct NewsCellView: View {

    let news: NewsModelPreview

    var body: some View {

        VStack(alignment: .leading, spacing: 8) {

            ImageView(url: news.imageUrl)

            Text(news.title)
                .font(.system(size: 15, weight: .medium))
                .padding(.leading, 8)

            PublishedDateView(publishedDate: news.publishedDate)
                .padding([.bottom, .trailing], 8)
        }
    }
}
