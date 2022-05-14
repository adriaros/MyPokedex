//
//  PokemonMove.swift
//  MyPokedex
//
//  Created by Adrià Ros on 10/4/22.
//

import Foundation

struct PokemonMove: Equatable {
    
    let name: String?
    
    init(_ data: ApiPokemonResponseModel.PKMove?) {
        name = data?.move?.name
    }
}
