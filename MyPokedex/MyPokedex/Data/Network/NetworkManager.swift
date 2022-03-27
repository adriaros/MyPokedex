//
//  NetworkManager.swift
//  MyPokedex
//
//  Created by Adrià Ros on 26/3/22.
//

import Foundation

class NetworkManager: NetworkProvider {
    
    func request(provider: NetworkRequestProvider, _ completion: @escaping (HTTPStatusCode, ApiPokemonListResponseModel?) -> Void) {
        
        var request = URLRequest(url: provider.url)
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
            
            let decodedData: ApiPokemonListResponseModel? = JSONDecoder().decode(data: data)
            completion(statusCode, decodedData)
        }

        task.resume()
    }
}
