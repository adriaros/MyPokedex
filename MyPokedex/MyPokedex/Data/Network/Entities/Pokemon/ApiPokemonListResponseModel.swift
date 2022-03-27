//
//  ApiPokemonListResponseModel.swift
//  MyPokedex
//
//  Created by Adrià Ros on 27/3/22.
//

import Foundation

struct ApiPokemonListResponseModel: Codable {
    var results: [ApiPokemonListResultModel]?
}

struct ApiPokemonListResultModel: Codable {
    var name: String?
    var url: String?
}
