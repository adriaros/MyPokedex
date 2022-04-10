//
//  PokemonSpritesModel.swift
//  MyPokedex
//
//  Created by Adrià Ros on 10/4/22.
//

import Foundation

struct PokemonSpritesModel: Equatable {
    
    var frontDefault: String?
    var frontShiny: String?
    var frontFemale: String?
    var frontShinyFemale: String?
    var backDefault: String?
    var backShiny: String?
    var backFemale: String?
    var backShinyFemale: String?
    
    init(_ data: ApiPokemonResponseModel.Sprites?) {
        frontDefault = data?.frontDefault
        frontShiny = data?.frontShiny
        frontFemale = data?.frontFemale
        frontShinyFemale = data?.frontShinyFemale
        backDefault = data?.backDefault
        backShiny = data?.backShiny
        backFemale = data?.backFemale
        backShinyFemale = data?.backShinyFemale
    }
}
