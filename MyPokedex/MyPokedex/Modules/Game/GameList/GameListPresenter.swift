//
//  GameListPresenter.swift
//  MyPokedex
//
//  Created by Adrià Ros on 22/5/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class GameListPresenter: GameListViewToPresenterProtocol {
    
    var view: GameListPresenterToViewProtocol?
    var interactor: GameListPresenterToInteractorProtocol?
    var router: GameListPresenterToRouterProtocol?
    
    var items: [GameListItem]? {
        didSet {
            view?.tableView.reloadData()
        }
    }
    
    func setupView() {
        interactor?.loadData()
    }
}

extension GameListPresenter: GameListInteractorToPresenterProtocol {
    
    func didLoad(data: [GameListItem]?) {
        items = data
    }
}
