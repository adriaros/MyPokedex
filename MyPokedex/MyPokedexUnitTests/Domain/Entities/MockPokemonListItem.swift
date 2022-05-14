//
//  MockPokemonListItem.swift
//  MyPokedexUnitTests
//
//  Created by Adrià Ros on 28/3/22.
//

import Foundation
@testable import MyPokedex

struct MockPokemonListItem {
    
    static let name = "bulbasaur"
    static let url = "https://pokeapi.co/api/v2/pokemon/1/"
    
    static let data = ApiPokemonListResultModel(name: name, url: url)
    static let item = PokemonListItem(data)
}
