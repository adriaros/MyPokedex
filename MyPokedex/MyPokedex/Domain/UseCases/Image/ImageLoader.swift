//
//  ImageLoader.swift
//  MyPokedex
//
//  Created by Adrià Ros on 14/5/22.
//

import Foundation
import UIKit

class ImageLoader: ImageLoaderUseCase {
    
    let provider: ImageCloudRepository & ImageCacheRepository
    
    init(provider: ImageCloudRepository & ImageCacheRepository) {
        self.provider = provider
    }
    
    func load(imageFrom url: URL?, completion: @escaping (_ data: UIImage?) -> Void) {
        guard let cachedImage = provider.load(image: url) else {
            provider.download(imageFrom: url) { data in
                guard let data = data else {
                    completion(nil)
                    return
                }
                
                self.provider.store(image: data, url: url)
                completion(data)
            }
            return
        }
        
        completion(cachedImage)
    }
}
