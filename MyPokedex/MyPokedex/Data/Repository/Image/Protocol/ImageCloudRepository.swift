//
//  ImageCloudRepository.swift
//  MyPokedex
//
//  Created by Adrià Ros on 4/4/22.
//

import UIKit

protocol ImageCloudRepository {
    func download(imageFrom url: URL?, completion: @escaping (_ data: UIImage?) -> Void)
}
