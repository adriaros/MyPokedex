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
    var detailViewController: DetailViewController!
    var favouritesViewController: FavouritesViewController!
    var profileViewController: ProfileViewController!
    
    func makeTabBar() -> TabBarController {
        tabBarController
    }
    
    func makeHome(coordinator: HomeCoordinator) -> HomeViewController {
        homeViewController
    }
    
    func makeDetail() -> DetailViewController {
        detailViewController
    }
    
    func makeFavourites() -> FavouritesViewController {
        favouritesViewController
    }
    
    func makeProfile() -> ProfileViewController {
        profileViewController
    }
}
