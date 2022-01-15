//
//  ImageDownloaderRepo.swift
//  Home
//
//  Created by Ahmed Naser on 11/01/2022.
//

import Foundation
import UIKit
import Common

actor ImageDownloaderRepo {
    private enum ImageStatus {
        case downloading(_ task: Task<UIImage, Error>)
        case downloaded(_ image: UIImage)
    }
    
    @Inject private var service: ChampionImageDownloadServiceType
    private var cache: [URL: ImageStatus] = [:]
    
    func image(for imageURL: URL) async throws -> UIImage {
        if let imageStatus = cache[imageURL] {
            switch imageStatus {
            case .downloading(let task):
                return try await task.value
            case .downloaded(let image):
                return image
            }
        }
        
        let task = Task {
            try await downloadImage(imageURL: imageURL)
        }
        
        cache[imageURL] = .downloading(task)
        
        do {
            let image = try await task.value
            cache[imageURL] = .downloaded(image)
            return image
        } catch {
            cache.removeValue(forKey: imageURL)
            throw error
        }
    }
    
    private func downloadImage(imageURL: URL) async throws -> UIImage {
        return try await service.downloadImage(imageURL: imageURL)
    }
}
