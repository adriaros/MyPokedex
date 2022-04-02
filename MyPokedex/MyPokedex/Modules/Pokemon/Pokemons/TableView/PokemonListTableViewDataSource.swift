//
//  PokemonListTableViewDataSource.swift
//  MyPokedex
//
//  Created by Adrià Ros on 26/3/22.
//

import UIKit

extension PokemonListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PokemonListItemTableViewCell.cellType, for: indexPath) as! PokemonListItemTableViewCell
        
        guard let item = presenter?.items?[indexPath.row] else {
            return UITableViewCell()
        }
        
        cell.configure(number: item.displayNumber, name: item.displayName, image: nil)
        return cell
    }
}
