//
//  PokemonDetailDataTableViewCellTest.swift
//  MyPokedexUnitTests
//
//  Created by Adrià Ros on 14/5/22.
//

import XCTest
@testable import MyPokedex

class PokemonDetailDataTableViewCellTest: XCTestCase {

    var sut:  PokemonDetailDataTableViewCell!

    override func setUpWithError() throws {
        sut = Bundle(for: PokemonDetailDataTableViewCell.self).loadNibNamed(PokemonDetailDataTableViewCell.cellType, owner: nil)?.first as? PokemonDetailDataTableViewCell
        sut.layoutSubviews()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testExample() throws {
        // Given a pokemon
        let pokemon = MockPokemon.item
        
        // When the cell is configured
        sut.configure(pokemon: pokemon)
        
        // Then the cell is configured
        XCTAssertEqual(sut.pokemonNameLabel.text, MockPokemon.item.displayName)
        XCTAssertEqual(sut.pokemonWeightTitleLabel.text, "Weight")
        XCTAssertEqual(sut.pokemonWeightValueLabel.text, MockPokemon.item.displayWeight)
        XCTAssertEqual(sut.pokemonHeightTitleLabel.text, "Height")
        XCTAssertEqual(sut.pokemonHeightValueLabel.text, MockPokemon.item.displayHeight)
    }
}
