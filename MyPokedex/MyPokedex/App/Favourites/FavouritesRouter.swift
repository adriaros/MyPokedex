//
//  FavouritesRouter.swift
//  MyPokedex
//
//  Created by Adrià Ros on 28/2/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class FavouritesRouter: FavouritesPresenterToRouterProtocol {
    
    class func create() -> UIViewController {
        
        let view = FavouritesViewController()
        let presenter = FavouritesPresenter()
        let interactor = FavouritesInteractor()
        let router = FavouritesRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
}
