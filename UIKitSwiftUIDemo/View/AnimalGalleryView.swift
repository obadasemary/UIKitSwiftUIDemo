//
//  AnimalGalleryView.swift
//  UIKitSwiftUIDemo
//
//  Created by Abdelrahman Mohamed on 7.02.2022.
//

import SwiftUI

struct AnimalGalleryView: View {

    let animal: Animal

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 15) {
                ForEach(animal.gallery, id: \.self) { item in
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .cornerRadius(12)
                }
            }
        }
    }
}

struct AnimalGalleryView_Previews: PreviewProvider {

    static let animals: [Animal] = Bundle.main.decode("animals.json")

    static var previews: some View {
        AnimalGalleryView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
