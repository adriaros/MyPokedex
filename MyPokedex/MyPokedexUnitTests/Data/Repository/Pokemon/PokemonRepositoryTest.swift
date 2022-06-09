//
//  PokemonRepositoryTest.swift
//  MyPokedexUnitTests
//
//  Created by Adrià Ros on 28/3/22.
//

import XCTest
@testable import MyPokedex

class PokemonRepositoryTest: XCTestCase {
    
    var sut: PokemonRepository!
    var networkManager: MockNetworkManager!
    var networkResponses: MockPokemonApiResponses!

    override func setUpWithError() throws {
        networkManager = MockNetworkManager()
        sut = PokemonRepository(network: networkManager)
        networkResponses = MockPokemonApiResponses()
    }

    override func tearDownWithError() throws {
        sut = nil
        networkManager = nil
    }

    func test_getOriginalList() throws {
        // Given a expectation
        weak var expectation = self.expectation(description: #function)
        var result: [PokemonListItem]?
        
        // Given a expected api response
        networkManager.mockData = networkResponses.getOriginalList
        
        // When the method is executed
        sut.get(originalList: { list in
            result = list
            expectation?.fulfill()
            expectation = nil
        })

        
        // Then the original pokemon list is obtained
        waitForExpectations(timeout: 1, handler: nil)
        XCTAssertEqual(result?.count, 151)
        XCTAssertEqual(result?.first?.name, "bulbasaur")
    }
    
    func test_getPokemon() throws {
        // Given a expectation
        weak var expectation = self.expectation(description: #function)
        var result: Pokemon?
        
        // Given a expected api response
        networkManager.mockData = networkResponses.getPokemon
        
        // When the method is executed
        sut.get(pokemon: "2") { data in
            result = data
            expectation?.fulfill()
            expectation = nil
        }
        
        // Then the pokemon data is obtained
        waitForExpectations(timeout: 1, handler: nil)
        XCTAssertEqual(result?.id, 2)
        XCTAssertEqual(result?.name, "ivysaur")
    }
}
