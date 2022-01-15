//
//  ChampionImageDownloaderUseCase.swift
//  Home
//
//  Created by Ahmed Naser on 11/01/2022.
//

import Foundation
import UIKit
import Common

protocol ChampionImageDownloaderUseCaseType {
    func image(for image: String) async throws -> UIImage
    func spellImage(for image: String) async throws -> UIImage
}

struct ChampionImageDownloaderUseCase: ChampionImageDownloaderUseCaseType {
   @Inject private var repo: ImageDownloaderRepo

    func image(for image: String) async throws -> UIImage {
        let imageName = image.components(separatedBy: ".")[0]
        let imagePath = "\(imageName)_0.jpg"
        let cardPath = ChampionDetailsConstants.Network.championCardImage.rawValue
        guard let url = URL(string: cardPath + imagePath) else {
            throw ImageDownloadError.badImage
        }
        
        return try await repo.image(for: url)
    }
    
    func spellImage(for image: String) async throws -> UIImage {
        let cardPath = ChampionDetailsConstants.Network.championSpellImage.rawValue
        guard let url = URL(string: cardPath + image)
        else {
            throw ImageDownloadError.badImage
        }
        
        return try await repo.image(for: url)
    }
}
