//
//  Champion.swift
//  Home
//
//  Created by Ahmed Naser on 09/01/2022.
//

import Foundation
import SwiftUI

struct ChampionsResponse: Codable {
    let data: [String: Champion]
}

struct Champion: Codable {
    let id: String
    let key: String
    let name: String
    let title: String
    let image: ChampionImage
    let tags: [String]
    let info: ChampionInfo
}

struct ChampionInfo: Codable {
    let info: String
    let attack: String
    let defense: String
    let magic: String
    let difficulty: String
}

struct ChampionImage: Codable {
    let full: String
}
