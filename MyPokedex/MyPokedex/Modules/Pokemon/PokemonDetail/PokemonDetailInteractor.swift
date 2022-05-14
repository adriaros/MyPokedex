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
    var dataProvider: PokemonLoaderUseCase?
    
    func loadData() {
        dataProvider?.getPokemonWith(number: item?.number, completion: { data in
            guard let pokemon = data else {
                return
            }

            self.presenter?.didLoadData(pokemon)
        })
    }
}
