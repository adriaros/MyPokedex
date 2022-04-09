//
//  MockPokemonRepository.swift
//  MyPokedexUnitTests
//
//  Created by Adrià Ros on 28/3/22.
//

import Foundation
@testable import MyPokedex

class MockPokemonRepository: PokemonCloudRepository {
    
    var mockOriginalList: [PokemonListItemModel]?
    
    func get(originalList completion: @escaping ([PokemonListItemModel]?) -> Void) {
        completion(mockOriginalList)
    }
}
