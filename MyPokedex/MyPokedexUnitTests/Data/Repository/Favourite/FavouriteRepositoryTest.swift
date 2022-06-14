//
//  FavouriteRepositoryTest.swift
//  MyPokedexUnitTests
//
//  Created by Adrià Ros on 14/6/22.
//

import XCTest
@testable import MyPokedex

class FavouriteRepositoryTest: XCTestCase {
    
    var sut: FavouriteDiskRepository!
    var database: CoreDatabaseProvider!

    override func setUpWithError() throws {
        database = CoreDatabase(type: .inMemory)
        sut = FavouriteRepository(database: database)
    }

    override func tearDownWithError() throws {
        database.deleteAllFavourites()
        database = nil
        sut = nil
    }

    func test_createAndFetch() throws {
        // Given a favourite attributes
        let id = "1029245e-ebce-11ec-8ea0-0242ac120000"
        let name = "favourite"
        let imageUrl = "/image/url"
        
        // When the favourite is created
        sut.create(id: id, name: name, imageUrl: imageUrl)
        
        // Then the database has created the favourite correctly
        XCTAssertEqual(database.fetchFavourite(id: id)?.id, id)
    }
    
    func test_createAndfetchAll() throws {
        // Given a favourite attributes
        let id = "1029245e-ebce-11ec-8ea0-0242ac120001"
        let name = "favourite"
        let imageUrl = "/image/url"

        // When the favourite is created
        sut.create(id: id, name: name, imageUrl: imageUrl)

        // Then the database returns the expected array of favourites
        XCTAssertEqual(database.fetchFavourites().count, 1)
        XCTAssertEqual(database.fetchFavourites().first?.id, id)
    }
    
    func test_createAndDelete() throws {
        // Given a favourite attributes
        let id = "1029245e-ebce-11ec-8ea0-0242ac120001"
        let name = "favourite"
        let imageUrl = "/image/url"

        // Given the favourite created
        sut.create(id: id, name: name, imageUrl: imageUrl)
        
        // When the favourite is deleted
        sut.delete(id: id)

        // Then the database returns nil
        XCTAssertEqual(database.fetchFavourite(id: id), nil)
    }
    
    func test_createAndDeleteAll() throws {
        // Given a favourite attributes
        let id = "1029245e-ebce-11ec-8ea0-0242ac120001"
        let name = "favourite"
        let imageUrl = "/image/url"

        // Given the favourite created
        sut.create(id: id, name: name, imageUrl: imageUrl)
        
        // When the favourites are deleted
        sut.deleteAll()

        // Then the database returns an empty array
        XCTAssertEqual(database.fetchFavourites().count, 0)
    }
}
