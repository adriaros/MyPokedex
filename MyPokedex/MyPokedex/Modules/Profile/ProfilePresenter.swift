//
//  ProfilePresenter.swift
//  MyPokedex
//
//  Created by Adrià Ros on 28/2/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class ProfilePresenter: ProfileViewToPresenterProtocol {
    
    var view: ProfilePresenterToViewProtocol?
    var interactor: ProfilePresenterToInteractorProtocol?
    var router: ProfilePresenterToRouterProtocol?
    
    func setupView() {
    }
}

extension ProfilePresenter: ProfileInteractorToPresenterProtocol {
    
}
