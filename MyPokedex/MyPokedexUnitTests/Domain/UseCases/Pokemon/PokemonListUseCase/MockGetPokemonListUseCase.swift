//
//  MockGetPokemonListUseCase.swift
//  MyPokedexUnitTests
//
//  Created by Adrià Ros on 28/3/22.
//

import Foundation
@testable import MyPokedex

class MockGetPokemonListUseCase: PokemonListUseCase {

    func get(originalList completion: @escaping ([PokemonListItemModel]?) -> Void) {
        
    }
}
