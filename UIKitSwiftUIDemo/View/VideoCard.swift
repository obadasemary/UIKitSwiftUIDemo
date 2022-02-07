//
//  VideoCard.swift
//  PexelsUI
//
//  Created by Abdelrahman Mohamed on 3.02.2022.
//

import SwiftUI

struct VideoCard: View {
    var body: some View {
        ZStack {
            ZStack(alignment: .bottomLeading) {
                AsyncImage(url: URL(string: "")) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 160, height: 250)
                        .cornerRadius(30)
                } placeholder: {
                    Rectangle()
                        .foregroundColor(.gray.opacity(0.3))
                        .frame(width: 160, height: 250)
                        .cornerRadius(30)
                }

                VStack(alignment: .leading) {
                    Text("32 Sec")
                        .font(.caption)
                        .bold()

                    Text("By Obada")
                        .font(.caption)
                        .bold()
                        .multilineTextAlignment(.leading)
                }
                .foregroundColor(.white)
                .shadow(radius: 20)
                .padding()
            }
        }
    }
}

struct VideoCard_Previews: PreviewProvider {
    static var previews: some View {
        VideoCard()
    }
}
