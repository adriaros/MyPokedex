//
//  MockDependencyFactory.swift
//  MyPokedexUnitTests
//
//  Created by Adrià Ros on 10/3/22.
//

import Foundation
@testable import MyPokedex

class MockDependencyFactory: DependencyFactory {
    
    var tabBarController: TabBarController!
    var homeViewController: HomeViewController!
    var favouritesViewController: FavouritesViewController!
    var profileViewController: ProfileViewController!
    var pokemonListViewController: PokemonListViewController!
    var pokemonDetailViewController: PokemonDetailViewController!
    
    func makeTabBar() -> TabBarController {
        tabBarController
    }
    
    func makeHome(coordinator: HomeCoordinator) -> HomeViewController {
        homeViewController
    }
    
    func makeFavourites() -> FavouritesViewController {
        favouritesViewController
    }
    
    func makeProfile() -> ProfileViewController {
        profileViewController
    }
    
    func makePokemonList(coordinator: HomeCoordinator) -> PokemonListViewController {
        pokemonListViewController
    }
    
    func makePokemonDetail(item: PokemonListItem) -> PokemonDetailViewController {
        pokemonDetailViewController
    }
}
