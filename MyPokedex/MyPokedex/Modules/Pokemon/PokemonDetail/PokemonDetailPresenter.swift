//
//  PokemonDetailPresenter.swift
//  MyPokedex
//
//  Created by Adrià Ros on 9/4/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class PokemonDetailPresenter: PokemonDetailViewToPresenterProtocol {
    
    var view: PokemonDetailPresenterToViewProtocol?
    var interactor: PokemonDetailPresenterToInteractorProtocol?
    var router: PokemonDetailPresenterToRouterProtocol?
    
    func setupView() {
    }
}

extension PokemonDetailPresenter: PokemonDetailInteractorToPresenterProtocol {
    
}
