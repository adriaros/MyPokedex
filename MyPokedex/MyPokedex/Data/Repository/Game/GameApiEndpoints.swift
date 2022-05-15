//
//  GameApiEndpoints.swift
//  MyPokedex
//
//  Created by Adrià Ros on 15/5/22.
//

import Foundation

enum GameApiEndpoints: String {
    
    case scheme = "https://"
    case host = "pokeapi.co/api/v2/"
    
    enum get: String {
        case list = "version"
    }
}

struct GameApiQueries {
    static let versionList: QueryItem = QueryItem(name: "limit", value: "34")
}
