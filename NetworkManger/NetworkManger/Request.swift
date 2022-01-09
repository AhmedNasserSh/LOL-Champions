//
//  Request.swift
//  Network
//
//  Created by Ahmed Naser on 08/01/2022.
//

import Foundation

public struct Request<Output> {
    private let url: URL
    public let parse: (Data) throws -> Output?
    
    public var request: URLRequest {
        return URLRequest(url: url)
    }
    
    public init(url: URL, parse: @escaping (Data) throws -> Output?) {
        self.url = url
        self.parse = parse
    }
    
}
