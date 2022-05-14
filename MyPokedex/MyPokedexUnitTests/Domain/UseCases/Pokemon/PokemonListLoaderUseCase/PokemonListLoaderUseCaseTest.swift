//
//  GetPokemonListUseCaseTest.swift
//  MyPokedexUnitTests
//
//  Created by Adrià Ros on 28/3/22.
//

import XCTest
@testable import MyPokedex

class GetPokemonListUseCaseTest: XCTestCase {
    
    var sut: PokemonListLoaderUseCase!
    var pokemonRepository: MockPokemonRepository!
    var imageRepository: MockImageRepository!

    override func setUpWithError() throws {
        pokemonRepository = MockPokemonRepository()
        imageRepository = MockImageRepository()
        sut = PokemonListLoader(dataProvider: pokemonRepository, imageProvider: imageRepository)
    }

    override func tearDownWithError() throws {
        sut = nil
        pokemonRepository = nil
        imageRepository = nil
    }

    func test_getOriginalList() throws {
        // Given a expectation
        var expectation: XCTestExpectation? = expectation(description: #function)
        var result: [PokemonListItemModel]?
        
        // Given a mock list of pokemon
        pokemonRepository.mockOriginalList = [MockPokemonListItemModel.item]
        
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
