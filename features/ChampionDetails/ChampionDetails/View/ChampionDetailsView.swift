//
//  ChampionDetailsView.swift
//  ChampionDetails
//
//  Created by Ahmed Naser on 08/01/2022.
//

import SwiftUI
import Common

public struct ChampionDetailsView: View {
    @StateObject private var viewModel: ChampionDetailsViewModel
    
    public init(champion: Champion) {
        _viewModel = StateObject(wrappedValue: ChampionDetailsViewModel(champion: champion))
    }
    
    public var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                Image(uiImage: viewModel.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxHeight: 200)
                TagsList(tags: viewModel.tags)
                
                InfoView(name: viewModel.name,
                         title: viewModel.title,
                         description: viewModel.bio)
                SpellList(spells: viewModel.spells)
            }
        }
        .background(Color(red: 0.067, green: 0.098, blue: 0.133))
        .onAppear {
            viewModel.fetchData()
        }
    }
}
