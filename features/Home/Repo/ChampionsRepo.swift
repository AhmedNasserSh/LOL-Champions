//
//  ChampionsRepo.swift
//  Home
//
//  Created by Ahmed Naser on 11/01/2022.
//

import Foundation
import Common
import Cache

protocol ChampionsRepoType {
    func fetchChampions() async throws -> ChampionsResponse
}

struct ChampionsRepo: ChampionsRepoType {
    @Inject private var service: ChampionsServiceType
    @Inject private var storage: ChampionsStoreType
    
    func fetchChampions() async throws -> ChampionsResponse {
        if let cached = storage.fetchChampions() ,
           !cached.data.isEmpty {
            return cached
        }
        
        let response =  try await service.fetchChampions()
        storage.saveChampions(champions: response.data.compactMap({ (_, value: Champion) in
            return value
        }))
        return response
    }
}
