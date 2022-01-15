//
//  SpellList.swift
//  ChampionDetails
//
//  Created by Ahmed Naser on 15/01/2022.
//

import SwiftUI

struct SpellList: View {
    let spells: [SpellItemViewModel]
    
    var body: some View {
        VStack {
            Text("Spells")
                .font(.title2)
                .fontWeight(.heavy)
                .foregroundColor(.white)
                .padding([.top, .leading, .trailing], 5.0)
                .frame(maxWidth: .infinity,
                       maxHeight: 10,
                       alignment: .leading)
            ScrollView {
                LazyVStack {
                    ForEach(spells, id: \.id) { spellsViewModel in
                        Spacer()
                        SpellItem(viewModel: spellsViewModel)

                    }
                }
           
            }
            .padding(.horizontal, 5.0)
        }

    }
}
