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
    
    var items: [PokemonListItemModel]? {
        didSet {
            guaranteeMainThread {
                self.view?.tableView.reloadData()
            }
        }
    }
    
    func setupView() {
        interactor?.loadData()
    }
}

extension PokemonListPresenter: PokemonListInteractorToPresenterProtocol {
    
    func didLoad(data: [PokemonListItemModel]?) {
        items = data
    }
}

func guaranteeMainThread(_ work: @escaping () -> Void) {
    if Thread.isMainThread {
        work()
    } else {
        DispatchQueue.main.async(execute: work)
    }
}
