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

    override func setUpWithError() throws {
        networkManager = MockNetworkManager()
        sut = PokemonRepository(network: networkManager)
    }

    override func tearDownWithError() throws {
        sut = nil
        networkManager = nil
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
}
