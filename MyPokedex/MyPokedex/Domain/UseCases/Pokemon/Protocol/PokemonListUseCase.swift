//
//  PokemonListUseCase.swift
//  MyPokedex
//
//  Created by Adrià Ros on 27/3/22.
//

import Foundation

protocol PokemonListUseCase {
    func get(originalList completion: @escaping ([PokemonListItemModel]?) -> Void)
}
