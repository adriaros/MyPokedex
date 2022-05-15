//
//  PokemonDetailTypeCollectionViewCell.swift
//  MyPokedex
//
//  Created by Adrià Ros on 15/5/22.
//

import UIKit

class PokemonDetailTypeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var typeImageView: UIImageView!
    
    static var cellType: String {
        String(describing: self)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(image: UIImage?) {
        typeImageView.image = image
        typeImageView.contentMode = .scaleAspectFit
    }
}
