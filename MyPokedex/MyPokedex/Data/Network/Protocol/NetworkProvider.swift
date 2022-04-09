//
//  NetworkProvider.swift
//  MyPokedex
//
//  Created by Adrià Ros on 26/3/22.
//

import Foundation
import UIKit

protocol NetworkProvider {
    func request(provider: NetworkRequestProvider, _ completion: @escaping (HTTPStatusCode, Data?) -> Void)
    func download(imageFrom url: URL?, completion: @escaping (_ data: UIImage?) -> Void)
}
