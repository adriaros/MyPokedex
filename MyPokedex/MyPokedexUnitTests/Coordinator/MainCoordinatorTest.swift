//
//  MainCoordinatorTest.swift
//  MyPokedexUnitTests
//
//  Created by Adrià Ros on 10/3/22.
//

import XCTest
@testable import MyPokedex

class MainCoordinatorTest: XCTestCase {
    
    var sut: MainCoordinator!
    var tabBarController: TabBarController!
    var container: FakeViewControllerContainer!

    override func setUpWithError() throws {
        tabBarController = TabBarController()
        container = FakeViewControllerContainer()
    }

    override func tearDownWithError() throws {
        tabBarController = nil
        container = nil
        sut = nil
    }

    func test_start() throws {
        // Given the main coordinator and the expected view controllers
        container.homeViewController = HomeViewController()
        container.favouritesViewController = FavouritesViewController()
        container.profileViewController = ProfileViewController()
        sut = MainCoordinator(tabBarController: tabBarController, container: container)
        
        // When the coordinator is started
        sut.start()
        
        // Then the tab bar controller is created
        XCTAssertTrue(sut.childCoordinators[0] is HomeCoordinator)
        XCTAssertTrue(sut.childCoordinators[1] is FavouritesCoordinator)
        XCTAssertTrue(sut.childCoordinators[2] is ProfileCoordinator)
    }
}
