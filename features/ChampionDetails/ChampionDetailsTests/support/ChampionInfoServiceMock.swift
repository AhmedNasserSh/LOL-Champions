//
//  ChampionInfoServiceMock.swift
//  ChampionDetailsTests
//
//  Created by Ahmed Naser on 15/01/2022.
//

import Foundation
@testable import ChampionDetails
@testable import Common
@testable import NetworkManger

struct ChampionInfoServiceMock: ChampionInfoServiceType {
    @Inject var client: NetworkClientType
    
    func fetchChampionInfo(championName: String) async throws -> ChampionInfoResponse {
        let spell = Spell(name: "Magic",
                          description: "",
                          image: SpellImage(full: ""))
        let championInfo = ChampionInfo(spells: [spell] )
        
        return ChampionInfoResponse(data: ["Magic": championInfo])
    }

}
