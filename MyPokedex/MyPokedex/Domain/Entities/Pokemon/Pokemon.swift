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
    let types: [PokemonType]?
    
    let imageBaseUrl = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/"
    let imageMimeType = ".png"
    var imageUrl: URL?
    
    var displayName: String {
        (name ?? "").capitalized
    }
    
    var displayWeight: String {
        guard let hectograms = weight else {
            return ""
        }

        return "\(Double(Double(hectograms) / 10)) kg"
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
        types = data?.types?.map({ PokemonType($0) })
        
        if let number = id {
            imageUrl = URL(string: "\(imageBaseUrl)\(number)\(imageMimeType)")
        }
    }
}
