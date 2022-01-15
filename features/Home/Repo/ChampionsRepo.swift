//
//  ChampionsRepo.swift
//  Home
//
//  Created by Ahmed Naser on 11/01/2022.
//

import Foundation
import Common
protocol ChampionsRepoType {
    func fetchChampions() async throws -> ChampionsResponse
}

struct ChampionsRepo: ChampionsRepoType {
    
   @Inject private var service: ChampionsServiceType
    
    func fetchChampions() async throws -> ChampionsResponse {
        return try await service.fetchChampions()
    }
}
