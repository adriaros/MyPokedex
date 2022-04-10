//
//  MockPokemonType.swift
//  MyPokedexUnitTests
//
//  Created by Adrià Ros on 10/4/22.
//

import Foundation
@testable import MyPokedex

struct MockPokemonType {
    
    static let name = "grass"
    
    static let typeData = ApiPokemonResponseModel.PKType.PKSType(name: name)
    static let data = ApiPokemonResponseModel.PKType(type: typeData)
    static let item = PokemonTypeModel(data)
}
