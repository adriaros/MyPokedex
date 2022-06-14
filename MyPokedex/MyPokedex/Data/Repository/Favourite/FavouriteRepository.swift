//
//  FavouriteRepository.swift
//  MyPokedex
//
//  Created by Adrià Ros on 14/6/22.
//

import Foundation

class FavouriteRepository: FavouriteDiskRepository {
    
    var database: CoreDatabaseProvider
    
    init(database: CoreDatabaseProvider) {
        self.database = database
    }
    
    func create(id: String?, name: String?, imageUrl: String?) {
        database.createFavouriteWith(id: id, name: name, imageUrl: imageUrl)
    }
    
    func fetchAll() -> [Favourite] {
        database.fetchFavourites()
    }
    
    func fetch(id: String?) -> Favourite? {
        database.fetchFavourite(id: id)
    }
    
    func delete(id: String?) {
        database.deleteFavourite(id: id)
    }
    
    func deleteAll() {
        database.deleteAllFavourites()
    }
}
