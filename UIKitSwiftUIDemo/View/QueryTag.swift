//
//  QueryTag.swift
//  PexelsUI
//
//  Created by Abdelrahman Mohamed on 3.02.2022.
//

import SwiftUI

enum Query: String, CaseIterable {
    case nature, animals, people, ocean, food, football, wars, sports
}

struct QueryTag: View {

    var query: Query
    var isSelected: Bool

    var body: some View {
        Text(query.rawValue)
            .font(.caption)
            .bold()
            .foregroundColor(isSelected ? .black : .gray)
            .padding(10)
            .background(.thinMaterial)
            .cornerRadius(10)
    }
}

struct QueryTag_Previews: PreviewProvider {
    static var previews: some View {
        QueryTag(query: Query.ocean, isSelected: true)
    }
}
