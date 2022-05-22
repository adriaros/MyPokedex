//
//  ImageRepositoryTest.swift
//  MyPokedexUnitTests
//
//  Created by Adrià Ros on 9/4/22.
//

import XCTest
import UIKit
@testable import MyPokedex

class ImageRepositoryTest: XCTestCase {
    
    var sut: ImageRepository!
    var network: MockNetworkManager!
    var cache: MockCacheManager!

    override func setUpWithError() throws {
        network = MockNetworkManager()
        cache = MockCacheManager()
        sut = ImageRepository(network: network, cache: cache)
    }

    override func tearDownWithError() throws {
        network = nil
        cache = nil
        sut = nil
    }

    func test_downloadImageFromURL() throws {
        // Given an expectation
        weak var expectation = self.expectation(description: #function)
        var result: UIImage?
        
        // Given a expected api response
        network.mockImage = ImageAsset.PokemonList.fallback.image
        
        // When the method is executed
        sut.download(imageFrom: URL(string: "https://download/image/path")) { data in
            result = data
            expectation?.fulfill()
            expectation = nil
        }
        
        // Then the image is downloaded
        waitForExpectations(timeout: 1, handler: nil)
        XCTAssertEqual(result, ImageAsset.PokemonList.fallback.image)
    }
    
    func test_storeImageToCache() throws {
        // Given an image to store
        let imageToStore = ImageAsset.PokemonList.fallback.image
        
        // When the method is executed
        sut.store(image: imageToStore, url: URL(string: "https://download/image/path"))
        
        // Then the image is stored in cache
        XCTAssertEqual(cache.imageSet, imageToStore)
    }
    
    func test_loadImageFromCache() throws {
        // Given the expected image
        var expectedImage: UIImage?
        
        // Given a stored image
        let storedImage = ImageAsset.PokemonList.fallback.image
        cache.loadedImage = storedImage
        
        // When the method is executed
        expectedImage = cache.image(url: URL(string: "https://download/image/path")!)
        
        // Then the image is loaded from cache
        XCTAssertEqual(expectedImage, storedImage)
    }
}
