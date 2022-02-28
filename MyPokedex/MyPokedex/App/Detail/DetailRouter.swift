//
//  DetailRouter.swift
//  MyPokedex
//
//  Created by Adrià Ros on 28/2/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class DetailRouter: DetailPresenterToRouterProtocol {
        
    class func create() -> UIViewController {
        
        let view = DetailViewController()
        let presenter = DetailPresenter()
        let interactor = DetailInteractor()
        let router = DetailRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
}
