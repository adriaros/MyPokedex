//
//  GameListRouter.swift
//  MyPokedex
//
//  Created by Adrià Ros on 22/5/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class GameListRouter: GameListPresenterToRouterProtocol {
    
    var coordinator: HomeCoordinator?
    
    class func createModule(coordinator: HomeCoordinator?, dataProvider: GameCloudRepository) -> UIViewController {
        
        let view = GameListViewController()
        let presenter = GameListPresenter()
        let interactor = GameListInteractor()
        let router = GameListRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        interactor.dataProvider = dataProvider
        
        return view
    }
}
