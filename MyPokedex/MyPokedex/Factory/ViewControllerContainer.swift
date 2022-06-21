//
//  ViewControllerContainer.swift
//  MyPokedex
//
//  Created by Adrià Ros on 21/6/22.
//

import Foundation

class ViewControllerContainer: ViewControllerFactory {
    
    var container: DependencyFactory
    
    init(container: DependencyFactory) {
        self.container = container
    }
    
    func makeTabBar() -> TabBarController {
        TabBarController()
    }
    
    func makeHome(coordinator: HomeCoordinator) -> HomeViewController {
        HomeRouter.create(coordinator: coordinator) as! HomeViewController
    }
    
    func makeFavourites() -> FavouritesViewController {
        FavouritesRouter.create(dataProvider: container.favouriteRepository, imageProvider: container.imageProvider) as! FavouritesViewController
    }
    
    func makeProfile() -> ProfileViewController {
        ProfileRouter.create() as! ProfileViewController
    }
    
    func makePokemonList(coordinator: HomeCoordinator) -> PokemonListViewController {
        PokemonListRouter.create(coordinator: coordinator, dataProvider: container.pokemonRepository, imageProvider: container.imageProvider) as! PokemonListViewController
    }
    
    func makePokemonDetail(item: PokemonListItem) -> PokemonDetailViewController {
        PokemonDetailRouter.create(item: item, dataProvider: container.pokemonRepository, imageProvider: container.imageProvider, favouriteProvider: container.favouriteRepository) as! PokemonDetailViewController
    }
    
    func makeGameList(coordinator: HomeCoordinator) -> GameListViewController {
        GameListRouter.createModule(coordinator: coordinator, dataProvider: container.gameRepository) as! GameListViewController
    }
}
