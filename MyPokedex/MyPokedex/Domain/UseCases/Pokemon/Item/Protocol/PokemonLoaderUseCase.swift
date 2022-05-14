//
//  PokemonLoaderUseCase.swift
//  MyPokedex
//
//  Created by Adrià Ros on 14/5/22.
//

import Foundation
import UIKit

protocol PokemonLoaderUseCase {
    func getPokemonWith(number: String?, completion: @escaping (Pokemon?) -> Void)
    func load(imageFrom url: URL?, completion: @escaping (_ data: UIImage?) -> Void)
}
