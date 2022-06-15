//
//  FakeImageRepository.swift
//  MyPokedexUnitTests
//
//  Created by Adrià Ros on 9/4/22.
//

import Foundation
import UIKit
@testable import MyPokedex

class FakeImageRepository {
    
    var imageDownloaded: UIImage?
    var imageToStore: UIImage?
    var imageToLoad: UIImage?
}

extension FakeImageRepository: ImageCloudRepository {
    
    func download(imageFrom url: URL?, completion: @escaping (UIImage?) -> Void) {
        completion(imageDownloaded)
    }
}

extension FakeImageRepository: ImageCacheRepository {

    func store(image: UIImage?, url: URL?) {
        imageToStore = image
    }
    
    func load(image url: URL?) -> UIImage? {
        imageToLoad
    }
}
