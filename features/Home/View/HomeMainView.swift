//
//  HomeMainView.swift
//  Home
//
//  Created by Ahmed Naser on 08/01/2022.
//

import SwiftUI
import NetworkManger
import Common

public struct HomeMainView: View {

    public init() {}
    
    public var body: some View {
        VStack {
            HomeHeader()
            HomeList()
        }
        .background(
            Image(imageName: "background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        )
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}
