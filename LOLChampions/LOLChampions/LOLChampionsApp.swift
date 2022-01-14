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
        AppDiIntilizer().initDependencies()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
