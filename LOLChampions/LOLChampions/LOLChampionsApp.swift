//
//  LOLChampionsApp.swift
//  LOLChampions
//
//  Created by Ahmed Naser on 08/01/2022.
//

import SwiftUI

@main
struct LOLChampionsApp: App {
    init() {
        updateNavigationBarColor()
        AppDiIntilizer().initDependencies()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    private func updateNavigationBarColor() {
        let navigationColor = UIColor(Color(red: 0.067, green: 0.098, blue: 0.133))
        UINavigationBar.appearance().barTintColor = navigationColor
        UINavigationBar.appearance().backgroundColor = navigationColor
    }
}
