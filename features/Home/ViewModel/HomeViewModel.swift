//
//  HomeViewModel.swift
//  Home
//
//  Created by Ahmed Naser on 11/01/2022.
//

import Foundation
import Common

class HomeViewModel: ObservableObject {
    @Inject private var  imageUseCase: ImageDownloaderUseCaseType
    @Inject private var championsUseCase: ChampionsUseCaseType
    
    @Published var champions: [Champion] = []
    
    func fetchData() async {
        do {
            champions = try await championsUseCase.fetchCahmpions()
        } catch {
            
        }
    }
}
