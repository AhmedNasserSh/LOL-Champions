//
// NetworkClientProtocol.swift
//  Network
//
//  Created by Ahmed Naser on 08/01/2022.
//

import Foundation
public protocol NetworkClientType {
    func makeRequest(_ request: Request) async throws -> Data
}

enum StatusCode: Int {
    case accepted = 200
}
