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

class ChampionsService: ChampionsServiceType {
    private lazy var decoder = JSONDecoder()
    
    @Inject private var networkClient: NetworkClientType
    var client: NetworkClientType {networkClient}
    
    func fetchCahmpions() async throws -> ChampionsResponse {
        guard let url = URL(string: Constants.Network.championsDataDragon.rawValue) else {
            throw ChampionDownloadError.badRequest
        }
        
        let championsRequest = Request<ChampionsResponse>(url: url) { [weak self] data in
            guard let self = self else {throw ChampionDownloadError.badRequest}
            let championsResponse = try self.decoder.decode(ChampionsResponse.self, from: data)
            return championsResponse
        }
        
        return try await client.makeRequest(championsRequest)
    }
    
}
