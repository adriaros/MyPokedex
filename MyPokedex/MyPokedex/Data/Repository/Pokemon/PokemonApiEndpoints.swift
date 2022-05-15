//
//  PokemonApiEndpoints.swift
//  MyPokedex
//
//  Created by Adrià Ros on 27/3/22.
//

import Foundation

enum PokemonApiEndpoints: String {
    
    case scheme = "https://"
    case host = "pokeapi.co/api/v2/"
    
    enum get: String {
        case list = "pokemon"
        case pokemon = "pokemon/%@"
    }
    
    enum image: String {
        case base = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/"
        case mimeType = ".png"
    }
}

struct PokemonApiQueries {
    static let originalList: QueryItem = QueryItem(name: "limit", value: "151")
}
