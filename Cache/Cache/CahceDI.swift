//
//  CahceDI.swift
//  Cache
//
//  Created by Ahmed Naser on 17/01/2022.
//

import Foundation
import Swinject
import Common

public class CahceDIIntilizer {
    private let container: Container
    
    public init(container: Container) {
        self.container = container
    }
    
    public func buildContainer() {
        registerSorage()
        registerChampion()
        registerSpell()
    }

}

// MARK: Storage
extension CahceDIIntilizer {
    private func registerSorage() {
        container.register(CoreDataStorage.self) { _  in
            return CoreDataManager()
        }.inObjectScope(.transient)
    }
}

// MARK: championStore
extension CahceDIIntilizer {
    private func registerChampion() {
        container.register(ChampionsStoreType.self) { _  in
            return ChampionEntityStore()
        }.inObjectScope(.transient)
    }
}

// MARK: SpeelStore
extension CahceDIIntilizer {
    private func registerSpell() {
        container.register(SpellStoreType.self) { _  in
            return SpellStoreEntityStore()
        }.inObjectScope(.transient)
    }
}
