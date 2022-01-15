//
//  SpellItemViewModel.swift
//  ChampionDetails
//
//  Created by Ahmed Naser on 15/01/2022.
//

import Foundation
import UIKit
import Common

@MainActor
class SpellItemViewModel: ObservableObject, Identifiable {
    @Inject private var imageUseCase: ChampionImageDownloaderUseCaseType
    private let spell: Spell
    @Published var image: UIImage =  UIImage(name: "temp")
    @Published var name =  ""
    @Published var description =  ""

    let id: UUID  = UUID()
    
    init(spell: Spell) {
        self.spell = spell
    }
    
    func getChampionData() {
        Task {
            name = spell.name
            description = spell.description
            do {
                image = try await imageUseCase.spellImage(for: spell.image.full)
            } catch {
                image =  UIImage(name: "temp")
            }
        }
    }
    
}
