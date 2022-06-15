//
//  PokemonDetailInteractor.swift
//  MyPokedex
//
//  Created by Adrià Ros on 9/4/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class PokemonDetailInteractor: PokemonDetailPresenterToInteractorProtocol {
    
    var presenter: PokemonDetailInteractorToPresenterProtocol?
    var item: PokemonListItem?
    var dataProvider: PokemonCloudRepository?
    var favouriteProvider: FavouriteDiskRepository?
    
    private var pokemon: Pokemon?
    
    func loadData() {
        guard let number = item?.number else {
            return
        }
        
        dataProvider?.get(pokemon: number, completion: { data in
            guard let pokemon = data, let id = pokemon.id else {
                return
            }
            
            self.pokemon = pokemon
            self.presenter?.didLoadData(pokemon, favourite: self.favouriteProvider?.fetch(id: String(id)) != nil)
        })
    }
    
    func handleFavourite() {
        guard let id = pokemon?.id else {
            return
        }
        
        if favouriteProvider?.fetch(id: String(id)) != nil {
            favouriteProvider?.delete(id: String(id))
        } else {
            favouriteProvider?.create(id: String(id), name: pokemon?.displayName, imageUrl: pokemon?.imageUrl?.absoluteString)
        }
    }
}
