//
//  PokemonDetailViewController.swift
//  MyPokedex
//
//  Created by Adrià Ros on 9/4/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class PokemonDetailViewController: UIViewController {
    
    var presenter: PokemonDetailViewToPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.setupView()
    }
}

extension PokemonDetailViewController: PokemonDetailPresenterToViewProtocol {

}
