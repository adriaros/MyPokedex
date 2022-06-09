//
//  MockGameApiResponses.swift
//  MyPokedexUnitTests
//
//  Created by Adrià Ros on 21/5/22.
//

import Foundation

class MockGameApiResponses {
    
    let bundle: Bundle
    
    init() {
        bundle = Bundle(for: type(of: self ))
    }
    
    var getVersionList: Data? {
        getter.versionList(bundle).response
    }
    
    enum getter {
        
        case versionList(Bundle)
        
        var response: Data? {
            
            var path: String?
            
            switch self {
            case let .versionList(bundle):
                path = bundle.path(forResource: "GET_game_versionList", ofType: "json")
            }
            
            do {
                return try NSData(contentsOfFile: path ?? "{}", options: .mappedIfSafe) as Data
            } catch {
                return nil
            }
        }
    }
}
