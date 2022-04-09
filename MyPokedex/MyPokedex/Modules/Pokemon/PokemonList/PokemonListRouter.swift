//
//  PokemonListRouter.swift
//  MyPokedex
//
//  Created by Adrià Ros on 26/3/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class PokemonListRouter: PokemonListPresenterToRouterProtocol {
    
    class func create(dataProvider: PokemonListUseCase?) -> UIViewController {
        
        let view = PokemonListViewController()
        let presenter = PokemonListPresenter()
        let interactor = PokemonListInteractor()
        let router = PokemonListRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        view.activityIndicator = ActivityIndicatorView(style: .large)
        view.imageProvider = dataProvider
        interactor.dataProvider = dataProvider
        
        return view
    }
}
