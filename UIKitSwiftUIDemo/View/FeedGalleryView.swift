//
//  FeedGalleryView.swift
//  Africa
//
//  Created by Abdelrahman Mohamed on 2.10.2020.
//

import SwiftUI

struct FeedGalleryView: View {
    
    // MARK: - PROPERTIES
    
    let animal: Animal
    
    // MARK: - BODY
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(alignment: .center, spacing: -20) {
                ForEach(animal.gallery, id: \.self) { item in
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(12)
                        .padding()
                }
            }
        }
    }
}

// MARK: - PREVIEW

struct FeedGalleryView_Previews: PreviewProvider {
    
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        FeedGalleryView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
