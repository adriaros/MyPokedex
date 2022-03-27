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
    }
}

struct PokemonApiQueries {
    static let originalList: URLQueryItem = URLQueryItem(name: "limit", value: "151")
}
