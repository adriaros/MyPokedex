//
//  MockPokemonRepository.swift
//  MyPokedexUnitTests
//
//  Created by Adrià Ros on 28/3/22.
//

import Foundation
@testable import MyPokedex

class MockPokemonRepository: PokemonCloudRepository {
    
    var mockOriginalList: [PokemonListItem]?
    var mockPokemon: Pokemon?
    
    func get(originalList completion: @escaping ([PokemonListItem]?) -> Void) {
        completion(mockOriginalList)
    }
    
    func get(pokemon: String, completion: @escaping (Pokemon?) -> Void) {
        completion(mockPokemon)
    }
}
