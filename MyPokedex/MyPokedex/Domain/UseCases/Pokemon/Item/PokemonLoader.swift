//
//  PokemonLoader.swift
//  MyPokedex
//
//  Created by Adrià Ros on 14/5/22.
//

import Foundation

class PokemonLoader: PokemonLoaderUseCase {
    
    let dataProvider: PokemonCloudRepository
    let imageProvider: ImageCloudRepository & ImageCacheRepository
    
    init(dataProvider: PokemonCloudRepository, imageProvider: ImageCloudRepository & ImageCacheRepository) {
        self.dataProvider = dataProvider
        self.imageProvider = imageProvider
    }
    
    func getPokemonWith(number: String?, completion: @escaping (Pokemon?) -> Void) {
        guard let number = number else {
            completion(nil)
            return
        }

        dataProvider.get(pokemon: number) { pokemon in
            completion(pokemon)
        }
    }
}
