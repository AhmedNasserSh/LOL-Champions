//
//  HomeList.swift
//  Home
//
//  Created by Ahmed Naser on 08/01/2022.
//

import SwiftUI

struct HomeList: View {
    @State var images = ["1", "2", "3", "4"]
    var items: [GridItem] = Array(repeating: .init(.flexible()), count: 2)

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: items, spacing: 5) {
                ForEach(images, id: \.self) { category in
                    HomeListRow()
                }
            }
        }
        .background(.black)

    }
    
    
}

struct HomeList_Previews: PreviewProvider {
    static var previews: some View {
        HomeList()
    }
}
