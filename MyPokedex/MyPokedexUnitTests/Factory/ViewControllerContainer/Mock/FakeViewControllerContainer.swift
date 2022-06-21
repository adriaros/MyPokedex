//
//  FakeViewControllerContainer.swift
//  MyPokedexUnitTests
//
//  Created by Adrià Ros on 21/6/22.
//

import Foundation
@testable import MyPokedex

class FakeViewControllerContainer: ViewControllerFactory {
    
    var tabBarController: TabBarController!
    var homeViewController: HomeViewController!
    var favouritesViewController: FavouritesViewController!
    var profileViewController: ProfileViewController!
    var pokemonListViewController: PokemonListViewController!
    var pokemonDetailViewController: PokemonDetailViewController!
    var gameListViewController: GameListViewController!
    
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
    
    func makeGameList(coordinator: HomeCoordinator) -> GameListViewController {
        gameListViewController
    }
}
