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
    @Published public var image: UIImage =  UIImage(name: "temp")
    @Published public var name =  ""

    let id: UUID  = UUID()
    
    init(champion: Champion) {
        self.champion = champion
    }
    
    func getimage() {
        Task {
            name = champion.name
            image = try await imageUseCase.image(for: champion.image.full)
        }
    }
    
}
