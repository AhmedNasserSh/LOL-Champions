//
//  SpellsRepo.swift
//  Home
//
//  Created by Ahmed Naser on 11/01/2022.
//

import Foundation
import Common
import Cache

protocol ChampionInfoRepoType {
    func fetchChampionInfo(championName: String) async throws -> ChampionInfoResponse
}

struct ChampionInfoRepo: ChampionInfoRepoType {
    @Inject private var service: ChampionInfoServiceType
    @Inject private var storage: SpellStoreType
    
    func fetchChampionInfo(championName: String) async throws -> ChampionInfoResponse {
        if let cached = storage.fetchSpells(for: championName) ,
           !cached.data.isEmpty {
            return cached
        }
        
        let response =  try await service.fetchChampionInfo(championName: championName)
        let spells = response.data[championName]?.spells ?? []
        storage.saveSpells(for: championName, spells: spells)
        return response        
    }
}
