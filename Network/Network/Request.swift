//
//  Request.swift
//  Network
//
//  Created by Ahmed Naser on 08/01/2022.
//

import Foundation

public struct Request<Output> {
    private let url: URL
    let parse: (Data) -> Output?
    public var request: URLRequest {
        return URLRequest(url: url)
    }
    init(url: URL, parse: @escaping (Data) -> Output?) {
        self.url = url
        self.parse = parse
    }
}
