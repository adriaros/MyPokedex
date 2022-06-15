//
//  FakeNetworkManager.swift
//  MyPokedexUnitTests
//
//  Created by Adrià Ros on 28/3/22.
//

import Foundation
import UIKit
import RxSwift
import RxTest
@testable import MyPokedex

class FakeNetworkManager {
    var mockHTTPStatusCode: HTTPStatusCode = .success
    var mockData: Data?
    var mockImage: UIImage?
    var mockObservableData: Observable<Data?>!
}

extension FakeNetworkManager: NetworkProvider {
    
    func request(provider: NetworkRequestProvider, _ completion: @escaping (HTTPStatusCode, Data?) -> Void) {
        completion(mockHTTPStatusCode, mockData)
    }
    
    func download(imageFrom url: URL?, completion: @escaping (_ data: UIImage?) -> Void) {
        completion(mockImage)
    }
}

extension FakeNetworkManager: NetworkRXProvider {
    
    func request(provider: NetworkRequestProvider) -> Observable<Data?> {
        return mockObservableData
    }
}
