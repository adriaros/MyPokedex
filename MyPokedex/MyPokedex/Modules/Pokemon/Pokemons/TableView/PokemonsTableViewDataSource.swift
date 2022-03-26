//
//  PokemonListTableViewDataSource.swift
//  MyPokedex
//
//  Created by Adrià Ros on 26/3/22.
//

import UIKit

extension PokemonListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PokemonListItemTableViewCell.cellType, for: indexPath) as! PokemonListItemTableViewCell
        cell.configure(number: "#1", name: "Bulbasaur", image: nil)
        return cell
    }
}
