//
//  GameListTableViewDataSource.swift
//  MyPokedex
//
//  Created by Adrià Ros on 3/6/22.
//

import UIKit

extension GameListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GameListItemTableViewCell.cellType, for: indexPath) as! GameListItemTableViewCell
        
        guard let item = presenter?.items?[indexPath.row] else {
            return UITableViewCell()
        }
        
        cell.configure(name: item.name)
        return cell
    }
}
