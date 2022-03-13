//
//  DSShapeTest.swift
//  MyPokedexUnitTests
//
//  Created by Adrià Ros on 13/3/22.
//

import XCTest
@testable import MyPokedex

class DSShapeTest: XCTestCase {
    
    var sut: DSShape!

    override func setUpWithError() throws {
        sut = DSShape(frame: CGRect(x: 0, y: 0, width: 50, height: 20))
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_rounded() throws {
        // Given the style
        let style: DSShapeStyle = .rounded
        
        // When the style is set
        sut.style = style
        
        // Then the style is configured correctly
        XCTAssertEqual(sut.layer.cornerRadius, 12)
        XCTAssertEqual(sut.layer.shadowColor, UIColor.gray.cgColor)
        XCTAssertEqual(sut.layer.shadowOpacity, 0.4)
        XCTAssertEqual(sut.layer.shadowRadius, 4.0)
        XCTAssertEqual(sut.layer.shadowOffset, .zero)
    }
}
