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
    
    func test_loadImageFromCache() throws {
        // Given a expectation
        var expectation: XCTestExpectation? = expectation(description: #function)
        var result: UIImage?
        
        // Given an image stored in cache
        imageRepository.imageToLoad = ImageAsset.PokemonList.fallback.image
        
        // When the method is executed
        sut.load(imageFrom: URL(string: "https://download/image/path")) { data in
            result = data
            expectation?.fulfill()
            expectation = nil
        }
        
        // Then the image is loaded from the cache
        waitForExpectations(timeout: 1, handler: nil)
        XCTAssertEqual(result, ImageAsset.PokemonList.fallback.image)
    }
    
    func test_loadImageFromCloud() throws {
        // Given a expectation
        var expectation: XCTestExpectation? = expectation(description: #function)
        var result: UIImage?
        
        // Given an image to download
        imageRepository.imageDownloaded = ImageAsset.PokemonList.fallback.image
        
        // When the method is executed
        sut.load(imageFrom: URL(string: "https://download/image/path")) { data in
            result = data
            expectation?.fulfill()
            expectation = nil
        }
        
        // Then the image is downloaded and stored in cache
        waitForExpectations(timeout: 1, handler: nil)
        XCTAssertEqual(result, ImageAsset.PokemonList.fallback.image)
        XCTAssertEqual(imageRepository.imageToStore, ImageAsset.PokemonList.fallback.image)
    }
}
