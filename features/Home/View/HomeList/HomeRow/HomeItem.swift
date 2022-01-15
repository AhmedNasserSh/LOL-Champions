//
//  HomeItem.swift
//  Home
//
//  Created by Ahmed Naser on 07/01/2022.
//

import Common
import SwiftUI
import AppCoordinator

struct HomeItem: View {
    @StateObject var viewModel: HomeItemViewModel
    @Inject private var coordinator: AppCoordinator
    
    var body: some View {
        VStack(alignment: .center) {
            
            NavigationLink {
                coordinator.championDetailsView(with: viewModel.getChampion())
            } label: {
                Image(uiImage: viewModel.image)
                    .resizable()
                    .cornerRadius(20)
                    .scaledToFit()
                    .overlay(TextOverlay(text: viewModel.name) ,
                             alignment: .bottom)
                    .rotation3DEffect(.degrees(5), axis: (x: 0, y: 1, z: 0))
                    .padding()
            }
        }
        .onAppear {
            viewModel.getChampionData()
        }
    }
}
