//
//  ChampionDetailsViewModel.swift
//  ChampionDetails
//
//  Created by Ahmed Naser on 15/01/2022.
//

import Foundation
import Common
import UIKit

@MainActor
class ChampionDetailsViewModel: ObservableObject {
    private let champion: Champion
    @Inject private var championInfoUseCase: ChampionInfoUseCaseType
    @Inject private var championImageUseCase: ChampionImageDownloaderUseCaseType
    
    @Published var image = UIImage()
    @Published var name = ""
    @Published var title = ""
    @Published var bio = ""
    @Published var tags = [String]()
    @Published var spells = [SpellItemViewModel]()
    
    init(champion: Champion) {
        self.champion = champion
    }
    
    func fetchData() {
        Task {
            name = champion.name
            title = champion.title
            bio = champion.blurb
            tags = champion.tags
            image = try await championImageUseCase.image(for: champion.name)
            spells = try await championInfoUseCase.fetchCahmpionInfo(championName: champion.name)
                .map {SpellItemViewModel(spell: $0)}
        }
    }
}
