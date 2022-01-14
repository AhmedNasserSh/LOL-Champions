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
    private let gridSections: [GridItem] = Array(repeating: .init(.flexible()), count: 2)

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: gridSections, spacing: 5) {
                ForEach(viewModel.champions, id: \.id) { champion in
                    HomeItem(viewModel: champion)
                }
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .onAppear {
            viewModel.fetchData()
        }
    }
        
}

struct HomeList_Previews: PreviewProvider {
    static var previews: some View {
        HomeList()
    }
}
