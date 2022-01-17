//
//  Champion.swift
//  Home
//
//  Created by Ahmed Naser on 09/01/2022.
//

import Foundation

public struct ChampionsResponse: Codable {
    public let data: [String: Champion]
    
    public init(data: [String: Champion]) {
        self.data = data
    }
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

    public init(id: String,
                name: String,
                title: String,
                blurb: String,
                tags: [String],
                image: ChampionImage) {
        self.id = id
        self.name = name
        self.title = title
        self.blurb = blurb
        self.tags = tags
        self.image = image
        key = ""
        info = ChampionInfo()
    }
    
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
    public init() {
        attack = 0
        defense = 0
        magic = 0
        difficulty = 0
    }
}

public struct ChampionImage: Codable {
    public let full: String
    
    public init(full: String) {
        self.full = full
    }
}
