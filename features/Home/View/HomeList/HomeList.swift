//
//  HomeList.swift
//  Home
//
//  Created by Ahmed Naser on 08/01/2022.
//

import SwiftUI
import Common

struct HomeList: View {
    @StateObject var viewModel =  HomeViewModel()
    private var sections: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: sections, spacing: 5) {
                ForEach(viewModel.champions, id: \.id) { championViewmodel in
                    HomeItem(viewModel: championViewmodel)
                }
            }
            .edgesIgnoringSafeArea(.bottom)
            .onAppear {
                viewModel.fetchData()
            }
        }
    }
}

struct HomeList_Previews: PreviewProvider {
    static var previews: some View {
        HomeList()
    }
}
