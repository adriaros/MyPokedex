//
//  ImageCacheRepository.swift
//  MyPokedex
//
//  Created by Adrià Ros on 4/4/22.
//

import UIKit

protocol ImageCacheRepository {
    func store(image: UIImage?, url: URL?)
    func load(image url: URL?) -> UIImage?
}
