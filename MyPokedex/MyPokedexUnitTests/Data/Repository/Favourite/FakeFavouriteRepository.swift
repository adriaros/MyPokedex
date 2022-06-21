//
//  FakeFavouriteRepository.swift
//  MyPokedexUnitTests
//
//  Created by Adrià Ros on 15/6/22.
//

import Foundation
@testable import MyPokedex

class FakeFavouriteRepository: FavouriteDiskRepository {
    
    var createFavouriteWithId: String?
    var createFavouriteWithName: String?
    var createFavouriteWithImageUrl: String?
    var allFavourites: [Favourite]?
    
    func create(id: String?, name: String?, imageUrl: String?) {
        createFavouriteWithId = id
        createFavouriteWithName = name
        createFavouriteWithImageUrl = imageUrl
    }
    
    func fetchAll() -> [Favourite]? {
        allFavourites
    }
    
    func fetch(id: String?) -> Favourite? {
        nil
    }
    
    func delete(id: String?) {
        
    }
    
    func deleteAll() {
        
    }
}
