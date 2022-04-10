//
//  MockPokemonApiResponses.swift
//  MyPokedexUnitTests
//
//  Created by Adrià Ros on 29/3/22.
//

import Foundation

class MockPokemonApiResponses {
    
    let bundle: Bundle
    
    init() {
        bundle = Bundle(for: type(of: self ))
    }
    
    var getOriginalList: Data? {
        getter.originalList(bundle).response
    }
    
    var getPokemon: Data? {
        getter.pokemon(bundle).response
    }
    
    enum getter {
        
        case originalList(Bundle)
        case pokemon(Bundle)
        
        var response: Data? {
            
            var path: String?
            
            switch self {
            case let .originalList(bundle):
                path = bundle.path(forResource: "GET_pokemon_originalList", ofType: "json")
            case let .pokemon(bundle):
                path = bundle.path(forResource: "GET_pokemon", ofType: "json")
            }
            
            do {
                return try NSData(contentsOfFile: path ?? "{}", options: .mappedIfSafe) as Data
            } catch {
                return nil
            }
        }
    }
}
