//
//  ImageAssets.swift
//  MyPokedex
//
//  Created by Adrià Ros on 27/2/22.
//

import UIKit

enum ImageAsset {
    
    enum Navigation: String {
        
        var image: UIImage? {
            return UIImage(named: self.rawValue)?.withRenderingMode(.alwaysOriginal)
        }
        
        case back = "back_button"
    }
    
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
    
    enum PokemonList: String {
        
        var image: UIImage? {
            return UIImage(named: self.rawValue)?.withRenderingMode(.alwaysOriginal)
        }
        
        case fallback = "tabbar_open_pokeball_color"
    }
    
    enum PokemonDetail: String {
        
        var image: UIImage? {
            return UIImage(named: self.rawValue)?.withRenderingMode(.alwaysOriginal)
        }
        
        case fallback = "tabbar_open_pokeball_color"
    }
    
    enum PokemonType: String {
        
        var image: UIImage? {
            return UIImage(named: self.rawValue)?.withRenderingMode(.alwaysOriginal)
        }
        
        case bug = "pokemon_type_bug"
        case dark = "pokemon_type_dark"
        case dragon = "pokemon_type_dragon"
        case electric = "pokemon_type_electric"
        case fairy = "pokemon_type_fairy"
        case fighting = "pokemon_type_fighting"
        case fire = "pokemon_type_fire"
        case flying = "pokemon_type_flying"
        case ghost = "pokemon_type_ghost"
        case grass = "pokemon_type_grass"
        case ground = "pokemon_type_ground"
        case ice = "pokemon_type_ice"
        case normal = "pokemon_type_normal"
        case poison = "pokemon_type_poison"
        case psychic = "pokemon_type_psychic"
        case rock = "pokemon_type_rock"
        case steel = "pokemon_type_steel"
        case water = "pokemon_type_water"
    }
}
