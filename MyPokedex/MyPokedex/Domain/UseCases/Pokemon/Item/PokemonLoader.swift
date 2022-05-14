//
//  PokemonLoader.swift
//  MyPokedex
//
//  Created by Adrià Ros on 14/5/22.
//

import Foundation
import UIKit

class PokemonLoader: PokemonLoaderUseCase {
    
    let dataProvider: PokemonCloudRepository
    let imageProvider: ImageCloudRepository & ImageCacheRepository
    
    init(dataProvider: PokemonCloudRepository, imageProvider: ImageCloudRepository & ImageCacheRepository) {
        self.dataProvider = dataProvider
        self.imageProvider = imageProvider
    }
    
    func getPokemonWith(number: String?, completion: @escaping (Pokemon?) -> Void) {
        guard let number = number else {
            completion(nil)
            return
        }

        dataProvider.get(pokemon: number) { pokemon in
            completion(pokemon)
        }
    }
    
    func load(imageFrom url: URL?, completion: @escaping (_ data: UIImage?) -> Void) {
        guard let cachedImage = imageProvider.load(image: url) else {
            imageProvider.download(imageFrom: url) { data in
                guard let data = data else {
                    completion(nil)
                    return
                }
                
                self.imageProvider.store(image: data, url: url)
                completion(data)
            }
            return
        }
        
        completion(cachedImage)
    }
}
