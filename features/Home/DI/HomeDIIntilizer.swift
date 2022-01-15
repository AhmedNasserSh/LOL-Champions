//
//  HomeDIIntilizer.swift
//  Home
//
//  Created by Ahmed Naser on 12/01/2022.
//

import Foundation
import Swinject
import NetworkManger
import Common
import AppCoordinator

public class HomeDIIntilizer {
    private let container: Container
    
    public init(container: Container) {
        self.container = container
    }
    
    public func buildContainer() {
        registerCoordinator()
        registerDecoder() 
        registerNetworkClient()
        registerImage()
        registerChampions()
    }

}
// MARK: Coordinator
extension HomeDIIntilizer {
    private  func registerCoordinator() {
        container.register(AppCoordinator.self) { _  in
            return AppCoordinator()
        }.inObjectScope(.transient)
        
    }
}

// MARK: Network
extension HomeDIIntilizer {
    private  func registerNetworkClient() {
        container.register(NetworkClientType.self) { _  in
            return NetworkClient()
        }.inObjectScope(.transient)
        
    }
}

// MARK: Decoder
extension HomeDIIntilizer {
    private func registerDecoder() {
        container.register(JSONDecoder.self) { _  in
            return JSONDecoder()
        }.inObjectScope(.transient)
    }
}

// MARK: Image
extension HomeDIIntilizer {
    private  func registerImage() {
        container.register(ImageDownloaderServiceType.self) { _  in
            return ImageDownloaderService()
        }.inObjectScope(.container)
        
        container.register(ImageDownloaderRepo.self) { _  in
            return ImageDownloaderRepo()
        }.inObjectScope(.container)
        
        container.register(ImageDownloaderUseCaseType.self) { _  in
            return ImageDownloaderUseCase()
        }.inObjectScope(.container)
        
    }
}

// MARK: Champions
extension HomeDIIntilizer {
    private  func registerChampions() {
        container.register(ChampionsServiceType.self) { _  in
            return ChampionsService()
        }.inObjectScope(.container)
        
        container.register(ChampionsRepoType.self) { _  in
            return ChampionsRepo()
        }.inObjectScope(.container)
        
        container.register(ChampionsUseCaseType.self) { _  in
            return ChampionsUseCase()
        }.inObjectScope(.container)
    }
}
