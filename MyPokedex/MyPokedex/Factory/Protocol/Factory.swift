//
//  Factory.swift
//  MyPokedex
//
//  Created by Adrià Ros on 1/3/22.
//

import Foundation

protocol Factory {
    
    // MARK: - Main modules
    
    /// Make the tab bar module
    func makeTabBar() -> TabBarController
    
    // MARK: - Home modules
    
    /// Make the home module
    func makeHome(coordinator: HomeCoordinator) -> HomeViewController
    
    /// Make the pokemon detail module
    func makePokemons(coordinator: HomeCoordinator?) -> PokemonsViewController

    // MARK: - Favourites modules
    
    /// Make the favourites module
    func makeFavourites() -> FavouritesViewController
    
    // MARK: - Profile modules
    
    /// Make the profile module
    func makeProfile() -> ProfileViewController
}
