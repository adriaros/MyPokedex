//
//  PokemonRepository.swift
//  MyPokedex
//
//  Created by Adrià Ros on 26/3/22.
//

import Foundation

class PokemonRepository {
    
    let network: NetworkProvider
    
    var url: String {
        "\(PokemonApiEndpoints.scheme.rawValue)\(PokemonApiEndpoints.host.rawValue)"
    }
    
    init(network: NetworkProvider) {
        self.network = network
    }
}

extension PokemonRepository: PokemonCloudRepository {
    
    func get(originalList completion: @escaping ([PokemonListItem]?) -> Void) {
        var request = NetworkRequest()
        request.method = .get
        request.url = "\(url)\(PokemonApiEndpoints.get.list.rawValue)"
        
        request.queryItems = [
            PokemonApiQueries.originalList
        ]
        
        network.request(provider: request) { _, data in
            guard let decodedData: ApiPokemonListResponseModel? = JSONDecoder().decode(data: data) else {
                completion(nil)
                return
            }
            
            guard let results = decodedData?.results else {
                completion(nil)
                return
            }
            
            completion(results.map({ PokemonListItem($0) }))
        }
    }
    
    func get(pokemon: String, completion: @escaping (Pokemon?) -> Void) {
        var request = NetworkRequest()
        request.method = .get
        request.url = String(format: "\(url)\(PokemonApiEndpoints.get.pokemon.rawValue)", pokemon)

        network.request(provider: request) { _, data in
            guard let decodedData: ApiPokemonResponseModel? = JSONDecoder().decode(data: data) else {
                completion(nil)
                return
            }
            
            completion(Pokemon(decodedData))
        }
    }
}
