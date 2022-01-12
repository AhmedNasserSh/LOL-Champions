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

class ImageDownloaderService: ImageDownloaderServiceType {
    @Inject private var networkClient: NetworkClientType
    var client: NetworkClientType {networkClient}
    
    func downloadImage(champion: String) async throws -> UIImage {
        guard let url = URL(string: Constants.Network.championImage.rawValue + "\(champion)") else {
            throw ImageDownloadError.badImage
        }
        
        let imageRequest = Request<UIImage>(url: url) { data in
            guard let image = UIImage(data: data) else {
                throw ImageDownloadError.badImage
            }
            return image
        }
        
        return try await client.makeRequest(imageRequest)
    }
}
