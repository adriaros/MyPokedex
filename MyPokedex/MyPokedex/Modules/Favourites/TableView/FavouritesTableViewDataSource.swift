//
//  FavouritesTableViewDataSource.swift
//  MyPokedex
//
//  Created by Adrià Ros on 21/6/22.
//

import UIKit

extension FavouritesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PokemonListItemTableViewCell.cellType, for: indexPath) as! PokemonListItemTableViewCell
        cell.imageProvider = imageProvider
        
        guard let item = presenter?.items?[indexPath.row] else {
            return UITableViewCell()
        }
        
        cell.configure(number: "#\(String(describing: item.id!))", name: item.name, image: URL(string: item.imageUrl ?? ""))
        return cell
    }
}
