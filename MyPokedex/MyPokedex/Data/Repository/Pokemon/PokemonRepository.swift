//
//  PokemonRepository.swift
//  MyPokedex
//
//  Created by Adrià Ros on 26/3/22.
//

import Foundation

class PokemonRepository: PokemonCloudRepository {
    
    let network: NetworkProvider
    
    init(network: NetworkProvider) {
        self.network = network
    }
    
    func get() {
        var request = NetworkRequest()
        request.url = "https://pokeapi.co/api/v2/pokemon?limit=151"
        request.method = .get
        
        network.request(provider: request) { _, data in
            
            let decodedData: ApiPokemonListResponseModel? = JSONDecoder().decode(data: data)
            
            if let decodedData = decodedData {
                print("AQUIIII: ", decodedData)
            }
        }
    }
}
