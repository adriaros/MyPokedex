//
//  GameRepository.swift
//  MyPokedex
//
//  Created by Adrià Ros on 15/5/22.
//

import Foundation
import RxSwift

class GameRepository {
    
    let network: NetworkRXProvider
    
    var url: String {
        "\(GameApiEndpoints.scheme.rawValue)\(GameApiEndpoints.host.rawValue)"
    }
    
    init(network: NetworkRXProvider) {
        self.network = network
    }
}

extension GameRepository: GameCloudRepository {
    
    func getVersionList() -> Observable<[PokemonListItem]> {
        var request = NetworkRequest()
        
        request.method = .get
        request.url = "\(url)\(PokemonApiEndpoints.get.list.rawValue)"
        
        request.queryItems = [
            PokemonApiQueries.originalList
        ]
        
        return Observable.create { observer in
            self.network.request(provider: request)
                .subscribe { data in
                    guard let decodedData: ApiPokemonListResponseModel? = JSONDecoder().decode(data: data) else {
                        return
                    }
                    
                    guard let results = decodedData?.results else {
                        return
                    }
                    
                    observer.onNext(results.map({ PokemonListItem($0) }))
                    observer.onCompleted()
                    
                } onError: { error in
                    observer.onError(error)
                } onCompleted: {
                    observer.onCompleted()
                }
        }
    }
}
