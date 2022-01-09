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
        VStack(alignment: .center) {
            Image(imageName: "Annie")
                .resizable()
                .cornerRadius(20)
                .scaledToFit()
                .overlay(HStack {
                    Text("Ahari")
                        .font(.title)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.black)
                        .opacity(0.7)
                        .cornerRadius(20)
                }.cornerRadius(10, corners: [.topLeft, .bottomRight])
                         
                         
                         , alignment: .bottom)
                .rotation3DEffect(.degrees(5), axis: (x: 0, y: 1, z: 0))
                .padding()
        }
    }
}

struct HomeListRow_Previews: PreviewProvider {
    static var previews: some View {
        HomeListRow()
    }
}
