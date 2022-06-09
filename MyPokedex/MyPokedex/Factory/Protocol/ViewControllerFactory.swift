//
//  ViewControllerFactory.swift
//  MyPokedex
//
//  Created by Adrià Ros on 15/5/22.
//

import Foundation

protocol ViewControllerFactory {
    
    /// Make the tab bar module
    func makeTabBar() -> TabBarController
    
    // MARK: - Home module
    
    /// Make the home module
    func makeHome(coordinator: HomeCoordinator) -> HomeViewController
    
    // MARK: - Game modules
    
    /// Make the game list module
    func makeGameList(coordinator: HomeCoordinator) -> GameListViewController
    
    // MARK: - Pokemon modules
    
    /// Make the pokemon list module
    func makePokemonList(coordinator: HomeCoordinator) -> PokemonListViewController
    
    /// Make the pokemon detail module
    func makePokemonDetail(item: PokemonListItem) -> PokemonDetailViewController

    // MARK: - Favourites modules
    
    /// Make the favourites module
    func makeFavourites() -> FavouritesViewController
    
    // MARK: - Profile modules
    
    /// Make the profile module
    func makeProfile() -> ProfileViewController
}
