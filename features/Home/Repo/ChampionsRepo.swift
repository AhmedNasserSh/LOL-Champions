//
//  ChampionsRepo.swift
//  Home
//
//  Created by Ahmed Naser on 11/01/2022.
//

import Foundation
import Common
protocol ChampionsRepoType {
    func fetchCahmpions() async throws -> ChampionsResponse
}

struct ChampionsRepo: ChampionsRepoType {
    
   @Inject private var service: ChampionsServiceType
    
    func fetchCahmpions() async throws -> ChampionsResponse {
        return try await service.fetchCahmpions()
    }
}
