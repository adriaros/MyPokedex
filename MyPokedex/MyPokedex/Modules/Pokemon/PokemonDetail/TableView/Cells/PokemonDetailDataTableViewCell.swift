//
//  PokemonDetailDataTableViewCell.swift
//  MyPokedex
//
//  Created by Adrià Ros on 14/5/22.
//

import UIKit

class PokemonDetailDataTableViewCell: UITableViewCell {

    @IBOutlet weak var pokemonNameLabel: DSLabel!
    @IBOutlet weak var pokemonWeightTitleLabel: DSLabel!
    @IBOutlet weak var pokemonWeightValueLabel: DSLabel!
    @IBOutlet weak var pokemonHeightTitleLabel: DSLabel!
    @IBOutlet weak var pokemonHeightValueLabel: DSLabel!
    
    static var cellType: String {
        String(describing: self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func configure(pokemon: Pokemon) {
        pokemonNameLabel.style = .header(pokemon.displayName, .black, .center, true, 1)
        pokemonWeightTitleLabel.style = .title("Weight", .black, .left, true, 1)
        pokemonWeightValueLabel.style = .paragraph(pokemon.displayWeight, .darkGray, .left, true, 1)
        pokemonHeightTitleLabel.style = .title("Height", .black, .left, true, 1)
        pokemonHeightValueLabel.style = .paragraph(pokemon.displayHeight, .darkGray, .left, true, 1)
    }
}
