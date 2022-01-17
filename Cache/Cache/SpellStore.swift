//
//  SpellStore.swift
//  Cache
//
//  Created by Ahmed Naser on 17/01/2022.
//

import Foundation
import CoreData
import Common

// MARK: USER INFO STORE PROTOCOL
public protocol SpellStoreType {
    func saveSpells(for champion: String, spells: [Spell]?)
    func fetchSpells(for champion: String) -> ChampionInfoResponse?
}

// MARK: USER INFO STORE
class SpellStoreEntityStore: NSObject, SpellStoreType {
    @Inject private var storage: CoreDataStorage
}

// MARK: SAVE Champions
extension SpellStoreEntityStore {
    
    func saveSpells(for champion: String, spells: [Spell]?) {
        reset()
        for spell in spells ?? [] {
            addSpell(id: champion, model: spell)
        }
    }
    
    private func reset() {
        storage.batchDeleteEntity(entity: .spell)
    }
    
    private func addSpell(id: String, model: Spell) {
        let spell =  SpellCacheModel(context: storage.privateContext)
        spell.id = id
        spell.name = model.name
        spell.desc = model.description
        spell.image = model.image.full
        storage.saveContext()
    }
}

// MARK: FETCH Champions
extension SpellStoreEntityStore {
    func fetchSpells(for champion: String) -> ChampionInfoResponse? {
        guard let models = storage.fetchEntity(entity: .spell,
                                               for: NSPredicate(format: "id == %@", champion))
                as? [SpellCacheModel] else {
            return nil
        }
        let spells = models.compactMap { spell in
            Spell(name: spell.name ?? "",
                  description: spell.desc ?? "" ,
                  image: ChampionImage(full: spell.image ?? ""))
        }
        var data = [String: SpellInfo]()
        if !spells.isEmpty {
            data = [spells[0].name: SpellInfo(spells: spells)]
        }
        
        return ChampionInfoResponse(data: data)
    }
}
