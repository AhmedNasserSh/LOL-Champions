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

class AppDiIntilizer {
    private let container = Container()
    
    func initDependencies() {
        AppResolver.shared.setDependencyContainer(container)
        HomeDIIntilizer(container: container).buildContainer()
        ChampionDetailsDIIntilizer(container: container).buildContainer()
    }
    
}
