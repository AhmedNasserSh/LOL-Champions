//
//  ChampionDetailsView.swift
//  ChampionDetails
//
//  Created by Ahmed Naser on 08/01/2022.
//

import SwiftUI

public struct ChampionDetailsView: View {
    
    public init() { }
    public var body: some View {
        VStack {
            Image(imageName: "Aatrox")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxHeight: 200)
            ScrollView {
                TagsList(tags: ["Tank", "Fighter"])
                
                InfoView(name: "Aatrox",
                         title: "the Darkin Blade",
                         description: "Once honored defenders")
                SpellList(spells: ["hi", ""])
            }
        }.background(Color(red: 0.067, green: 0.098, blue: 0.133))
    }
}

struct ChampionDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ChampionDetailsView()
    }
}
