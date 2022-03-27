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
    
    func getPokemonList() {
        provider.getOriginalList()
    }
}
