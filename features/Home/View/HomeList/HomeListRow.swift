//
//  HomeListRow.swift
//  Home
//
//  Created by Ahmed Naser on 07/01/2022.
//

import Common
import SwiftUI

struct HomeListRow: View {
    var body: some View {
        VStack {
            Image(imageName: "Annie")
                .resizable()
                .scaledToFit()
                .overlay(CalloutTextView(), alignment: .bottomLeading)
                .rotation3DEffect(.degrees(5), axis: (x: 0, y: 1, z: 0))

        }
        .frame(minWidth: 100)
        .cornerRadius(10)
        .padding(8)
    }
}

struct HomeListRow_Previews: PreviewProvider {
    static var previews: some View {
        HomeListRow()
    }
}
