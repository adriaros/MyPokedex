//
//  HomeTableViewDataSource.swift
//  MyPokedex
//
//  Created by Adrià Ros on 10/3/22.
//

import UIKit

enum HomeTableViewDataSource: String, CaseIterable {
    case pokemon = "Pokémon"
    case locations = "Locations"
    case games = "Games"
}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        HomeTableViewDataSource.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = HomeTableViewDataSource.allCases[indexPath.row].rawValue
        return cell
    }
}
