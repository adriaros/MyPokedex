//
//  PokemonListInteractor.swift
//  MyPokedex
//
//  Created by Adrià Ros on 26/3/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class PokemonListInteractor: PokemonListPresenterToInteractorProtocol {
    
    var dataProvider: PokemonListUseCase?
    var presenter: PokemonListInteractorToPresenterProtocol?
    
    func loadData() {
        dataProvider?.get(originalList: { items in
            self.presenter?.didLoad(data: items)
        })
    }
}
