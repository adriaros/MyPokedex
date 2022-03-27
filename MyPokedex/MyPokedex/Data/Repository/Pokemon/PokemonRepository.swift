//
//  PokemonRepository.swift
//  MyPokedex
//
//  Created by Adrià Ros on 26/3/22.
//

import Foundation

class PokemonRepository: PokemonCloudRepository {
    
    let network: NetworkProvider
    
    var url: String {
        "\(PokemonApiEndpoints.scheme.rawValue)\(PokemonApiEndpoints.host.rawValue)"
    }
    
    init(network: NetworkProvider) {
        self.network = network
    }
    
    func getOriginalList() {
        var request = NetworkRequest()
        request.method = .get
        request.url = "\(url)\(PokemonApiEndpoints.get.list.rawValue)"
        
        request.queryItems = [
            PokemonApiQueries.originalList
        ]
        
        network.request(provider: request) { _, data in
            
            let decodedData: ApiPokemonListResponseModel? = JSONDecoder().decode(data: data)
            
            if let decodedData = decodedData {
                print("AQUIIII: ", decodedData)
            }
        }
    }
}
