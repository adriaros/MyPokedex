//
//  GameListItem.swift
//  MyPokedex
//
//  Created by Adrià Ros on 21/5/22.
//

import Foundation

struct GameListItem: Equatable {
    
    let name: String?
    
    init(_ data: ApiGameListResultModel?) {
        name = data?.name?.capitalized
    }
}
