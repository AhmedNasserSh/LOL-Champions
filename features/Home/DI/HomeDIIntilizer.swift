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

public class HomeDIIntilizer {
    private let container = Container()
    
    public init() {}
    
    public func buildContainer() {
        AppResolver.shared.setDependencyContainer(container)
        registerNetworkClient()
        registerImage()
        registerChampions()
        registerHomeViewModel()
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

// MARK: Image
extension HomeDIIntilizer {
    private  func registerImage() {
        
        container.register(ImageDownloaderServiceType.self) { _  in
            return ImageDownloaderService()
        }
        
        container.register(ImageDownloaderRepo.self) { _  in
            return ImageDownloaderRepo()
        }
        
        container.register(ImageDownloaderUseCaseType.self) { _  in
            return ImageDownloaderUseCase()
        }
        
    }
}

// MARK: Champions
extension HomeDIIntilizer {
    private  func registerChampions() {
        container.register(ChampionsServiceType.self) { _  in
            return ChampionsService()
        }
        
        container.register(ChampionsRepoType.self) { _  in
            return ChampionsRepo()
        }
        
        container.register(ChampionsUseCaseType.self) { _  in
            return ChampionsUseCase()
        }
    }
}

// MARK: Home
extension HomeDIIntilizer {
    private func registerHomeViewModel() {
//        container.register(HomeViewModel.self) { _  in
//            return  HomeViewModel()
       // }
    }
}
