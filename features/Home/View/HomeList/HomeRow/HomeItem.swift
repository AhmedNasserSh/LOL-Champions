//
//  HomeItem.swift
//  Home
//
//  Created by Ahmed Naser on 07/01/2022.
//

import Common
import SwiftUI

struct HomeItem: View {
    @StateObject var viewModel: HomeItemViewModel
    
    var body: some View {
        VStack(alignment: .center) {
            Button {
                print("hi")
            } label: {
                Image(uiImage: viewModel.image)
                    .resizable()
                    .cornerRadius(20)
                    .scaledToFit()
                    .overlay(HomeItemOverlay(text: viewModel.name) ,
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
