//
//  MockImageRepository.swift
//  MyPokedexUnitTests
//
//  Created by Adrià Ros on 9/4/22.
//

import Foundation
import UIKit
@testable import MyPokedex

class MockImageRepository {
    
    var imageDownloaded: UIImage?
    var imageToStore: UIImage?
    var imageToLoad: UIImage?
}

extension MockImageRepository: ImageCloudRepository {
    
    func download(imageFrom url: URL?, completion: @escaping (UIImage?) -> Void) {
        completion(imageDownloaded)
    }
}

extension MockImageRepository: ImageCacheRepository {

    func store(image: UIImage?, url: URL?) {
        imageToStore = image
    }
    
    func load(image url: URL?) -> UIImage? {
        imageToLoad
    }
}
