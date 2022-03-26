//
//  MockDependencyFactory.swift
//  MyPokedexUnitTests
//
//  Created by Adrià Ros on 10/3/22.
//

import Foundation
@testable import MyPokedex

class MockDependencyFactory: Factory {
    
    var tabBarController: TabBarController!
    var homeViewController: HomeViewController!
    var favouritesViewController: FavouritesViewController!
    var profileViewController: ProfileViewController!
    var pokemonsViewController: PokemonsViewController!
    
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
    
    func makePokemons(coordinator: HomeCoordinator?) -> PokemonsViewController {
        pokemonsViewController
    }
}
