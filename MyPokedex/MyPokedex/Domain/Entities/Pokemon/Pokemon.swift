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
    
    var imageUrl: URL? {
        URL(string: "\(PokemonApiEndpoints.image.base.rawValue)\(id ?? 0)\(PokemonApiEndpoints.image.mimeType.rawValue)")
    }
    
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
    }
}
