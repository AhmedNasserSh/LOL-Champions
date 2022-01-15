//
//  Coordinator.swift
//  AppCoordinator
//
//  Created by Ahmed Naser on 15/01/2022.
//

import Foundation
import Common
import ChampionDetails
import SwiftUI

public class AppCoordinator {
    @State public var isNavigationBarHidden: Bool = true

    public init() {}
    
    public func championDetailsView(with champion: Champion) -> some View {
        ChampionDetailsView(champion: champion)
    }
}
