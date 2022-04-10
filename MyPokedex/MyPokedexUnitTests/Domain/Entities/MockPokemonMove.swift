//
//  MockPokemonMove.swift
//  MyPokedexUnitTests
//
//  Created by Adrià Ros on 10/4/22.
//

import Foundation
@testable import MyPokedex

struct MockPokemonMove {
    
    static let name = "body-slam"
    
    static let moveData = ApiPokemonResponseModel.PKMove.PKSMove(name: name)
    static let data = ApiPokemonResponseModel.PKMove(move: moveData)
    static let item = PokemonMoveModel(data)
}
