//
//  PokemonLoaderUseCase.swift
//  MyPokedex
//
//  Created by Adrià Ros on 14/5/22.
//

import Foundation

protocol PokemonLoaderUseCase {
    func getPokemonWith(number: String?, completion: @escaping (Pokemon?) -> Void)
}
