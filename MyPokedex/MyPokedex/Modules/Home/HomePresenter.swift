//
//  HomePresenter.swift
//  MyPokedex
//
//  Created by Adrià Ros on 28/2/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class HomePresenter: HomeViewToPresenterProtocol {
    
    var view: HomePresenterToViewProtocol?
    var interactor: HomePresenterToInteractorProtocol?
    var router: HomePresenterToRouterProtocol?
    
    func selectPokemon() {
        router?.pokemonList()
    }
    
    func selectGames() {
        router?.gameList()
    }
}

extension HomePresenter: HomeInteractorToPresenterProtocol {
    
}
