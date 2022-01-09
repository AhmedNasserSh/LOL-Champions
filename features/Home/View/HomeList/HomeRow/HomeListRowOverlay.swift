//
//  HomeListRowOverlay.swift
//  Home
//
//  Created by Ahmed Naser on 09/01/2022.
//

import SwiftUI
import Common

struct HomeListRowOverlay: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.title)
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .padding()
            .background(Color.black)
            .opacity(0.7)
            .cornerRadius(20, corners: [.bottomLeft, .bottomRight])
    }
}

struct HomeListRowOverlay_Previews: PreviewProvider {
    static var previews: some View {
        HomeListRowOverlay(text: "Ahari")
    }
}
