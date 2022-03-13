//
//  HomeTableViewDataSource.swift
//  MyPokedex
//
//  Created by Adrià Ros on 10/3/22.
//

import UIKit

enum HomeTableViewDataSource: CaseIterable {
    case pokemon
    case games
    case locations
}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        HomeTableViewDataSource.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeItemTableViewCell.cellType, for: indexPath) as! HomeItemTableViewCell
        
        switch HomeTableViewDataSource.allCases[indexPath.row] {
        case .pokemon:
            cell.configure(title: "Pokémon", description: "All about pokémons", image: ImageAsset.Home.pokemon.image)
        case .games:
            cell.configure(title: "Games", description: "In progress...", image: ImageAsset.Home.games.image)
        case .locations:
            cell.configure(title: "Locations", description: "In progress...", image: ImageAsset.Home.locations.image)
        }
        
        return cell
    }
}
