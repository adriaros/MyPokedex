//
//  PokemonCloudRepository.swift
//  MyPokedex
//
//  Created by Adrià Ros on 26/3/22.
//

import Foundation

protocol PokemonCloudRepository {
    func get(originalList completion: @escaping ([PokemonListItemModel]?) -> Void)
    func get(pokemon: String, completion: @escaping (PokemonModel?) -> Void)
}
