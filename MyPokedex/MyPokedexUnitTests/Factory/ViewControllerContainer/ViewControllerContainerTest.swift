//
//  ViewControllerContainerTest.swift
//  MyPokedexUnitTests
//
//  Created by Adrià Ros on 21/6/22.
//

import XCTest
@testable import MyPokedex

class ViewControllerContainerTest: XCTestCase {
    
    var sut: ViewControllerFactory!
    var container: FakeDependencyFactory!

    override func setUpWithError() throws {
        container = FakeDependencyFactory()
        sut = ViewControllerContainer(container: container)
    }

    override func tearDownWithError() throws {
        container = nil
        sut = nil
    }

    func test_makeTabBar() throws {
        // Given a expected tab bar controller
        var tabBarController: UITabBarController!
        
        // When the tab bar is made
        tabBarController = sut.makeTabBar()
        
        // Then the tabBar controller is created
        XCTAssertEqual(tabBarController.tabBar.backgroundColor, UIColor.white.withAlphaComponent(0.8))
    }
    
    func test_makeHome() throws {
        // Given a home coordinator
        let homeCoordinator = HomeCoordinator(container: sut)

        // When the home view controller is made
        let homeViewController = sut.makeHome(coordinator: homeCoordinator)
        
        // Then the home module is created
        XCTAssertTrue(homeViewController.presenter != nil)
        XCTAssertTrue(homeViewController.presenter?.interactor != nil)
        XCTAssertTrue(homeViewController.presenter?.router != nil)
    }
    
    func test_makeFavourites() throws {
        // Given a expected view controller
        var favouritesViewController: FavouritesViewController!

        // When the favourites view controller is made
        favouritesViewController = sut.makeFavourites()
        
        // Then the favourites module is created
        XCTAssertTrue(favouritesViewController.presenter != nil)
        XCTAssertTrue(favouritesViewController.presenter?.interactor != nil)
        XCTAssertTrue(favouritesViewController.presenter?.router != nil)
    }
    
    func test_makeProfile() throws {
        // Given a expected view controller
        var profileViewController: ProfileViewController!

        // When the profile view controller is made
        profileViewController = sut.makeProfile()
        
        // Then the profile module is created
        XCTAssertTrue(profileViewController.presenter != nil)
        XCTAssertTrue(profileViewController.presenter?.interactor != nil)
        XCTAssertTrue(profileViewController.presenter?.router != nil)
    }
    
    func test_makePokemonList() throws {
        // Given a home coordinator
        let homeCoordinator = HomeCoordinator(container: sut)
        
        // Given the dependencies
        container.fakePokemonRepository = FakePokemonRepository()
        container.fakeImageProvider = FakeImageProviderUseCase()
        
        // Given a expected view controller
        var pokemonListViewController: PokemonListViewController!

        // When the PokemonList view controller is made
        pokemonListViewController = sut.makePokemonList(coordinator: homeCoordinator)
        
        // Then the PokemonList module is created
        XCTAssertTrue(pokemonListViewController.presenter != nil)
        XCTAssertTrue(pokemonListViewController.presenter?.interactor != nil)
        XCTAssertTrue(pokemonListViewController.presenter?.router != nil)
    }
    
    func test_makePokemonDetail() throws {
        // Given a expected view controller
        var pokemonDetailViewController: PokemonDetailViewController!
        
        // Given the dependencies
        container.fakePokemonRepository = FakePokemonRepository()
        container.fakeImageProvider = FakeImageProviderUseCase()
        container.fakeFavouriteRepository = FakeFavouriteRepository()
        
        // Given the item
        let pokemonListItem = PokemonListItem(MockPokemonListItem.data)

        // When the PokemonList view controller is made
        pokemonDetailViewController = sut.makePokemonDetail(item: pokemonListItem)
        
        // Then the PokemonList module is created
        XCTAssertTrue(pokemonDetailViewController.presenter != nil)
        XCTAssertTrue(pokemonDetailViewController.presenter?.interactor != nil)
        XCTAssertTrue(pokemonDetailViewController.presenter?.router != nil)
    }
    
    func test_makeGameList() throws {
        // Given a expected view controller
        var gameListViewController: GameListViewController!
        
        // Given a home coordinator
        let homeCoordinator = HomeCoordinator(container: sut)
        
        // Given the dependencies
        container.fakeGameRepository = FakeGameRepository()

        // When the PokemonList view controller is made
        gameListViewController = sut.makeGameList(coordinator: homeCoordinator)
        
        // Then the PokemonList module is created
        XCTAssertTrue(gameListViewController.presenter != nil)
        XCTAssertTrue(gameListViewController.presenter?.interactor != nil)
        XCTAssertTrue(gameListViewController.presenter?.router != nil)
    }
}
