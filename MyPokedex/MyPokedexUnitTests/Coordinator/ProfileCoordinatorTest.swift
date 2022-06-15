//
//  ProfileCoordinatorTest.swift
//  MyPokedexUnitTests
//
//  Created by Adrià Ros on 10/3/22.
//

import XCTest
@testable import MyPokedex

class ProfileCoordinatorTest: XCTestCase {
    
    var sut: ProfileCoordinator!
    var container: FakeDependencyFactory!

    override func setUpWithError() throws {
        container = FakeDependencyFactory()
        sut = ProfileCoordinator(container: container)
    }

    override func tearDownWithError() throws {
        container = nil
        sut = nil
    }

    func test_start() throws {
        // Given the expected view controller
        container.profileViewController = ProfileViewController()
        
        // When the coordinator is started
        sut.start()
        
        // Then the navigation controller contains the profile view controller
        XCTAssertTrue(sut.navigationController?.viewControllers.first is ProfileViewController)
    }
}
