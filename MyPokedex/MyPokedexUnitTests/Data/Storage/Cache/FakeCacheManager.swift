//
//  FakeCacheManager.swift
//  MyPokedexUnitTests
//
//  Created by Adrià Ros on 9/4/22.
//

import Foundation
import UIKit
@testable import MyPokedex

class FakeCacheManager {
    var imageSet: UIImage?
    var loadedImage: UIImage?
}

extension FakeCacheManager: ImageCache {
    
    func set(image: UIImage, url: URL) {
        imageSet = image
    }
    
    func image(url: URL) -> UIImage? {
        loadedImage
    }
    
    func remove(image url: URL) {
        
    }
    
    func removeCache() {
        
    }
}
