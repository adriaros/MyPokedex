//
//  MockPokemonListLoaderUseCase.swift
//  MyPokedexUnitTests
//
//  Created by Adrià Ros on 28/3/22.
//

import Foundation
import UIKit
@testable import MyPokedex

class MockPokemonListLoaderUseCase: PokemonListLoaderUseCase {
    
    var originalList: [PokemonListItem]?
    var image: UIImage?

    func get(originalList completion: @escaping ([PokemonListItem]?) -> Void) {
        completion(originalList)
    }
    
    func load(imageFrom url: URL?, completion: @escaping (_ data: UIImage?) -> Void) {
        completion(image)
    }
}
