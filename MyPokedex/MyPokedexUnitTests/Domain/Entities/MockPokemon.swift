//
//  MockPokemon.swift
//  MyPokedexUnitTests
//
//  Created by Adrià Ros on 10/4/22.
//

import Foundation
@testable import MyPokedex

struct MockPokemon {
    
    static let id = 2
    static let name = "ivysaur"
    static let height = 10
    static let weight = 130
    
    static let data = ApiPokemonResponseModel(id: id,
                                              name: name,
                                              weight: weight,
                                              height: height,
                                              moves: [MockPokemonMove.data],
                                              types: [MockPokemonType.data],
                                              sprites: MockPokemonSprites.data)
    
    static let item = Pokemon(data)
}
