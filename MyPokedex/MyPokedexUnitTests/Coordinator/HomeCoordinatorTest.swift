//
//  HomeCoordinatorTest.swift
//  MyPokedexUnitTests
//
//  Created by Adrià Ros on 10/3/22.
//

import XCTest
@testable import MyPokedex

class HomeCoordinatorTest: XCTestCase {
    
    var sut: HomeCoordinator!
    var container: FakeViewControllerContainer!

    override func setUpWithError() throws {
        container = FakeViewControllerContainer()
        sut = HomeCoordinator(container: container)
    }

    override func tearDownWithError() throws {
        container = nil
        sut = nil
    }

    func test_start() throws {
        // Given the expected view controller
        container.homeViewController = HomeViewController()
        
        // When the coordinator is started
        sut.start()
        
        // Then the navigation controller contains the home view controller
        XCTAssertTrue(sut.navigationController?.viewControllers.first is HomeViewController)
    }
}
