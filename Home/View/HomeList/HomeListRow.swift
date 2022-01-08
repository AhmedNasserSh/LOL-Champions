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
            Image("Ahri")
                .resizable()
                .scaledToFit()
                .overlay(CalloutTextView(), alignment: .bottomLeading)
        }
        .frame(maxHeight: 300)
        .padding(8)
    }
}

struct HomeListRow_Previews: PreviewProvider {
    static var previews: some View {
        HomeListRow()
    }
}
