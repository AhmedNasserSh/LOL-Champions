//
//  ChampionsStore.swift
//  Cache
//
//  Created by Ahmed Naser on 17/01/2022.
//

import Foundation
import CoreData
import Common

// MARK: USER INFO STORE PROTOCOL
public protocol ChampionsStoreType {
    func saveChampions(champions: [Champion])
    func fetchChampions() -> ChampionsResponse?
}

// MARK: USER INFO STORE
class ChampionEntityStore: NSObject, ChampionsStoreType {
    @Inject private var storage: CoreDataStorage
}

// MARK: SAVE Champions
extension ChampionEntityStore {
    
    func saveChampions(champions: [Champion]) {
        reset()
        for champion in champions {
            addChampion(model: champion)
        }
    }
    
    private func reset() {
        storage.batchDeleteEntity(entity: .champion)
    }
    
    private func addChampion(model: Champion) {
        let champion =  ChampionCacheModel(context: storage.privateContext)
        champion.id = model.id
        champion.name = model.name
        champion.title = model.title
        champion.burb = model.blurb
        champion.tags = model.tags
        champion.imageURL = model.image.full
        storage.saveContext()
    }
}

// MARK: FETCH Champions
extension ChampionEntityStore {
    func fetchChampions() -> ChampionsResponse? {
        guard let models = storage.fetchEntity(entity: .champion) as? [ChampionCacheModel] else {
            return nil
        }
        
        var data: [String: Champion] = [:]
        
        for model in models {
            data[model.name ?? ""] = Champion(id: model.id ?? "",
                                        name: model.name ?? "",
                                        title: model.title ?? "",
                                        blurb: model.burb ?? "",
                                        tags: model.tags ?? [],
                                        image: ChampionImage(full: model.imageURL ?? ""))
        }
        
        return ChampionsResponse(data: data)
    }
}
