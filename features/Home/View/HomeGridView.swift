//
//  HomeGridView.swift
//  Home
//
//  Created by Ahmed Naser on 08/01/2022.
//

import SwiftUI
import NetworkManger
import Common

public struct HomeGridView: View {
    @Inject var viewModel: HomeViewModel
    
    public init() {
        
    }
    
    public var body: some View {
        VStack {
            HomeHeader()
            HomeList(items: viewModel.champions)
        }
        .background(
            Image(imageName: "background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        )
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct HomeGridView_Previews: PreviewProvider {
    static var previews: some View {
        HomeGridView()
    }
}
