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
        var expectation: XCTestExpectation? = expectation(description: #function)
        var result: [PokemonListItemModel]?
        
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
}
