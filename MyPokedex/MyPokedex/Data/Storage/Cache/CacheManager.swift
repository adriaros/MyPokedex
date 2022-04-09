//
//  CacheManager.swift
//  MyPokedex
//
//  Created by Adrià Ros on 4/4/22.
//

import UIKit

class CacheManager {
    let cachedImages = NSCache<NSURL, UIImage>()
}

extension CacheManager: ImageCache {
    
    func set(image: UIImage, url: URL) {
        cachedImages.setObject(image, forKey: NSURL(fileURLWithPath: url.absoluteString))
    }
    
    func image(url: URL) -> UIImage? {
        cachedImages.object(forKey: NSURL(fileURLWithPath: url.absoluteString))
    }
    
    func remove(image url: URL) {
        cachedImages.removeObject(forKey: NSURL(fileURLWithPath: url.absoluteString))
    }
    
    func removeCache() {
        cachedImages.removeAllObjects()
    }
}
