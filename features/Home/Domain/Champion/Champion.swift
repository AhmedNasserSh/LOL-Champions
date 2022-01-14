//
//  Champion.swift
//  Home
//
//  Created by Ahmed Naser on 09/01/2022.
//

import Foundation
import SwiftUI
import Common

struct ChampionsResponse: Codable {
    let data: [String: Champion]
}

struct Champion: Codable, Comparable {
    
    let id: String
    let key: String
    let name: String
    let title: String
    let image: ChampionImage
    let tags: [String]
    let info: ChampionInfo
    
    static func < (lhs: Champion, rhs: Champion) -> Bool {
        return lhs.name < rhs.name
    }
    
    static func == (lhs: Champion, rhs: Champion) -> Bool {
        return lhs.name == rhs.name
    }
}

struct ChampionInfo: Codable {
    let attack: Int
    let defense: Int
    let magic: Int
    let difficulty: Int
}

struct ChampionImage: Codable {
    let full: String
}
