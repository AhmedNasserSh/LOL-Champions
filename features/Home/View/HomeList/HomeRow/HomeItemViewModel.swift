//
//  HomeRowViewModel.swift
//  Home
//
//  Created by Ahmed Naser on 12/01/2022.
//

import Foundation
import UIKit
import Common

@MainActor
class HomeItemViewModel: ObservableObject, Identifiable {
    @Inject private var imageUseCase: ImageDownloaderUseCaseType
    private let champion: Champion
    @Published var image: UIImage =  UIImage(name: "temp")
    @Published var name =  ""
    
    let id: UUID  = UUID()
    
    init(champion: Champion) {
        self.champion = champion
    }
    
    func getChampionData() {
        Task {
            name = champion.name
            do {
                image = try await imageUseCase.image(for: champion.image.full)
            } catch {
                image =  UIImage(name: "temp")
            }
        }
    }
    
}
