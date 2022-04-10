//
//  ApiPokemonResponseModel.swift
//  MyPokedex
//
//  Created by Adrià Ros on 9/4/22.
//

import Foundation

struct ApiPokemonResponseModel: Codable {
    var id: Int?
    var name: String?
    var weight: Int?
    var height: Int?
    var moves: [PKMove]?
    var types: [PKType]?
    var sprites: Sprites?
}

extension ApiPokemonResponseModel {
    
    struct PKMove: Codable {
        var move: PKSMove?
    }
    
    struct PKType: Codable {
        var type: PKSType?
    }
    
    struct Sprites: Codable {
        
        var frontDefault: String?
        var frontShiny: String?
        var frontFemale: String?
        var frontShinyFemale: String?
        var backDefault: String?
        var backShiny: String?
        var backFemale: String?
        var backShinyFemale: String?
        
        enum CodingKeys: String, CodingKey {
            case frontDefault = "front_default"
            case frontShiny = "front_shiny"
            case frontFemale = "front_female"
            case frontShinyFemale = "front_shiny_female"
            case backDefault = "back_default"
            case backShiny = "back_shiny"
            case backFemale = "back_female"
            case backShinyFemale = "back_shiny_female"
        }
    }
}

extension ApiPokemonResponseModel.PKType {
    
    struct PKSType: Codable {
        var name: String?
    }
}

extension ApiPokemonResponseModel.PKMove {
    
    struct PKSMove: Codable {
        var name: String?
    }
}
