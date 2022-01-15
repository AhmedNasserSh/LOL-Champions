//
//  ChampionDetailsDIIntilizer.swift
//  Home
//
//  Created by Ahmed Naser on 12/01/2022.
//

import Foundation
import Swinject
import NetworkManger
import Common

public class ChampionDetailsDIIntilizer {
    private let container: Container 
    
    public init(container: Container) {
        self.container = container
    }
    
    public func buildContainer() {
        registerDecoder() 
        registerNetworkClient()
        registerImage()
        registerChampionSpell()
    }

}
// MARK: Network
extension ChampionDetailsDIIntilizer {
    private  func registerNetworkClient() {
        container.register(NetworkClientType.self) { _  in
            return NetworkClient()
        }.inObjectScope(.transient)
        
    }
}

// MARK: Decoder
extension ChampionDetailsDIIntilizer {
    private func registerDecoder() {
        container.register(JSONDecoder.self) { _  in
            return JSONDecoder()
        }.inObjectScope(.transient)
    }
}

// MARK: Image
extension ChampionDetailsDIIntilizer {
    private  func registerImage() {
        container.register(ChampionImageDownloadServiceType.self) { _  in
            return ChampionImageDownloaderService()
        }.inObjectScope(.container)
        
        container.register(ImageDownloaderRepo.self) { _  in
            return ImageDownloaderRepo()
        }.inObjectScope(.container)
        
        container.register(ChampionImageDownloaderUseCaseType.self) { _  in
            return ChampionImageDownloaderUseCase()
        }.inObjectScope(.container)
    }
}

// MARK: Champions
extension ChampionDetailsDIIntilizer {
    private  func registerChampionSpell() {
        container.register(ChampionInfoServiceType.self) { _  in
            return ChampionInfoService()
        }.inObjectScope(.container)
        
        container.register(ChampionInfoRepoType.self) { _  in
            return ChampionInfoRepo()
        }.inObjectScope(.container)
        
        container.register(ChampionInfoUseCaseType.self) { _  in
            return ChampionInfoUseCase()
        }.inObjectScope(.container)
    }
}
