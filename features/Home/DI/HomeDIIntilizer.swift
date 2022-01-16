//
//  HomeDIIntilizer.swift
//  Home
//
//  Created by Ahmed Naser on 12/01/2022.
//

import Foundation
import Swinject
import Common

public class HomeDIIntilizer {
    private let container: Container
    
    public init(container: Container) {
        self.container = container
    }
    
    public func buildContainer() {
        registerDecoder() 
        registerImage()
        registerChampions()
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
