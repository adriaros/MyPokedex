//
//  FavouritesCoordinatorTest.swift
//  MyPokedexUnitTests
//
//  Created by Adrià Ros on 10/3/22.
//

import XCTest
@testable import MyPokedex

class FavouritesCoordinatorTest: XCTestCase {
    
    var sut: FavouritesCoordinator!
    var container: FakeViewControllerContainer!

    override func setUpWithError() throws {
        container = FakeViewControllerContainer()
        sut = FavouritesCoordinator(container: container)
    }

    override func tearDownWithError() throws {
        container = nil
        sut = nil
    }

    func test_start() throws {
        // Given the expected view controller
        container.favouritesViewController = FavouritesViewController()
        
        // When the coordinator is started
        sut.start()
        
        // Then the navigation controller contains the favourites view controller
        XCTAssertTrue(sut.navigationController?.viewControllers.first is FavouritesViewController)
    }
}
