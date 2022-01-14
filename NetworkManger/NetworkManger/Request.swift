//
//  Request.swift
//  Network
//
//  Created by Ahmed Naser on 08/01/2022.
//

import Foundation

public enum RequestMethod: String {
    case GET
    case POST
}

public struct Request {
    private let url: URL
    
    public init(url: URL) {
        self.url = url
    }
}

extension Request {
    var urlRequest: URLRequest {
        return  URLRequest(url: url)
    }
}
