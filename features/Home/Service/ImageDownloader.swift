//
//  ImageService.swift
//  Home
//
//  Created by Ahmed Naser on 09/01/2022.
//

import Foundation
import NetworkManger
import UIKit

actor ImageDownloader {
    private enum ImageStatus {
        case downloading(_ task: Task<UIImage, Error>)
        case downloaded(_ image: UIImage)
    }
    
    private let client: NetworkClientType
    private var cache: [URL: ImageStatus] = [:]
    
    init(client: NetworkClientType) {
        self.client = client
    }
    
    func image(from url: URL) async throws -> UIImage {
        if let imageStatus = cache[url] {
            switch imageStatus {
            case .downloading(let task):
                return try await task.value
            case .downloaded(let image):
                return image
            }
        }
        
        let task = Task {
            try await downloadImage(url: url)
        }
        
        cache[url] = .downloading(task)
        
        do {
            let image = try await task.value
            cache[url] = .downloaded(image)
            return image
        } catch {
            cache.removeValue(forKey: url)
            throw error
        }
    }
    
    private func downloadImage(url: URL) async throws -> UIImage {
        let imageRequest = Request<UIImage>(url: url) { data in
            guard let image = UIImage(data: data) else {
                throw ImageDownloadError.badImage
            }
            return image
        }
        
        return try await client.makeRequest(imageRequest)
    }
}
