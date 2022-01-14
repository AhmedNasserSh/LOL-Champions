//
//  HomeViewModel.swift
//  Home
//
//  Created by Ahmed Naser on 11/01/2022.
//

import Foundation
import Common
import UIKit

@MainActor
class HomeViewModel: ObservableObject {
    @Inject private var championsUseCase: ChampionsUseCaseType
    
    @Published var champions: [HomeItemViewModel] = []
    
    func fetchData() {
        Task {
            champions = try await championsUseCase.fetchCahmpions()
                .map { HomeItemViewModel(champion: $0)}
        }
    }
}
