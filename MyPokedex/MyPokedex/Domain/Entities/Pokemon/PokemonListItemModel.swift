//
//  PokemonListItemModel.swift
//  MyPokedex
//
//  Created by Adrià Ros on 28/3/22.
//

import Foundation

struct PokemonListItemModel: Equatable {
    
    let name: String?
    let url: String?
    var imageUrl: String?
    
    let imageBaseUrl = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/"
    let imageMimeType = ".png"
    
    init(_ data: ApiPokemonListResultModel?) {
        name = data?.name
        url = data?.url
        imageUrl = "\(imageBaseUrl)\(data?.url?.westernArabicNumeralsOnly.dropFirst() ?? "1")\(imageMimeType)"
    }
}

extension String {
    
    var westernArabicNumeralsOnly: String {
        let pattern = UnicodeScalar("0")..."9"
        return String(unicodeScalars.compactMap { pattern ~= $0 ? Character($0) : nil })
    }
}
