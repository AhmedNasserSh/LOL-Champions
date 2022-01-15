//
//  ChampionRepoMock.swift
//  HomeTests
//
//  Created by Ahmed Naser on 15/01/2022.
//

import Foundation
@testable import Home
@testable import NetworkManger
@testable import Common

struct ChampionRepoMock: ChampionsRepoType {
    @Inject var service: ChampionsServiceType
    
    func fetchChampions() async throws -> ChampionsResponse {
        return try await service.fetchChampions()
    }
    
}
