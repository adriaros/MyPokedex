//
//  DSLabelTest.swift
//  MyPokedexUnitTests
//
//  Created by Adrià Ros on 13/3/22.
//

import XCTest
@testable import MyPokedex

class DSLabelTest: XCTestCase {
    
    var sut: DSLabel!

    override func setUpWithError() throws {
        sut = DSLabel(frame: CGRect(x: 0, y: 0, width: 50, height: 20))
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_title() throws {
        // Given the style
        let style: DSLabelStyle = .title("title", .black, .left, true, 1)
        
        // When the style is set
        sut.style = style
        
        // Then the style is configured correctly
        XCTAssertEqual(sut.text, "title")
        XCTAssertEqual(sut.textColor, .black)
        XCTAssertEqual(sut.font, UIFont(name: "Noteworthy Bold", size: 20))
        XCTAssertEqual(sut.textAlignment, .left)
        XCTAssertEqual(sut.numberOfLines, 1)
        XCTAssertTrue(sut.adjustsFontSizeToFitWidth)
    }
    
    func test_paragraph() throws {
        // Given the style
        let style: DSLabelStyle = .paragraph("text", .black, .left, true, 1)
        
        // When the style is set
        sut.style = style
        
        // Then the style is configured correctly
        XCTAssertEqual(sut.text, "text")
        XCTAssertEqual(sut.textColor, .black)
        XCTAssertEqual(sut.font, UIFont(name: "Noteworthy Light", size: 16))
        XCTAssertEqual(sut.textAlignment, .left)
        XCTAssertEqual(sut.numberOfLines, 1)
        XCTAssertTrue(sut.adjustsFontSizeToFitWidth)
    }
}
