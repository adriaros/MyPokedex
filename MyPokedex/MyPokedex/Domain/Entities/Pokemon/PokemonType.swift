//
//  PokemonType.swift
//  MyPokedex
//
//  Created by Adrià Ros on 10/4/22.
//

import Foundation

struct PokemonType: Equatable {
    
    let name: String?
    
    init(_ data: ApiPokemonResponseModel.PKType?) {
        name = data?.type?.name
    }
}
