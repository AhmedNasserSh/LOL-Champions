//
//  Spell.swift
//  ChampionDetails
//
//  Created by Ahmed Naser on 15/01/2022.
//

import Foundation
struct ChampionInfoResponse: Codable {
    let data: [String: ChampionInfo]
}

struct ChampionInfo: Codable {
    let spells: [Spell]
}

struct Spell: Codable {
    let name: String
    let description: String
    let image: SpellImage
}

struct SpellImage: Codable {
    let full: String
}
