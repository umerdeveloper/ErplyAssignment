//
//  PublishedDateView.swift
//  ErplyAssignment
//
//  Created by Umer Khan on 20.06.2023.
//

import SwiftUI

struct PublishedDateView: View {

    let publishedDate: Date?

    var body: some View {
        HStack {
            Spacer()
            if let publishedAt = publishedDate {
                Text(publishedAt, format: Date.FormatStyle().year().month().day().hour().minute())
                    .font(.system(size: 12, weight: .regular))
            }
        }
    }
}

struct PublishedDateView_Previews: PreviewProvider {
    static var previews: some View {
        PublishedDateView(publishedDate: nil)
    }
}
