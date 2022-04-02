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
    
    var number = ""
    var imageUrl: URL?
    
    let imageBaseUrl = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/"
    let imageMimeType = ".png"
    
    var displayName: String {
        name?.capitalized ?? "N/A"
    }
    
    var displayNumber: String {
        "#\(number)"
    }
    
    init(_ data: ApiPokemonListResultModel?) {
        
        name = data?.name
        url = data?.url
        
        guard let numberFromUrl = data?.url?.westernArabicNumeralsOnly.dropFirst() else {
            return
        }
        
        number = String(numberFromUrl)
        imageUrl = URL(string: "\(imageBaseUrl)\(numberFromUrl)\(imageMimeType)") 
    }
}

extension String {
    
    var westernArabicNumeralsOnly: String {
        let pattern = UnicodeScalar("0")..."9"
        return String(unicodeScalars.compactMap { pattern ~= $0 ? Character($0) : nil })
    }
}
