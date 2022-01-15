//
//  Champion.swift
//  Home
//
//  Created by Ahmed Naser on 09/01/2022.
//

import Foundation

public struct ChampionsResponse: Codable {
    public let data: [String: Champion]
}

public struct Champion: Codable, Comparable {
    
    public let id: String
    public let key: String
    public let name: String
    public let title: String
    public let blurb: String
    public let image: ChampionImage
    public let tags: [String]
    public let info: ChampionInfo

    public static func < (lhs: Champion, rhs: Champion) -> Bool {
        return lhs.name < rhs.name
    }
    
    public static func == (lhs: Champion, rhs: Champion) -> Bool {
        return lhs.name == rhs.name
    }
}

public struct ChampionInfo: Codable {
    public let attack: Int
    public let defense: Int
    public let magic: Int
    public let difficulty: Int
}

public struct ChampionImage: Codable {
    public let full: String
}
