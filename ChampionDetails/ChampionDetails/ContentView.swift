//
//  ContentView.swift
//  ChampionDetails
//
//  Created by Ahmed Naser on 15/01/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack {
                Image("Aatrox")
                    .resizable()
                    .frame(height: 200)
                    .padding(2)
            }
        }
        .background(Color(red: 0.067, green: 0.098, blue: 0.133))

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
