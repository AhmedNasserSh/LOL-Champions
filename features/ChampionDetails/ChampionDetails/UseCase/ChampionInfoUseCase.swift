//
//  ChampionInfoUseCase.swift
//  Home
//
//  Created by Ahmed Naser on 11/01/2022.
//

import Foundation
import Common

protocol ChampionInfoUseCaseType {
    func fetchChampionInfo(championName: String) async throws -> [Spell]
}

struct ChampionInfoUseCase: ChampionInfoUseCaseType {
    @Inject private var repo: ChampionInfoRepoType
    
    func fetchChampionInfo(championName: String) async throws -> [Spell] {
        return try await repo
            .fetchChampionInfo(championName: championName)
            .data
            .flatMap { return $1.spells}
        
    }
    
}
