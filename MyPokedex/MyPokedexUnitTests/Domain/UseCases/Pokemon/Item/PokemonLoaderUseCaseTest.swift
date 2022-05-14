//
//  PokemonLoaderUseCaseTest.swift
//  MyPokedexUnitTests
//
//  Created by Adrià Ros on 14/5/22.
//

import XCTest
@testable import MyPokedex

class PokemonLoaderUseCaseTest: XCTestCase {
    
    var sut: PokemonLoaderUseCase!
    var pokemonRepository: MockPokemonRepository!
    var imageRepository: MockImageRepository!

    override func setUpWithError() throws {
        pokemonRepository = MockPokemonRepository()
        imageRepository = MockImageRepository()
        sut = PokemonLoader(dataProvider: pokemonRepository, imageProvider: imageRepository)
    }

    override func tearDownWithError() throws {
        sut = nil
        pokemonRepository = nil
        imageRepository = nil
    }

    func test_getPokemon() throws {
        // Given a expectation
        var expectation: XCTestExpectation? = expectation(description: #function)
        var result: Pokemon?
        
        // Given a mock pokemon
        pokemonRepository.mockPokemon = MockPokemon.item
        
        // When the method is executed
        sut.getPokemonWith(number: "2") { pokemon in
            result = pokemon
            expectation?.fulfill()
            expectation = nil
        }
        
        // Then the list is obtained
        waitForExpectations(timeout: 1, handler: nil)
        XCTAssertEqual(result, MockPokemon.item)
    }
}
