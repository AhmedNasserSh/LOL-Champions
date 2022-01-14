//
//  ImageDownloaderUseCase.swift
//  Home
//
//  Created by Ahmed Naser on 11/01/2022.
//

import Foundation
import UIKit
import Common

protocol ImageDownloaderUseCaseType {
    func image(for champion: String) async throws -> UIImage
}

struct ImageDownloaderUseCase: ImageDownloaderUseCaseType {
   @Inject private var repo: ImageDownloaderRepo

    func image(for champion: String) async throws -> UIImage {
        let imageName = champion.components(separatedBy: ".")[0]
        let imagePath = "\(imageName)_0.jpg"
        return try await repo.image(for: imagePath)
    }
}
