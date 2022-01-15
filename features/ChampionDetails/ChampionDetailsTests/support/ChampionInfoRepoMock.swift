//
//  ChampionInfoRepoMock.swift
//  ChampionDetailsTests
//
//  Created by Ahmed Naser on 15/01/2022.
//

import Foundation
@testable import ChampionDetails
@testable import Common

struct ChampionInfoRepoMock: ChampionInfoRepoType {
    @Inject private var service: ChampionInfoServiceType
    
    func fetchChampionInfo(championName: String) async throws -> ChampionInfoResponse {
        return try await service.fetchChampionInfo(championName: championName)
    }
    
}
