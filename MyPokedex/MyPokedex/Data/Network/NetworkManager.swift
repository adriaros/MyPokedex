//
//  NetworkManager.swift
//  MyPokedex
//
//  Created by Adrià Ros on 26/3/22.
//

import Foundation

class NetworkManager: NetworkProvider {
    
    func request(provider: NetworkRequestProvider) {
        
        var request = URLRequest(url: provider.url)
        request.httpMethod = provider.method.rawValue
        
        let task = URLSession.shared.dataTask(with: request) {(data, response, error) in
            guard let data = data else {
                return
            }
            print(String(data: data, encoding: .utf8)!)
        }

        task.resume()
    }
}

struct NetworkRequest: NetworkRequestProvider {
    
    var url: URL
    var method: HTTPMethod = .get
}
