//
//  GetPokemonListUseCase.swift
//  MyPokedex
//
//  Created by Adrià Ros on 26/3/22.
//

import Foundation

class GetPokemonListUseCase: PokemonListUseCase {
    
    var provider: PokemonCloudRepository
    
    init(provider: PokemonCloudRepository) {
        self.provider = provider
    }
    
    func get(originalList completion: @escaping ([PokemonListItemModel]?) -> Void) {
        provider.get(originalList: { items in
            completion(items)
        })
    }
}
