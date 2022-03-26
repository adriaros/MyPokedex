//
//  PokemonsPresenter.swift
//  MyPokedex
//
//  Created by Adrià Ros on 26/3/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class PokemonsPresenter: PokemonsViewToPresenterProtocol {
    
    var view: PokemonsPresenterToViewProtocol?
    var interactor: PokemonsPresenterToInteractorProtocol?
    var router: PokemonsPresenterToRouterProtocol?
    
    func setupView() {
    }
}

extension PokemonsPresenter: PokemonsInteractorToPresenterProtocol {
    
}
