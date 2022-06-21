//
//  DependencyFactory.swift
//  MyPokedex
//
//  Created by Adrià Ros on 1/3/22.
//

import Foundation

protocol DependencyFactory {
    var favouriteRepository: FavouriteDiskRepository { get }
    var pokemonRepository: PokemonCloudRepository { get }
    var imageRepository: ImageCloudRepository & ImageCacheRepository { get }
    var imageProvider: ImageProviderUseCase { get }
    var gameRepository: GameCloudRepository { get }
}
