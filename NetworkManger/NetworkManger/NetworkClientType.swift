//
// NetworkClientProtocol.swift
//  Network
//
//  Created by Ahmed Naser on 08/01/2022.
//

import Foundation
@MainActor
public protocol NetworkClientType {
    func makeRequest<Output>(_ request: Request<Output>) async throws -> Output
}

enum StatusCode: Int {
    case accepted = 200
}
