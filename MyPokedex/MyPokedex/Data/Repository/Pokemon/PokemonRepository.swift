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
        var request = NetworkRequest(url: URL(string: "https://pokeapi.co/api/v2/pokemon")!)
        request.method = .get
        
        network.request(provider: request) { _, data in
            if let data = data {
                print("AQUIIII: ", data)
            }
        }
    }
}
