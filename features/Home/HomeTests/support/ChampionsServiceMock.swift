//
//  ChampionsServiceMock.swift
//  HomeTests
//
//  Created by Ahmed Naser on 15/01/2022.
//

import Foundation
@testable import Home
@testable import NetworkManger
@testable import Common

struct ChampionsServiceMock: ChampionsServiceType {

    @Inject var client: NetworkClientType

    func fetchChampions() async throws -> ChampionsResponse {
        let champion = Champion(id: "",
                                key: "",
                                name: "Jinx",
                                title: "",
                                blurb: "",
                                image: ChampionImage(full: ""),
                                tags: [],
                                info: ChampionInfo(attack: 0, defense: 0, magic: 0, difficulty: 0))
        
        let champion2 = Champion(id: "",
                                key: "",
                                name: "Ahari",
                                title: "",
                                blurb: "",
                                image: ChampionImage(full: ""),
                                tags: [],
                                info: ChampionInfo(attack: 0, defense: 0, magic: 0, difficulty: 0))
        
        return ChampionsResponse(data: ["Jinx": champion,
                                        "Ahari": champion2])
    }

}
