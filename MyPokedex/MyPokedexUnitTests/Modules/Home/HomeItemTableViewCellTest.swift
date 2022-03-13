//
//  HomeItemTableViewCellTest.swift
//  MyPokedexUnitTests
//
//  Created by Adrià Ros on 13/3/22.
//

import XCTest
@testable import MyPokedex

class HomeItemTableViewCellTest: XCTestCase {
    
    var sut: HomeItemTableViewCell!

    override func setUpWithError() throws {
        sut = Bundle(for: HomeItemTableViewCell.self).loadNibNamed(HomeItemTableViewCell.cellType, owner: nil)?.first as? HomeItemTableViewCell
        sut.layoutSubviews()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_configure() throws {
        // Given a title, description and an image
        let title = "Title"
        let description = "Description"
        let image = ImageAsset.Home.locations.image
        
        // When the cell is configured
        sut.configure(title: title, description: description, image: image)
        
        // Then
        XCTAssertEqual(sut.selectionStyle, .none)
        XCTAssertEqual(sut.backgroundColor, .clear)
        XCTAssertEqual(sut.containerShape.style, .rounded)
        XCTAssertEqual(sut.containerImageView.contentMode, .scaleAspectFit)
        XCTAssertEqual(sut.containerImageView.image, image)
        XCTAssertEqual(sut.titleLabel.style, .title(title, .black, .left, true, 1))
        XCTAssertEqual(sut.descriptionLabel.style, .paragraph(description, .black.withAlphaComponent(0.8), .left, true, 1))
    }
}
