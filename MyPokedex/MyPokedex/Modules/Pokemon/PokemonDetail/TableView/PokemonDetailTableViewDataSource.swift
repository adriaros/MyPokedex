//
//  PokemonDetailTableViewDataSource.swift
//  MyPokedex
//
//  Created by Adrià Ros on 14/5/22.
//

import Foundation
import UIKit

enum PokemonDetailTableViewDataSource: CaseIterable {
    case image
    case data
}

extension PokemonDetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.pokemon != nil ? 2 : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let pokemon = presenter?.pokemon else {
            return UITableViewCell()
        }
        
        switch PokemonDetailTableViewDataSource.allCases[indexPath.row] {
        case .image:
            let cell = tableView.dequeueReusableCell(withIdentifier: PokemonDetailImageTableViewCell.cellType, for: indexPath) as! PokemonDetailImageTableViewCell
            cell.delegate = self
            cell.imageProvider = imageProvider
            cell.configure(image: pokemon.imageUrl, favourite: presenter?.isFavourite ?? false)
            return cell
            
        case .data:
            let cell = tableView.dequeueReusableCell(withIdentifier: PokemonDetailDataTableViewCell.cellType, for: indexPath) as! PokemonDetailDataTableViewCell
            cell.configure(pokemon: pokemon)
            return cell
        }
    }
}
