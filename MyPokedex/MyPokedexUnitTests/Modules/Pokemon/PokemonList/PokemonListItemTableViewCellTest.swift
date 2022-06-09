//
//  PokemonListItemTableViewCellTest.swift
//  MyPokedexUnitTests
//
//  Created by Adrià Ros on 14/5/22.
//

import XCTest
@testable import MyPokedex

class PokemonListItemTableViewCellTest: XCTestCase {
    
    var sut:  PokemonListItemTableViewCell!

    override func setUpWithError() throws {
        sut = Bundle(for: PokemonListItemTableViewCell.self).loadNibNamed(PokemonListItemTableViewCell.cellType, owner: nil)?.first as? PokemonListItemTableViewCell
        sut.layoutSubviews()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_configure() throws {
        // Given a number and name
        let number = "#1"
        let name = "Bulbasaur"
        
        // When the cell is configured
        sut.configure(number: number, name: name, image: nil)
        
        // Then
        XCTAssertEqual(sut.selectionStyle, .none)
        XCTAssertEqual(sut.backgroundColor, .clear)
        XCTAssertEqual(sut.containerShape.style, .rounded)
        XCTAssertEqual(sut.itemNumberLabel.style, .number(number, .black.withAlphaComponent(0.8), .left, true, 1))
        XCTAssertEqual(sut.itemNameLabel.style, .title(name, .black, .left, true, 1))
    }
}

