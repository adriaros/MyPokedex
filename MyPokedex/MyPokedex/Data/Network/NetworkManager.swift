//
//  NetworkManager.swift
//  MyPokedex
//
//  Created by Adrià Ros on 26/3/22.
//

import Foundation

class NetworkManager: NetworkProvider {
    
    func request(provider: NetworkRequestProvider, _ completion: @escaping (HTTPStatusCode, Data?) -> Void) {
        
        var components = URLComponents(string: provider.url)
        
        if let queryItems = provider.queryItems {
            components?.queryItems = queryItems
        }
        
        guard let url = components?.url else {
            completion(.unknown, nil)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = provider.method.rawValue
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let response = response as? HTTPURLResponse else {
                completion(.unknown, nil)
                return
            }
            
            let statusCode = HTTPStatusCode(statusCode: response.statusCode)
            
            guard statusCode == .success else {
                completion(statusCode, nil)
                return
            }
            
            completion(statusCode, data)
        }

        task.resume()
    }
}
