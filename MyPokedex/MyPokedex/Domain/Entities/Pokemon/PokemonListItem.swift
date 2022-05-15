//
//  PokemonListItem.swift
//  MyPokedex
//
//  Created by Adrià Ros on 28/3/22.
//

import Foundation

struct PokemonListItem: Equatable {
    
    let name: String?
    let url: String?
    
    var number: String {
        String(url?.westernArabicNumeralsOnly.dropFirst() ?? "")
    }
    
    var imageUrl: URL? {
        URL(string: "\(PokemonApiEndpoints.image.base.rawValue)\(number)\(PokemonApiEndpoints.image.mimeType.rawValue)")
    }
    
    var displayName: String {
        name?.capitalized ?? "N/A"
    }
    
    var displayNumber: String {
        "#\(number)"
    }
    
    init(_ data: ApiPokemonListResultModel?) {
        name = data?.name
        url = data?.url
    }
}

extension String {
    
    var westernArabicNumeralsOnly: String {
        let pattern = UnicodeScalar("0")..."9"
        return String(unicodeScalars.compactMap { pattern ~= $0 ? Character($0) : nil })
    }
}
