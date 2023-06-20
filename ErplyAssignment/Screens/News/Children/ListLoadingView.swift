//
//  ListLoadingView.swift
//  ErplyAssignment
//
//  Created by Umer Khan on 20.06.2023.
//

import SwiftUI

struct ListLoadingView: View {
    var body: some View {
        HStack {
            Spacer()
            ProgressView()
            Spacer()
        }
        .padding()
    }
}
