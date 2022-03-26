//
//  FactoryTest.swift
//  MyPokedexUnitTests
//
//  Created by Adrià Ros on 10/3/22.
//

import XCTest
@testable import MyPokedex

class FactoryTest: XCTestCase {
    
    var sut: Factory!

    override func setUpWithError() throws {
        sut = DependencyFactory()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_factoryMakeTabBar() throws {
        // Given a expected tab bar controller
        var tabBarController: UITabBarController!
        
        // When the tab bar is made
        tabBarController = sut.makeTabBar()
        
        // Then the tabBar controller is created
        XCTAssertEqual(tabBarController.tabBar.backgroundColor, UIColor.white.withAlphaComponent(0.8))
    }
    
    func test_factoryMakeHome() throws {
        // Given a home coordinator
        let homeCoordinator = HomeCoordinator(container: sut)

        // When the home view controller is made
        let homeViewController = sut.makeHome(coordinator: homeCoordinator)
        
        // Then the home module is created
        XCTAssertTrue(homeViewController.presenter != nil)
        XCTAssertTrue(homeViewController.presenter?.interactor != nil)
        XCTAssertTrue(homeViewController.presenter?.router != nil)
    }
    
    func test_factoryMakeFavourites() throws {
        // Given a coordinator

        // When the favourites view controller is made
        let favouritesViewController = sut.makeFavourites()
        
        // Then the favourites module is created
        XCTAssertTrue(favouritesViewController.presenter != nil)
        XCTAssertTrue(favouritesViewController.presenter?.interactor != nil)
        XCTAssertTrue(favouritesViewController.presenter?.router != nil)
    }
    
    func test_factoryMakeProfile() throws {
        // Given a coordinator

        // When the profile view controller is made
        let profileViewController = sut.makeProfile()
        
        // Then the profile module is created
        XCTAssertTrue(profileViewController.presenter != nil)
        XCTAssertTrue(profileViewController.presenter?.interactor != nil)
        XCTAssertTrue(profileViewController.presenter?.router != nil)
    }
}
