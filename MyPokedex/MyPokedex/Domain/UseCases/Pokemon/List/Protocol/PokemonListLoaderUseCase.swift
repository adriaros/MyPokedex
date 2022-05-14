//
//  PokemonListLoaderUseCase.swift
//  MyPokedex
//
//  Created by Adrià Ros on 27/3/22.
//

import Foundation
import UIKit

protocol PokemonListLoaderUseCase {
    func get(originalList completion: @escaping ([PokemonListItem]?) -> Void)
    func load(imageFrom url: URL?, completion: @escaping (_ data: UIImage?) -> Void)
}
