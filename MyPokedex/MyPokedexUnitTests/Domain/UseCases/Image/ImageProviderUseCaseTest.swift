//
//  ImageLoaderUseCaseTest.swift
//  MyPokedexUnitTests
//
//  Created by Adrià Ros on 14/5/22.
//

import XCTest
@testable import MyPokedex

class ImageLoaderUseCaseTest: XCTestCase {
    
    var sut: ImageProviderUseCase!
    var imageRepository: FakeImageRepository!

    override func setUpWithError() throws {
        imageRepository = FakeImageRepository()
        sut = ImageProvider(provider: imageRepository)
    }

    override func tearDownWithError() throws {
        sut = nil
        imageRepository = nil
    }
    
    func test_loadImageFromCache() throws {
        // Given a expectation
        weak var expectation = self.expectation(description: #function)
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
        weak var expectation = self.expectation(description: #function)
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
