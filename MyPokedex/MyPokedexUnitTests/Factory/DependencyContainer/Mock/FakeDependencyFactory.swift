//
//  FakeDependencyFactory.swift
//  MyPokedexUnitTests
//
//  Created by Adrià Ros on 10/3/22.
//

import Foundation
@testable import MyPokedex

class FakeDependencyFactory: DependencyFactory {
    
    var fakeFavouriteRepository: FavouriteDiskRepository!
    var fakePokemonRepository: PokemonCloudRepository!
    var fakeImageRepository: (ImageCloudRepository & ImageCacheRepository)!
    var fakeImageProvider: ImageProviderUseCase!
    var fakeGameRepository: GameCloudRepository!
    
    var favouriteRepository: FavouriteDiskRepository {
        fakeFavouriteRepository
    }
    
    var pokemonRepository: PokemonCloudRepository {
        fakePokemonRepository
    }
    
    var imageRepository: ImageCloudRepository & ImageCacheRepository {
        fakeImageRepository
    }
    
    var imageProvider: ImageProviderUseCase {
        fakeImageProvider
    }
    
    var gameRepository: GameCloudRepository {
        fakeGameRepository
    }
}
