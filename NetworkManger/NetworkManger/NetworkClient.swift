//
//  NetworkClient.swift
//  Network
//
//  Created by Ahmed Naser on 08/01/2022.
//

import Foundation

public class NetworkClient: NetworkClientType {
    public init() {}
    
    public func makeRequest(_ request: Request) async throws -> Data {
        
        let (data, response) = try await URLSession.shared.data(for: request.urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == StatusCode.accepted.rawValue else {
            throw NetworkError.server
        }
        
        return data
    }
}
