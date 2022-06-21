//
//  DependencyContainer.swift
//  MyPokedex
//
//  Created by Adrià Ros on 1/3/22.
//

import Foundation

class DependencyContainer: DependencyFactory {
    
    lazy var network: NetworkProvider & NetworkRXProvider = {
        NetworkManager()
    }()

    lazy var cache: ImageCache = {
       CacheManager()
    }()
    
    lazy var coreDatabase: CoreDatabaseProvider = {
        CoreDatabase()
    }()
    
    lazy var favouriteRepository: FavouriteDiskRepository = {
        FavouriteRepository(database: coreDatabase)
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
    
    lazy var gameRepository: GameCloudRepository = {
        GameRepository(network: network)
    }()
}
