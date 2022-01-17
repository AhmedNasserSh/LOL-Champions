//
//  CoreDataStorage.swift
//  Cache
//
//  Created by Ahmed Naser on 17/01/2022.
//

import Foundation
import CoreData

// MARK: DATABASE ENTITIES
enum Entities: String {
    case champion = "ChampionCacheModel"
    case spell = "SpellCacheModel"
}

// MARK: CORE DATA STORAGE
protocol CoreDataStorage {
    
    // MARK: PROPERTIES
    var mainManagedObjectContext: NSManagedObjectContext { get }
    var privateContext: NSManagedObjectContext { get }
    
    // MARK: METHODS
    func saveContext()
    func fetchEntity<T: NSManagedObject>(entity: Entities, predicate: NSPredicate?, count: Int,
                                         sort: [NSSortDescriptor]?) -> [T]?
    func batchUpdateEntity(entity: Entities, propertiesToUpdate: [String: Any], for predicate: NSPredicate?)
    func batchDeleteEntity(entity: Entities, for predicate: NSPredicate?)
    func deleteEntityRow(row: NSManagedObject)
}

// MARK: CORE DATA STORAGE EXTENSION
extension CoreDataStorage {
    
    // MARK: SAVE
    func saveContext() {
        if privateContext.hasChanges {
            do {
                try privateContext.save()
            } catch {
                let coreDataError = error as NSError
                fatalError("Unresolved error \(coreDataError), \(coreDataError.userInfo)")
            }
        }
    }
    
    // MARK: FETCH
    func fetchEntity<T: NSManagedObject>(entity: Entities, predicate: NSPredicate?, count: Int,
                                         sort: [NSSortDescriptor]?) -> [T]? {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: entity.rawValue)
        fetchRequest.sortDescriptors = sort
        fetchRequest.predicate = predicate
        fetchRequest.fetchLimit = count
        do {
            if let object = try privateContext.fetch(fetchRequest) as? [T] {
                return object
            }
        } catch {
           
        }
        return nil
    }
    
    // MARK: update properties in entity if value is of type transformable you should archive it to data first
    func batchUpdateEntity(entity: Entities, propertiesToUpdate: [String: Any], for predicate: NSPredicate?) {
        let updateRequest = NSBatchUpdateRequest(entityName: entity.rawValue)
        updateRequest.propertiesToUpdate = propertiesToUpdate
        updateRequest.resultType = .updatedObjectIDsResultType
        updateRequest.predicate = predicate
        do {
            if let result = try privateContext.execute(updateRequest) as? NSBatchUpdateResult,
                let objectIDArray = result.result as? [NSManagedObjectID] {
                let changes = [NSUpdatedObjectsKey: objectIDArray]
                NSManagedObjectContext.mergeChanges(fromRemoteContextSave: changes,
                                                    into: [mainManagedObjectContext])
            }
        } catch {
            let coreDataError = error as NSError
            fatalError("Unresolved error \(coreDataError), \(coreDataError.userInfo)")
        }
    }
    
    // MARK: DELETE
    func batchDeleteEntity(entity: Entities, for predicate: NSPredicate?) {
        let records = NSFetchRequest<NSFetchRequestResult>(entityName: entity.rawValue)
        records.predicate = predicate
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: records)
        batchDeleteRequest.resultType = .resultTypeObjectIDs
        do {
            let batchDeleteResult = try privateContext.execute(batchDeleteRequest) as? NSBatchDeleteResult
            if let deletedObjectIDs = batchDeleteResult?.result as? [NSManagedObjectID] {
                NSManagedObjectContext.mergeChanges(fromRemoteContextSave: [NSDeletedObjectsKey:
                                                                                deletedObjectIDs],
                                                    into: [mainManagedObjectContext])
            }
        } catch {
            let coreDataError = error as NSError
            fatalError("Unresolved error \(coreDataError), \(coreDataError.userInfo)")
        }
    }
    
    // MARK: DELETE ROW
    func deleteEntityRow(row: NSManagedObject) {
        privateContext.delete(row)
        saveContext()
    }
}

extension CoreDataStorage {
    
    func fetchEntity<T: NSManagedObject>(entity: Entities, for predicate: NSPredicate? = nil) -> [T]? {
        return fetchEntity(entity: entity, predicate: predicate, count: Int.max, sort: nil)
    }
    
    func batchUpdateEntity(entity: Entities, propertiesToUpdate: [String: Any]) {
        batchUpdateEntity(entity: entity, propertiesToUpdate: propertiesToUpdate, for: nil)
    }
    
    func batchDeleteEntity(entity: Entities) {
        batchDeleteEntity(entity: entity, for: nil)
    }
    
    func transformableToData(propertiesToUpdate: [String: Any]) -> [String: Any] {
        var archivedProperties = [String: Any]()
        for (key, value) in propertiesToUpdate {
            let transformedData: Data? = try? NSKeyedArchiver.archivedData(withRootObject: value,
                                                                           requiringSecureCoding: true)
            archivedProperties[key] = transformedData
        }
        return archivedProperties
    }
}
