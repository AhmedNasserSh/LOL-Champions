//
//  ImageDownloaderService.swift
//  Home
//
//  Created by Ahmed Naser on 09/01/2022.
//

import Foundation
import UIKit
import Common
import NetworkManger

protocol ImageDownloaderServiceType: NetworkServiceType {
    func downloadImage(champion: String) async throws -> UIImage
}

struct ImageDownloaderService: ImageDownloaderServiceType {
    @Inject var client: NetworkClientType 
    
    func downloadImage(champion: String) async throws -> UIImage {
        guard let url = URL(string: Constants.Network.championImage.rawValue + "\(champion)") else {
            throw ImageDownloadError.badImage
        }
        
        let imageRequest = Request(url: url)
        let imageResponse = try await client.makeRequest(imageRequest)
        
        guard let image = UIImage(data: imageResponse) else {
            throw ImageDownloadError.badImage
        }
        return image
    }
}
