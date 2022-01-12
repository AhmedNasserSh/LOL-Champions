//
//  Container.swift
//  Home
//
//  Created by Ahmed Naser on 12/01/2022.
//

import Foundation
import Swinject
import NetworkManger
import Common

public class DIIntilizer {
    private let container = Container()
    
    func buildContainer() {
        AppResolver.shared.setDependencyContainer(container)
        registerNetworkClient()
        registerImage()
        registerChampions()
        registerHomeViewModel()
    }

}
// MARK: Network
extension DIIntilizer {
    private  func registerNetworkClient() {
        container.register(NetworkClientType.self) { _  in
            return NetworkClient()
        }
        
    }
}

// MARK: Image
extension DIIntilizer {
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
extension DIIntilizer {
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
extension DIIntilizer {
    func registerHomeViewModel() {
        container.register(HomeViewModel.self) { _  in
            return  HomeViewModel()
        }
    }
}
