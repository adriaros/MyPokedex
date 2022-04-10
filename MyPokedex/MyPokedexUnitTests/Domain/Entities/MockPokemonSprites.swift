//
//  MockPokemonSprites.swift
//  MyPokedexUnitTests
//
//  Created by Adrià Ros on 10/4/22.
//

import Foundation
@testable import MyPokedex

struct MockPokemonSprites {
    
    static let frontDefault = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/2.png"
    static let frontShiny = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/2.png"
    static let backDefault = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/2.png"
    static let backShiny = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/shiny/2.png"
    
    static let data = ApiPokemonResponseModel.Sprites(frontDefault: frontDefault,
                                                      frontShiny: frontShiny,
                                                      frontFemale: nil,
                                                      frontShinyFemale: nil,
                                                      backDefault: backDefault,
                                                      backShiny: backShiny,
                                                      backFemale: nil,
                                                      backShinyFemale: nil)
    static let item = PokemonSpritesModel(data)
}
