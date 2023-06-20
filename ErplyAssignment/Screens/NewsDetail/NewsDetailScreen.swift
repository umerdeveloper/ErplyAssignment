//
//  NewsDetailScreen.swift
//  ErplyAssignment
//
//  Created by Umer Khan on 19.06.2023.
//

import SwiftUI

struct NewsDetailScreen: View {

    let newsDetail: NewsDetailModelPreview

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                Text(newsDetail.author).font(.headline)
                Text(newsDetail.description).font(.body)
                HStack {
                    Text(newsDetail.sourceOfNewsName).font(.subheadline)
                    if let url = newsDetail.sourceOfNewsUrl {
                        Link(destination: url) {
                            Text("read more...").font(.subheadline)
                        }
                    }
                }
            }
            .navigationTitle("Details")
            .navigationBarTitleDisplayMode(.inline)
            .padding()
        }
    }
}
