//
//  ChampionsService.swift
//  Home
//
//  Created by Ahmed Naser on 11/01/2022.
//

import Foundation
import NetworkManger
import Common

protocol ChampionsServiceType: NetworkServiceType {
    func fetchCahmpions() async throws -> ChampionsResponse
}

struct ChampionsService: ChampionsServiceType {
    @Inject private var networkClient: NetworkClientType
    var client: NetworkClientType {networkClient}
    private let decoder = JSONDecoder()
    
    func fetchCahmpions() async throws -> ChampionsResponse {
        guard let url = URL(string: Constants.Network.championsDataDragon.rawValue) else {
            throw ChampionDownloadError.badRequest
        }
        
        let championsRequest = Request(url: url)
        
        let response = try await client.makeRequest(championsRequest)
        
        return try decoder.decode(ChampionsResponse.self, from: response)
    }
    
}
