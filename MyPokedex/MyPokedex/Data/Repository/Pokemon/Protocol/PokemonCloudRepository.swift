//
//  PokemonCloudRepository.swift
//  MyPokedex
//
//  Created by Adrià Ros on 26/3/22.
//

import Foundation

protocol PokemonCloudRepository {
    func get(originalList completion: @escaping ([PokemonListItem]?) -> Void)
    func get(pokemon: String, completion: @escaping (Pokemon?) -> Void)
}
