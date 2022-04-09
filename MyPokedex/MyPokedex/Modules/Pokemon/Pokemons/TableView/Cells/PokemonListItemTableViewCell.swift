//
//  PokemonListItemTableViewCell.swift
//  MyPokedex
//
//  Created by Adrià Ros on 26/3/22.
//

import UIKit

class PokemonListItemTableViewCell: UITableViewCell {
    
    var imageProvider: PokemonListUseCase?

    @IBOutlet weak var containerShape: DSShape!
    @IBOutlet weak var itemNumberLabel: DSLabel!
    @IBOutlet weak var itemNameLabel: DSLabel!
    @IBOutlet weak var itemImageView: UIImageView!
    
    static var cellType: String {
        String(describing: self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        backgroundColor = .clear
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        containerShape.style = .rounded
        containerShape.alpha = 0.7
    }
    
    func configure(number: String?, name: String?, image url: URL?) {
        itemNumberLabel.style = .number(number, .black.withAlphaComponent(0.8), .left, true, 1)
        itemNameLabel.style = .title(name, .black, .left, true, 1)
        imageProvider?.load(imageFrom: url, completion: { data in
            self.itemImageView.image = data ?? ImageAsset.PokemonList.fallback.image
        })
    }
}
