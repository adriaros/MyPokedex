//
//  GameListViewController.swift
//  MyPokedex
//
//  Created by Adrià Ros on 22/5/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class GameListViewController: UIViewController {
    
    var presenter: GameListViewToPresenterProtocol?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        presenter?.setupView()
    }
    
    func configureTableView() {
        tableView.register(UINib(nibName: GameListItemTableViewCell.cellType, bundle: nil), forCellReuseIdentifier: GameListItemTableViewCell.cellType)
        tableView.dataSource = self
        tableView.rowHeight = 80
    }
}

extension GameListViewController: GameListPresenterToViewProtocol {

}
