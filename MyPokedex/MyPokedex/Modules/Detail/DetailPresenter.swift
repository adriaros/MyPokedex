//
//  DetailPresenter.swift
//  MyPokedex
//
//  Created by Adrià Ros on 28/2/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class DetailPresenter: DetailViewToPresenterProtocol {
    
    var view: DetailPresenterToViewProtocol?
    var interactor: DetailPresenterToInteractorProtocol?
    var router: DetailPresenterToRouterProtocol?
    
    func setupView() {
    }
}

extension DetailPresenter: DetailInteractorToPresenterProtocol {
    
}
