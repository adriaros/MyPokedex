//
//  ImageAssets.swift
//  MyPokedex
//
//  Created by Adrià Ros on 27/2/22.
//

import UIKit

enum ImageAsset {
    
    enum Splash: String {
        
        var image: UIImage? {
            return UIImage(named: self.rawValue)?.withRenderingMode(.alwaysOriginal)
        }
        
        case launch = "Launch"
    }
}
