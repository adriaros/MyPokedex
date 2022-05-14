//
//  PokemonDetailTableViewDataSource.swift
//  MyPokedex
//
//  Created by Adrià Ros on 14/5/22.
//

import Foundation
import UIKit

extension PokemonDetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.pokemon != nil ? 2 : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let pokemon = presenter?.pokemon else {
            return UITableViewCell()
        }
        
        let imageCell = tableView.dequeueReusableCell(withIdentifier: PokemonDetailImageTableViewCell.cellType, for: indexPath) as! PokemonDetailImageTableViewCell
        let dataCell = tableView.dequeueReusableCell(withIdentifier: PokemonDetailDataTableViewCell.cellType, for: indexPath) as! PokemonDetailDataTableViewCell
        
        switch indexPath.row {
        case 0:
            imageCell.imageProvider = imageProvider
            imageCell.configure(image: pokemon.imageUrl)
            return imageCell
            
        case 1:
            dataCell.configure(pokemon: pokemon)
            return dataCell
            
        default:
            return UITableViewCell()
        }
    }
}
