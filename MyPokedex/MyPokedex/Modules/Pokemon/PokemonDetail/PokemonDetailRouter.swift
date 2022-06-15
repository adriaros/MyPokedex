//
//  PokemonDetailRouter.swift
//  MyPokedex
//
//  Created by Adrià Ros on 9/4/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class PokemonDetailRouter: PokemonDetailPresenterToRouterProtocol {
    
    class func create(item: PokemonListItem, dataProvider: PokemonCloudRepository, imageProvider: ImageProviderUseCase, favouriteProvider: FavouriteDiskRepository) -> UIViewController {
        
        let view = PokemonDetailViewController()
        let presenter = PokemonDetailPresenter()
        let interactor = PokemonDetailInteractor()
        let router = PokemonDetailRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        view.imageProvider = imageProvider
        interactor.item = item
        interactor.dataProvider = dataProvider
        interactor.favouriteProvider = favouriteProvider
        
        return view
    }
}
