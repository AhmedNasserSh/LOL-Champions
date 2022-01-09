//
//  NetworkClient.swift
//  Network
//
//  Created by Ahmed Naser on 08/01/2022.
//

import Foundation

public class NetworkClient: NetworkClientType {
    public func makeRequest<Output>(_ request: Request<Output>) async throws -> Output {
        let (data, response) = try await URLSession.shared.data(for: request.request)
        guard (response as? HTTPURLResponse)?.statusCode == StatusCode.accepted.rawValue else {
            throw NetworkError.server
        }
        guard let model = request.parse(data) else {
            throw NetworkError.parse
        }
        return model
    }
}
