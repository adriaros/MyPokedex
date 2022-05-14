//
//  PokemonDetailImageTableViewCellTest.swift
//  MyPokedexUnitTests
//
//  Created by Adrià Ros on 14/5/22.
//

import XCTest
@testable import MyPokedex

class PokemonDetailImageTableViewCellTest: XCTestCase {
    
    var sut:  PokemonDetailImageTableViewCell!
    var imageProvider: MockImageProviderUseCase!

    override func setUpWithError() throws {
        sut = Bundle(for: PokemonDetailImageTableViewCell.self).loadNibNamed(PokemonDetailImageTableViewCell.cellType, owner: nil)?.first as? PokemonDetailImageTableViewCell
        imageProvider = MockImageProviderUseCase()
        sut.imageProvider = imageProvider
        sut.layoutSubviews()
    }

    override func tearDownWithError() throws {
        imageProvider = nil
        sut = nil
    }

    func test_configure() throws {
        // Given a fake URL
        let url = URL(string: "/image/download/path")
        
        // Given a mock image
        imageProvider.image = ImageAsset.PokemonDetail.fallback.image
        
        // When the cell is configured
        sut.configure(image: url)
        
        // Then
        XCTAssertEqual(sut.selectionStyle, .none)
        XCTAssertEqual(sut.pokemonImageView.image, ImageAsset.PokemonDetail.fallback.image)
    }
}
