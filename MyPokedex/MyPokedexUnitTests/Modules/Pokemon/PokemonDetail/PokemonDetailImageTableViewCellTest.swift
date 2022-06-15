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
    var delegate: PokemonDetailImageTableViewCellTestableDelegate!

    override func setUpWithError() throws {
        delegate = PokemonDetailImageTableViewCellTestableDelegate()
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
        sut.configure(image: url, favourite: false)
        
        // Then the cell is configured
        XCTAssertEqual(sut.selectionStyle, .none)
        XCTAssertEqual(sut.pokemonImageView.image, ImageAsset.PokemonDetail.fallback.image)
        XCTAssertEqual(sut.favouriteButton.image(for: .normal), UIImage(systemName: "suit.heart"))
    }
    
    func test_onFavourite() throws {
        // Given a fake URL
        let url = URL(string: "/image/download/path")
        
        // Given a mock image
        imageProvider.image = ImageAsset.PokemonDetail.fallback.image
        
        // Give a configured cell
        sut.delegate = delegate
        sut.configure(image: url, favourite: false)
        
        // When the favourite button is tapped
        sut.onFavourite(sut.favouriteButton!)
        
        // Then the button has changed to filled shape
        XCTAssertEqual(sut.favouriteButton.image(for: .normal), UIImage(systemName: "suit.heart.fill"))
        
        // Then the delegate is called
        XCTAssertTrue(delegate.onFavouriteCalled)
    }
}

class PokemonDetailImageTableViewCellTestableDelegate: PokemonDetailImageTableViewCellDelegate {
    
    var onFavouriteCalled = false
    
    func onFavourite() {
        onFavouriteCalled = true
    }
}
