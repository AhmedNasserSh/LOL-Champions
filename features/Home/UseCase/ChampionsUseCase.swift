//
//  ChampionsUseCase.swift
//  Home
//
//  Created by Ahmed Naser on 11/01/2022.
//

import Foundation
import Common
protocol ChampionsUseCaseType {
    func fetchChampions() async throws -> [Champion]
}

struct ChampionsUseCase: ChampionsUseCaseType {
    @Inject private var repo: ChampionsRepoType
    
    func fetchChampions() async throws -> [Champion] {
        return try await repo
            .fetchChampions()
            .data
            .map { return $1}
            .sorted(by: { lhs, rhs in
                lhs < rhs
            })
        
    }
    
}
