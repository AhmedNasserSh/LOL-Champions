//
//  AppDiIntilizer.swift
//  LOLChampions
//
//  Created by Ahmed Naser on 12/01/2022.
//

import Foundation
import Swinject
import Home
import ChampionDetails
import Common
import SwiftUI

class AppDiIntilizer {
    private let container = Container()
    
    init() {
        updateNavigationBarColor() 
    }
    
    func initDependencies() {
        AppResolver.shared.setDependencyContainer(container)
        HomeDIIntilizer(container: container).buildContainer()
        ChampionDetailsDIIntilizer(container: container).buildContainer()
    }
    
    private func updateNavigationBarColor() {
        let navigationColor = UIColor(Color(red: 0.067, green: 0.098, blue: 0.133))
        UINavigationBar.appearance().barTintColor = navigationColor
        UINavigationBar.appearance().backgroundColor = navigationColor
    }
    
}
