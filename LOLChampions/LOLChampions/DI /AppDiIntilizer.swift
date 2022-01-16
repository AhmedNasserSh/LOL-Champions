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
import NetworkManger
import SwiftUI
import AppCoordinator

class AppDiIntilizer {
    private let container = Container()
    
    func initDependencies() {
        AppResolver.shared.setDependencyContainer(container)
        NetwrokDIIntilizer(container: container).buildContainer()
        AppCoordinatorDIIntilizer(container: container).buildContainer()
        HomeDIIntilizer(container: container).buildContainer()
        ChampionDetailsDIIntilizer(container: container).buildContainer()
    }
    
}
