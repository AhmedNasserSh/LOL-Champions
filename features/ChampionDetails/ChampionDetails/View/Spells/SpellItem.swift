//
//  SpellItem.swift
//  ChampionDetails
//
//  Created by Ahmed Naser on 15/01/2022.
//

import SwiftUI

struct SpellItem: View {
    @StateObject var viewModel: SpellItemViewModel
    
    var body: some View {
        HStack(spacing: 5.0) {
            VStack(alignment: .center) {
                Image(uiImage: viewModel.image)
                    .resizable()
                .frame(maxWidth: 80, maxHeight: 80)
            }
            VStack(spacing: 5.0) {
                Text(viewModel.name)
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity,
                           alignment: .leading)
                Text(viewModel.description)
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .frame(maxWidth: .infinity,
                           alignment: .leading)
            }
            
        }
        .padding(5)
        .background(Color.black)
        .opacity(0.7)
        .cornerRadius(10)
        .frame(maxHeight: 120)
        .onAppear {
            viewModel.getChampionData()
        }

    }
    
}
