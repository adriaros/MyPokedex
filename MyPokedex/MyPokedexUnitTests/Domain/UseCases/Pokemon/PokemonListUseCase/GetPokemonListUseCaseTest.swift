//
//  GetPokemonListUseCaseTest.swift
//  MyPokedexUnitTests
//
//  Created by Adrià Ros on 28/3/22.
//

import XCTest
@testable import MyPokedex

class GetPokemonListUseCaseTest: XCTestCase {
    
    var sut: GetPokemonListUseCase!
    var pokemonCloudRepository: MockPokemonCloudRepository!

    override func setUpWithError() throws {
        pokemonCloudRepository = MockPokemonCloudRepository()
        sut = GetPokemonListUseCase(provider: pokemonCloudRepository)
    }

    override func tearDownWithError() throws {
        sut = nil
        pokemonCloudRepository = nil
    }

    func test_getOriginalList() throws {
        // Given a expectation
        var expectation: XCTestExpectation? = expectation(description: #function)
        var result: [PokemonListItemModel]?
        
        // Given a mock list of pokemon
        pokemonCloudRepository.mockOriginalList = [MockPokemonListItemModel.item]
        
        // When the method is executed
        sut.get(originalList: { list in
            result = list
            expectation?.fulfill()
            expectation = nil
        })
        
        // Then the list is obtained
        waitForExpectations(timeout: 1, handler: nil)
        XCTAssertEqual(result, [MockPokemonListItemModel.item])
    }
}
