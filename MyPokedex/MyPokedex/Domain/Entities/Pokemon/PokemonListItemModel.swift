//
//  PokemonListItemModel.swift
//  MyPokedex
//
//  Created by Adrià Ros on 28/3/22.
//

import Foundation

struct PokemonListItemModel: Equatable {
    
    var name: String?
    var url: String?
    
    init(_ data: ApiPokemonListResultModel?) {
        name = data?.name
        url = data?.url
    }
}
