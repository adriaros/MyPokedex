//
//  CoreDatabase.swift
//  MyPokedex
//
//  Created by Adrià Ros on 10/6/22.
//

import Foundation
import CoreData

class CoreDatabase: CoreDatabaseProvider {
    
    private let container : NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "MyPokedexCoreDatabase")
        container.loadPersistentStores { _, _ in }
    }
    
    func createFavouriteWith(id: String?, name: String?, imageUrl: String?) {
        let context = container.viewContext
        
        let favourite = Favourite(context: context)
        favourite.id = id
        favourite.name = name
        favourite.imageUrl = imageUrl
        
        do {
            try context.save()
        } catch {
         
          print("Error creating favourite — \(error)")
        }
    }
    
    func fetchFavourites() -> [Favourite] {
        let request : NSFetchRequest<Favourite> = Favourite.fetchRequest()
        
        do {
            let result = try container.viewContext.fetch(request)
            return result
        } catch {
            print("error fetching favourites \(error)")
        }
        
        return []
    }
    
    func fetchFavourite(id: String?) -> Favourite? {
        guard let id = id else {
            return nil
        }
        
        let request : NSFetchRequest<Favourite> = Favourite.fetchRequest()
        request.fetchLimit = 1
        
        request.predicate = NSPredicate(
            format: "id = %@", id
        )
        
        do {
            let result = try container.viewContext.fetch(request).first
            return result
        } catch {
            print("error fetching favourites \(error)")
        }
        
        return nil
    }
    
    func deleteFavourite(id: String?) {
        guard let id = id else {
            return
        }
        
        let context = container.viewContext
        let request : NSFetchRequest<Favourite> = Favourite.fetchRequest()
        request.fetchLimit = 1
        
        request.predicate = NSPredicate(
            format: "id = %@", id
        )
        
        do {
            guard let result = try? container.viewContext.fetch(request).first else {
                return
            }
            
            context.delete(result)
            try context.save()
            
        } catch {
            print("error deleting favourite \(error)")
        }
    }
}
