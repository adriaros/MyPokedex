//
//  MockFavourite.swift
//  MyPokedexUnitTests
//
//  Created by Adrià Ros on 21/6/22.
//

import Foundation
@testable import MyPokedex

final class MockFavourite: Favourite {
    
    var stubbedId: String?
    var stubbedName: String?
    var stubbedImageUrl: String?
    
    override var id: String? {
        get {
            return stubbedId
        }
        set {
            super.id = newValue
        }
    }
    
    override var name: String? {
        get {
            return stubbedName
        }
        set {
            super.id = newValue
        }
    }
    
    override var imageUrl: String? {
        get {
            return stubbedImageUrl
        }
        set {
            super.id = newValue
        }
    }
}
