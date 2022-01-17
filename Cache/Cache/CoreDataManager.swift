//
//  CoreDataManager.swift
//  Cache
//
//  Created by Ahmed Naser on 17/01/2022.
//

import Foundation
import CoreData

// MARK: CORE DATA MANAGER
@objc final class CoreDataManager: NSObject, CoreDataStorage {
    
    private let modelName: String = "CoreDataModel"
    private let frameworkBundleID   = "com.lol.champions.www.Cache"

    lazy var privateContext: NSManagedObjectContext =  {
        let context = persistentContainer.newBackgroundContext()
        context.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        context.undoManager = nil
        return context
    }()
    
    lazy var mainManagedObjectContext: NSManagedObjectContext = {
        return persistentContainer.viewContext
    }()
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let frameworkBundle = Bundle(identifier: self.frameworkBundleID)
        let modelURL = frameworkBundle!.url(forResource: self.modelName, withExtension: "momd")!
        let managedObjectModel =  NSManagedObjectModel(contentsOf: modelURL)
        
        let container = NSPersistentContainer(name: self.modelName, managedObjectModel: managedObjectModel!)
        container.loadPersistentStores { _, error in
            
            if let error = error {
                fatalError("Unable to load persistent stores: \(error)")
            }
        }
        
        return container
    }()
}
