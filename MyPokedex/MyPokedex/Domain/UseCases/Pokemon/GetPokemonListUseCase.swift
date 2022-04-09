//
//  GetPokemonListUseCase.swift
//  MyPokedex
//
//  Created by Adrià Ros on 26/3/22.
//

import Foundation
import UIKit

class GetPokemonListUseCase: PokemonListUseCase {
    
    let dataProvider: PokemonCloudRepository
    let imageProvider: ImageCloudRepository & ImageCacheRepository
    
    init(dataProvider: PokemonCloudRepository, imageProvider: ImageCloudRepository & ImageCacheRepository) {
        self.dataProvider = dataProvider
        self.imageProvider = imageProvider
    }
    
    func get(originalList completion: @escaping ([PokemonListItemModel]?) -> Void) {
        dataProvider.get(originalList: { items in
            completion(items)
        })
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
