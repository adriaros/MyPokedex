//
//  MockNetworkManager.swift
//  MyPokedexUnitTests
//
//  Created by Adrià Ros on 28/3/22.
//

import Foundation
@testable import MyPokedex

class MockNetworkManager: NetworkProvider {
    
    var mockHTTPStatusCode: HTTPStatusCode = .success
    var mockData: Data?
    
    func request(provider: NetworkRequestProvider, _ completion: @escaping (HTTPStatusCode, Data?) -> Void) {
        completion(mockHTTPStatusCode, mockData)
    }
}
