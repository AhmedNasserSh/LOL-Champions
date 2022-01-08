//
//  ContentView.swift
//  App
//
//  Created by Ahmed Naser on 07/01/2022.
//

import SwiftUI
import ChampionDetails
import Home

struct ContentView: View {
    var body: some View {
        HomeGridView()
        ChampionDetailsView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
