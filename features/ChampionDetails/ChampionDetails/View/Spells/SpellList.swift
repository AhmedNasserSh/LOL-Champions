//
//  SpellList.swift
//  ChampionDetails
//
//  Created by Ahmed Naser on 15/01/2022.
//

import SwiftUI

struct SpellList: View {
    let spells: [String]
    
    var body: some View {
        VStack {
            Text("Spells")
                .font(.title2)
                .foregroundColor(.white)
                .padding([.top, .leading, .trailing], 5.0)
                .frame(maxWidth: .infinity,
                       maxHeight: 10,
                       alignment: .leading)
            ScrollView {
                LazyVStack {
                    ForEach(spells, id: \.self) { tag in
                        Spacer()
                        SpellItem(image: UIImage(),
                                  spellName: "Spell",
                                  spellDesc: "SpellDesc")

                    }
                }
           
            }
            .padding(.horizontal, 5.0)
        }

    }
}

struct SpellList_Previews: PreviewProvider {
    static var previews: some View {
        SpellList(spells: ["", "s"])
    }
}
