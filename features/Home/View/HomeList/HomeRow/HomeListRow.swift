//
//  HomeListRow.swift
//  Home
//
//  Created by Ahmed Naser on 07/01/2022.
//

import Common
import SwiftUI

struct HomeListRow: View {
    let champion: Champion
    
    var body: some View {
        VStack(alignment: .center) {
            Image(champion.image.full)
                .resizable()
                .cornerRadius(20)
                .scaledToFit()
                .overlay(HomeListRowOverlay(text: champion.name) ,
                         alignment: .bottom)
                .rotation3DEffect(.degrees(5), axis: (x: 0, y: 1, z: 0))
                .padding()
        }
    }
}

struct HomeListRow_Previews: PreviewProvider {
    static var previews: some View {
        HomeListRow(champion: Champion(id: "",
                                       key: "",
                                       name: "Annie",
                                       title: "Annie",
                                       image: ChampionImage(full: ""),
                                       tags: [],
                                       info: ChampionInfo(
                                           info: "",
                                           attack: "",
                                           defense: "",
                                           magic: "",
                                           difficulty: "")))
    }
}
