//
//  DependencyFactory.swift
//  MyPokedex
//
//  Created by Adrià Ros on 1/3/22.
//

import Foundation

class DependencyFactory: Factory {
    
    func makeTabBar() -> TabBarController {
        TabBarController()
    }
    
    func makeHome() -> HomeViewController {
        HomeRouter.create(coordinator: nil) as! HomeViewController
    }
    
    func makeDetail() -> DetailViewController {
        DetailRouter.create() as! DetailViewController
    }
    
    func makeFavourites() -> FavouritesViewController {
        FavouritesRouter.create() as! FavouritesViewController
    }
    
    func makeProfile() -> ProfileViewController {
        ProfileRouter.create() as! ProfileViewController
    }
}
