//
//  ChampionDetailsConstants.swift
//  ChampionDetails
//
//  Created by Ahmed Naser on 15/01/2022.
//

import Foundation
public enum ChampionDetailsConstants: String {
    case bundleID = "com.marvel.heros.www.ChampionDetails"
    
    enum Network: String {
        case championCardImage = "http://ddragon.leagueoflegends.com/cdn/img/champion/splash/"
        case championSpellImage = "http://ddragon.leagueoflegends.com/cdn/12.1.1/img/spell/"
        case championInfoDataDragon = "http://ddragon.leagueoflegends.com/cdn/12.1.1/data/en_US/champion/"
    }
}
