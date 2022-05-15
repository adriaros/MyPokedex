//
//  PokemonType.swift
//  MyPokedex
//
//  Created by Adrià Ros on 10/4/22.
//

import Foundation
import UIKit

enum PokemonTypeImage: String {
    
    case bug
    case dark
    case dragon
    case electric
    case fairy
    case fighting
    case fire
    case flying
    case ghost
    case grass
    case ground
    case ice
    case normal
    case poison
    case psychic
    case rock
    case steel
    case water
    
    var image: UIImage? {
        switch self {
        case .bug:
            return ImageAsset.PokemonType.bug.image
        case .dark:
            return ImageAsset.PokemonType.dark.image
        case .dragon:
            return ImageAsset.PokemonType.dragon.image
        case .electric:
            return ImageAsset.PokemonType.electric.image
        case .fairy:
            return ImageAsset.PokemonType.fairy.image
        case .fighting:
            return ImageAsset.PokemonType.fighting.image
        case .fire:
            return ImageAsset.PokemonType.fire.image
        case .flying:
            return ImageAsset.PokemonType.flying.image
        case .ghost:
            return ImageAsset.PokemonType.ghost.image
        case .grass:
            return ImageAsset.PokemonType.grass.image
        case .ground:
            return ImageAsset.PokemonType.ground.image
        case .ice:
            return ImageAsset.PokemonType.ice.image
        case .normal:
            return ImageAsset.PokemonType.normal.image
        case .poison:
            return ImageAsset.PokemonType.poison.image
        case .psychic:
            return ImageAsset.PokemonType.psychic.image
        case .rock:
            return ImageAsset.PokemonType.rock.image
        case .steel:
            return ImageAsset.PokemonType.steel.image
        case .water:
            return ImageAsset.PokemonType.water.image
        }
    }
}

struct PokemonType: Equatable {
    
    let name: String?
    
    var displayImage: UIImage? {
        PokemonTypeImage(rawValue: name ?? "")?.image
    }
    
    init(_ data: ApiPokemonResponseModel.PKType?) {
        name = data?.type?.name
    }
}
