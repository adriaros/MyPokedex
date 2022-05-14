//
//  PokemonDetailImageTableViewCell.swift
//  MyPokedex
//
//  Created by Adrià Ros on 14/5/22.
//

import UIKit

class PokemonDetailImageTableViewCell: UITableViewCell {

    var imageProvider: ImageProviderUseCase?
    
    @IBOutlet weak var pokemonImageView: UIImageView!
    
    static var cellType: String {
        String(describing: self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func configure(image url: URL?) {
        imageProvider?.load(imageFrom: url, completion: { data in
            self.pokemonImageView.image = data ?? ImageAsset.PokemonDetail.fallback.image
        })
    }
}
