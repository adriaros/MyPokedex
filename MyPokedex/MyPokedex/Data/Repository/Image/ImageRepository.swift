//
//  ImageRepository.swift
//  MyPokedex
//
//  Created by Adrià Ros on 4/4/22.
//

import UIKit

class ImageRepository {
    
    let network: NetworkProvider
    let cache: ImageCache
    
    init(network: NetworkProvider, cache: ImageCache) {
        self.network = network
        self.cache = cache
    }
}

extension ImageRepository: ImageCloudRepository {
    
    func download(imageFrom url: URL?, completion: @escaping (_ data: UIImage?) -> Void) {
        network.download(imageFrom: url) { data in
            completion(data)
        }
    }
}

extension ImageRepository: ImageCacheRepository {
    
    func store(image: UIImage?, url: URL?) {
        guard let image = image, let url = url else {
            return
        }
        
        cache.set(image: image, url: url)
    }
    
    func load(image url: URL?) -> UIImage? {
        guard let url = url else {
            return nil
        }
        
        return cache.image(url: url)
    }
}
