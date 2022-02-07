//
//  TabsView.swift
//  UIKitSwiftUIDemo
//
//  Created by Abdelrahman Mohamed on 7.02.2022.
//

import SwiftUI

struct TabsView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(Query.allCases, id: \.self) { searchQuery in
                    QueryTag(query: searchQuery, isSelected: false)
                }
            }
        }
    }
}

struct TabsView_Previews: PreviewProvider {
    static var previews: some View {
        TabsView()
    }
}
