//
//  HomeList.swift
//  Home
//
//  Created by Ahmed Naser on 08/01/2022.
//

import SwiftUI
import Common

struct HomeList: View {
    @State var images = ["1", "2", "3", "4", "6", "7"]
    var items: [GridItem] = Array(repeating: .init(.flexible()),
                                  count: 3)
    var body: some View {
        GeometryReader { gemotery in
            ScrollViewUI(hideScrollIndicators: true) {
                LazyHStack(alignment: .center) {
                    ForEach(images, id: \.self) { _ in
                        HomeListRow()
                            .frame(width: gemotery.size.width - 5, alignment: .center)
                    }
                }
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct HomeList_Previews: PreviewProvider {
    static var previews: some View {
        HomeList()
    }
}
