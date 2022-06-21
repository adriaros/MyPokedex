//
//  MockGameListItem.swift
//  MyPokedexUnitTests
//
//  Created by Adrià Ros on 9/6/22.
//

import Foundation
@testable import MyPokedex

struct MockGameListItem {
    
    static let name = "red"
    
    static let data = ApiGameListResultModel(name: name, url: "")
    static let item = GameListItem(data)
}
