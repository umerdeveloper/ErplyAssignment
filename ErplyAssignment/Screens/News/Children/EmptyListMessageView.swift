//
//  EmptyListMessageView.swift
//  ErplyAssignment
//
//  Created by Umer Khan on 20.06.2023.
//

import SwiftUI

struct EmptyListMessageView: View {
    
    let message: String
    
    var body: some View {
        Text(message)
            .font(.callout)
            .padding()
    }
}
