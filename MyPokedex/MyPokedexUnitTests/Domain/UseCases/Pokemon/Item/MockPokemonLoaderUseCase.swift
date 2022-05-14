//
//  MockPokemonLoaderUseCase.swift
//  MyPokedexUnitTests
//
//  Created by Adrià Ros on 14/5/22.
//

import Foundation
import UIKit
@testable import MyPokedex

class MockPokemonLoaderUseCase: PokemonLoaderUseCase {
    
    var pokemon: Pokemon?
    var image: UIImage?
    
    func getPokemonWith(number: String?, completion: @escaping (Pokemon?) -> Void) {
        completion(pokemon)
    }
    
    func load(imageFrom url: URL?, completion: @escaping (_ data: UIImage?) -> Void) {
        completion(image)
    }
}
