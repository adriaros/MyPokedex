//
//  DependencyFactory.swift
//  MyPokedex
//
//  Created by Adrià Ros on 1/3/22.
//

import Foundation

protocol DependencyFactory {
    
    // MARK: - Main modules
    
    /// Make the tab bar module
    func makeTabBar() -> TabBarController
    
    // MARK: - Home modules
    
    /// Make the home module
    func makeHome(coordinator: HomeCoordinator) -> HomeViewController
    
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
