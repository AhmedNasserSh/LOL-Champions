//
//  HomeViewModel.swift
//  Home
//
//  Created by Ahmed Naser on 11/01/2022.
//

import Foundation
import Common
import UIKit
import SwiftUI

@MainActor
class HomeViewModel: ObservableObject {
    @Inject private var championsUseCase: ChampionsUseCaseType
    
    @Published var champions: [HomeItemViewModel] = []
    @State var selectedChampion: Champion?
    
    func fetchData() {
        Task {
            champions = try await championsUseCase.fetchChampions()
                .map { HomeItemViewModel(champion: $0)}
        }
    }
}
