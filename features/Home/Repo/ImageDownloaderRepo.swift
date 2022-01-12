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
    
    @Inject private var service: ImageDownloaderServiceType
    private var cache: [String: ImageStatus] = [:]
    
    func image(for champion: String) async throws -> UIImage {
        if let imageStatus = cache[champion] {
            switch imageStatus {
            case .downloading(let task):
                return try await task.value
            case .downloaded(let image):
                return image
            }
        }
        
        let task = Task {
            try await downloadImage(champion: champion)
        }
        
        cache[champion] = .downloading(task)
        
        do {
            let image = try await task.value
            cache[champion] = .downloaded(image)
            return image
        } catch {
            cache.removeValue(forKey: champion)
            throw error
        }
    }
    
    private func downloadImage(champion: String) async throws -> UIImage {
        return try await service.downloadImage(champion: champion)
    }
}
