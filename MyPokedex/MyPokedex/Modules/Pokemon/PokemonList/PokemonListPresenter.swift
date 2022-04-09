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
            view?.tableView.reloadData()
            view?.hideActivityIndicator()
        }
    }
    
    func setupView() {
        view?.showActivityIndicator()
        interactor?.loadData()
    }
    
    func itemSelected(at row: Int) {
        router?.pushToDetail(item: items?[row])
    }
}

extension PokemonListPresenter: PokemonListInteractorToPresenterProtocol {
    
    func didLoad(data: [PokemonListItemModel]?) {
        items = data
    }
}
