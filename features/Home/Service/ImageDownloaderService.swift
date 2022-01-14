//
//  ImageDownloaderService.swift
//  Home
//
//  Created by Ahmed Naser on 09/01/2022.
//

import Foundation
import NetworkManger
import UIKit
import Common

protocol ImageDownloaderServiceType: NetworkServiceType {
    func downloadImage(champion: String) async throws -> UIImage
}

struct ImageDownloaderService: ImageDownloaderServiceType {
    @Inject private var networkClient: NetworkClientType
    var client: NetworkClientType {networkClient}
    
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
