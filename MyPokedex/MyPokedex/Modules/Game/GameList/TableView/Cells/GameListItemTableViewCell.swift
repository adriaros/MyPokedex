//
//  GameListItemTableViewCell.swift
//  MyPokedex
//
//  Created by Adrià Ros on 3/6/22.
//

import UIKit

class GameListItemTableViewCell: UITableViewCell {
    
    @IBOutlet weak var containerShape: DSShape!
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
    
    func configure(name: String?) {
        itemNameLabel.style = .title(name, .black, .left, true, 1)
    }
}
