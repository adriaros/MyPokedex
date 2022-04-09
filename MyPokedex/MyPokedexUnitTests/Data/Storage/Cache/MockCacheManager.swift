//
//  MockCacheManager.swift
//  MyPokedexUnitTests
//
//  Created by Adrià Ros on 9/4/22.
//

import Foundation
import UIKit
@testable import MyPokedex

class MockCacheManager {
    var imageSet: UIImage?
    var loadedImage: UIImage?
}

extension MockCacheManager: ImageCache {
    
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
