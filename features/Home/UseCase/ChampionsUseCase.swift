//
//  ChampionsUseCase.swift
//  Home
//
//  Created by Ahmed Naser on 11/01/2022.
//

import Foundation
import Common
protocol ChampionsUseCaseType {
    func fetchCahmpions() async throws -> [Champion]
}

class ChampionsUseCase: ChampionsUseCaseType {
    @Inject private var repo: ChampionsRepoType
    
    func fetchCahmpions() async throws -> [Champion] {
        return try await repo
            .fetchCahmpions()
            .data
            .map({ (_, champion) in
            return champion
        })
    }
    
}
