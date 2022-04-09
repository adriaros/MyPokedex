//
//  MockNetworkManager.swift
//  MyPokedexUnitTests
//
//  Created by Adrià Ros on 28/3/22.
//

import Foundation
import UIKit
@testable import MyPokedex

class MockNetworkManager: NetworkProvider {
    
    var mockHTTPStatusCode: HTTPStatusCode = .success
    var mockData: Data?
    var mockImage: UIImage?
    
    func request(provider: NetworkRequestProvider, _ completion: @escaping (HTTPStatusCode, Data?) -> Void) {
        completion(mockHTTPStatusCode, mockData)
    }
    
    func download(imageFrom url: URL?, completion: @escaping (_ data: UIImage?) -> Void) {
        completion(mockImage)
    }
}
