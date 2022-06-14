//
//  PokemonDetailImageTableViewCell.swift
//  MyPokedex
//
//  Created by Adrià Ros on 14/5/22.
//

import UIKit

protocol PokemonDetailImageTableViewCellDelegate: AnyObject {
    func onFavourite()
}

class PokemonDetailImageTableViewCell: UITableViewCell {

    var imageProvider: ImageProviderUseCase?
    
    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var favouriteButton: UIButton!
    
    weak var delegate: PokemonDetailImageTableViewCellDelegate?
    
    private var isFavourite = false
    
    static var cellType: String {
        String(describing: self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        favouriteButton.setImage(UIImage(systemName: "suit.heart"), for: .normal)
    }
    
    func configure(image url: URL?) {
        imageProvider?.load(imageFrom: url, completion: { data in
            self.pokemonImageView.image = data ?? ImageAsset.PokemonDetail.fallback.image
        })
    }
    
    @IBAction func onFavourite(_ sender: Any) {
        isFavourite = !isFavourite
        favouriteButton.setImage(UIImage(systemName: isFavourite ? "suit.heart.fill" : "suit.heart"), for: .normal)
        delegate?.onFavourite()
    }
}
