//
//  ImageCache.swift
//  MyPokedex
//
//  Created by Adrià Ros on 4/4/22.
//

import UIKit

protocol ImageCache {
    func set(image: UIImage, url: URL)
    func image(url: URL) -> UIImage?
    func remove(image url: URL)
    func removeCache()
}
