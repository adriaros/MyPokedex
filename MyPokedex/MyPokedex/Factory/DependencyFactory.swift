//
//  DependencyFactory.swift
//  MyPokedex
//
//  Created by Adrià Ros on 1/3/22.
//

import Foundation

class DependencyFactory: Factory {
    
    lazy var network: NetworkProvider = {
        NetworkManager()
    }()
    
    lazy var cache: ImageCache = {
       CacheManager()
    }()
    
    lazy var pokemonRepository: PokemonCloudRepository = {
        PokemonRepository(network: network)
    }()
    
    lazy var imageRepository: ImageCloudRepository & ImageCacheRepository = {
        ImageRepository(network: network, cache: cache)
    }()
    
    lazy var imageProvider: ImageProviderUseCase = {
        ImageProvider(provider: imageRepository)
    }()
    
    func makeTabBar() -> TabBarController {
        TabBarController()
    }
    
    func makeHome(coordinator: HomeCoordinator) -> HomeViewController {
        HomeRouter.create(coordinator: coordinator) as! HomeViewController
    }
    
    func makeFavourites() -> FavouritesViewController {
        FavouritesRouter.create() as! FavouritesViewController
    }
    
    func makeProfile() -> ProfileViewController {
        ProfileRouter.create() as! ProfileViewController
    }
    
    func makePokemonList(coordinator: HomeCoordinator) -> PokemonListViewController {
        PokemonListRouter.create(coordinator: coordinator, dataProvider: pokemonRepository, imageProvider: imageProvider) as! PokemonListViewController
    }
    
    func makePokemonDetail(item: PokemonListItem) -> PokemonDetailViewController {
        PokemonDetailRouter.create(item: item, dataProvider: pokemonRepository, imageProvider: imageProvider) as! PokemonDetailViewController
    }
}
