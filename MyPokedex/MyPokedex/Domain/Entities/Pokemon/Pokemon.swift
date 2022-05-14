//
//  Pokemon.swift
//  MyPokedex
//
//  Created by Adrià Ros on 10/4/22.
//

import Foundation

struct Pokemon: Equatable {
    
    let id: Int?
    let name: String?
    let weight: Int?
    let height: Int?
    let moves: [PokemonMove]?
    let types: [PokemonType]?
    let sprites: PokemonSprites?
    
    let imageBaseUrl = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/"
    let imageMimeType = ".png"
    var imageUrl: URL?
    
    var displayName: String {
        (name ?? "").capitalized
    }
    
    var displayWeight: String {
        guard let weight = weight else {
            return ""
        }

        return "\(Double(Double(weight) / 10)) kg"
    }
    
    var displayHeight: String {
        guard let decimetres = height else {
            return ""
        }

        return "\(Double(Double(decimetres) / 10)) m"
    }
    
    init(_ data: ApiPokemonResponseModel?) {
        id = data?.id
        name = data?.name
        weight = data?.weight
        height = data?.height
        moves = data?.moves?.map({ PokemonMove($0) })
        types = data?.types?.map({ PokemonType($0) })
        sprites = PokemonSprites(data?.sprites)
        
        guard let number = id else {
            return
        }
        imageUrl = URL(string: "\(imageBaseUrl)\(number)\(imageMimeType)")
    }
}
