//
//  SpellService.swift
//  ChampionDetails
//
//  Created by Ahmed Naser on 15/01/2022.
//

import Foundation
import NetworkManger
import Common

protocol  ChampionInfoServiceType: NetworkServiceType {
    func fetchChampionInfo(championName: String) async throws -> ChampionInfoResponse
}

struct ChampionInfoService: ChampionInfoServiceType {
    @Inject var client: NetworkClientType
    @Inject private var decoder: JSONDecoder
    
    func fetchChampionInfo(championName: String) async throws -> ChampionInfoResponse {
        let championInfoPath = ChampionDetailsConstants.Network.championInfoDataDragon.rawValue
        guard let url = URL(string: "\(championInfoPath)\(championName).json") else {
            throw NetworkError.badRequest
        }
        
        let championsRequest = Request(url: url)
        
        let response = try await client.makeRequest(championsRequest)
        
        return try decoder.decode(ChampionInfoResponse.self, from: response)
    }
    
}
