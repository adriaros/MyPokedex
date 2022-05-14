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
    var imageProvider: ImageProviderUseCase?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        presenter?.setupView()
    }
    
    func configureTableView() {
        tableView.register(UINib(nibName: PokemonDetailImageTableViewCell.cellType, bundle: nil), forCellReuseIdentifier: PokemonDetailImageTableViewCell.cellType)
        tableView.register(UINib(nibName: PokemonDetailDataTableViewCell.cellType, bundle: nil), forCellReuseIdentifier: PokemonDetailDataTableViewCell.cellType)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedRowHeight = 100
    }
}

extension PokemonDetailViewController: PokemonDetailPresenterToViewProtocol {

}
