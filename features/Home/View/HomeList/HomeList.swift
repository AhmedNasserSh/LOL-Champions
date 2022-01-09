//
//  HomeList.swift
//  Home
//
//  Created by Ahmed Naser on 08/01/2022.
//

import SwiftUI
import Common

struct HomeList: View {
    @State var items: [Champion]
    
    var body: some View {
        GeometryReader { gemotery in
            ScrollViewUI(hideScrollIndicators: true) {
                LazyHStack(alignment: .center) {
                    ForEach(items, id: \.id) { champion in
                        HomeListRow(champion: champion)
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
        HomeList(items: [])
    }
}
