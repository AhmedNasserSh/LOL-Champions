//
//  SpellsRepo.swift
//  Home
//
//  Created by Ahmed Naser on 11/01/2022.
//

import Foundation
import Common

protocol ChampionInfoRepoType {
    func fetchCahmpionInfo(championName: String) async throws -> ChampionInfoResponse
}

struct ChampionInfoRepo: ChampionInfoRepoType {
    
   @Inject private var service: ChampionInfoServiceType
    
    func fetchCahmpionInfo(championName: String) async throws -> ChampionInfoResponse {
        return try await service.fetchCahmpionInfo(championName: championName)
    }
}
