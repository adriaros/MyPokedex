//
//  FavouritesInteractor.swift
//  MyPokedex
//
//  Created by Adrià Ros on 28/2/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class FavouritesInteractor: FavouritesPresenterToInteractorProtocol {
    
    var presenter: FavouritesInteractorToPresenterProtocol?
    var dataProvider: FavouriteDiskRepository?
    
    func loadData() {
        presenter?.didLoad(data: dataProvider?.fetchAll())
    }
}
