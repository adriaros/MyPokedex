//
//  FavouritesPresenter.swift
//  MyPokedex
//
//  Created by Adrià Ros on 28/2/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class FavouritesPresenter: FavouritesViewToPresenterProtocol {
    
    var view: FavouritesPresenterToViewProtocol?
    var interactor: FavouritesPresenterToInteractorProtocol?
    var router: FavouritesPresenterToRouterProtocol?
    
    var items: [Favourite]? {
        didSet {
            view?.tableView.reloadData()
        }
    }
    
    func setupView() {
        interactor?.loadData()
    }
}

extension FavouritesPresenter: FavouritesInteractorToPresenterProtocol {
    
    func didLoad(data: [Favourite]?) {
        items = data
    }
}
