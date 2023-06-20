//
//  ImageView.swift
//  ErplyAssignment
//
//  Created by Umer Khan on 20.06.2023.
//

import SwiftUI

struct ImageView: View {
    
    let url: URL?
    
    var body: some View {
        CacheAsyncImage(url: url) { image in
            image
                .resizable()
                .cornerRadius(8)
                .aspectRatio(contentMode: .fit)
        } placeholder: {
            Image(systemName: "photo")
                .resizable()
                .cornerRadius(8)
                .aspectRatio(contentMode: .fit)
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(url: URL(string: "https://media.trustradius.com/product-logos/ex/LJ/T409K3QX1XZD.PNG"))
    }
}
