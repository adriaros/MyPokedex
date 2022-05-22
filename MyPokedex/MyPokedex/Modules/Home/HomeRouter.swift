//
//  HomeRouter.swift
//  MyPokedex
//
//  Created by Adrià Ros on 28/2/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class HomeRouter: HomePresenterToRouterProtocol {
    
    var coordinator: HomeCoordinator?
    
    class func create(coordinator: HomeCoordinator?) -> UIViewController {
        
        let view = HomeViewController()
        let presenter = HomePresenter()
        let interactor = HomeInteractor()
        let router = HomeRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        router.coordinator = coordinator
        
        return view
    }
    
    func pokemonList() {
        coordinator?.pokemonList()
    }
    
    func gameList() {
        coordinator?.gameList()
    }
}
