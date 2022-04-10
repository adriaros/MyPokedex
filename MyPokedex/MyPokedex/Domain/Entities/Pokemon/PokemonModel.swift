//
//  PokemonModel.swift
//  MyPokedex
//
//  Created by Adrià Ros on 10/4/22.
//

import Foundation

struct PokemonModel: Equatable {
    
    let id: Int?
    let name: String?
    let weight: Int?
    let height: Int?
    let moves: [PokemonMoveModel]?
    let types: [PokemonTypeModel]?
    let sprites: PokemonSpritesModel?
    
    init(_ data: ApiPokemonResponseModel?) {
        id = data?.id
        name = data?.name
        weight = data?.weight
        height = data?.height
        moves = data?.moves?.map({ PokemonMoveModel($0) })
        types = data?.types?.map({ PokemonTypeModel($0) })
        sprites = PokemonSpritesModel(data?.sprites)
    }
}
