//
//  ImageAssets.swift
//  MyPokedex
//
//  Created by Adrià Ros on 27/2/22.
//

import UIKit

enum ImageAsset {
    
    enum TabBar: String {
        
        var image: UIImage? {
            return UIImage(named: self.rawValue)?.withRenderingMode(.alwaysOriginal)
        }
        
        case base = "tabbar_pokeball"
        case selected = "tabbar_open_pokeball_color"
    }
    
    enum Home: String {
        
        var image: UIImage? {
            return UIImage(named: self.rawValue)?.withRenderingMode(.alwaysOriginal)
        }
        
        case pokemon = "home_pokemon"
        case locations = "home_locations"
        case games = "home_games"
    }
}
