//
//  AppDiIntilizer.swift
//  LOLChampions
//
//  Created by Ahmed Naser on 12/01/2022.
//

import Foundation
import Home

class AppDiIntilizer {
    
    func initDependencies() {
        HomeDIIntilizer().buildContainer()
    }
}
