//
//  ChampionImageDownloadService.swift
//  ChampionDetails
//
//  Created by Ahmed Naser on 15/01/2022.
//

import Foundation
import NetworkManger
import UIKit
import Common

protocol ChampionImageDownloadServiceType: NetworkServiceType {
    func downloadImage(imageURL: URL) async throws -> UIImage
    
}

struct ChampionImageDownloaderService: ChampionImageDownloadServiceType {
    @Inject private var networkClient: NetworkClientType
    var client: NetworkClientType {networkClient}
    
    func downloadImage(imageURL: URL) async throws -> UIImage {
        let imageRequest = Request(url: imageURL)
        let imageResponse = try await client.makeRequest(imageRequest)
        
        guard let image = UIImage(data: imageResponse) else {
            throw ImageDownloadError.badImage
        }
        return image
    }
}
