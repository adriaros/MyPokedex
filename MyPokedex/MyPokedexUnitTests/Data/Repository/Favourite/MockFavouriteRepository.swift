//
//  MockFavouriteRepository.swift
//  MyPokedexUnitTests
//
//  Created by Adrià Ros on 15/6/22.
//

import Foundation
@testable import MyPokedex

class MockFavouriteRepository: FavouriteDiskRepository {
    
    var createFavouriteWithId: String?
    var createFavouriteWithName: String?
    var createFavouriteWithImageUrl: String?
    
    func create(id: String?, name: String?, imageUrl: String?) {
        createFavouriteWithId = id
        createFavouriteWithName = name
        createFavouriteWithImageUrl = imageUrl
    }
    
    func fetchAll() -> [Favourite] {
        []
    }
    
    func fetch(id: String?) -> Favourite? {
        nil
    }
    
    func delete(id: String?) {
        
    }
    
    func deleteAll() {
        
    }
}
