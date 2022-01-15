//
//  HomeHeader.swift
//  Home
//
//  Created by Ahmed Naser on 09/01/2022.
//

import SwiftUI

struct HomeHeader: View {
    var body: some View {
        VStack {

            Spacer()
            Image(imageName: "logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame( height: 50)
        }
        .padding()
        .frame(height: 20)
    }
}

struct HomeHeader_Previews: PreviewProvider {
    static var previews: some View {
        HomeHeader()
    }
}
