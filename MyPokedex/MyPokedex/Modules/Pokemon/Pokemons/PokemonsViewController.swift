//
//  PokemonsDetailViewController.swift
//  MyPokedex
//
//  Created by Adrià Ros on 26/3/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class PokemonsViewController: UIViewController {
    
    var presenter: PokemonsViewToPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.setupView()
    }
}

extension PokemonsViewController: PokemonsPresenterToViewProtocol {

}
