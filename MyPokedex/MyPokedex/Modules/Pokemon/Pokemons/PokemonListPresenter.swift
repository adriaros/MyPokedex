//
//  PokemonListPresenter.swift
//  MyPokedex
//
//  Created by Adrià Ros on 26/3/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class PokemonListPresenter: PokemonListViewToPresenterProtocol {
    
    var view: PokemonListPresenterToViewProtocol?
    var interactor: PokemonListPresenterToInteractorProtocol?
    var router: PokemonListPresenterToRouterProtocol?
    
    func setupView() {
        interactor?.loadData()
    }
}

extension PokemonListPresenter: PokemonListInteractorToPresenterProtocol {
    
}