//
//  HomeItemTableViewCell.swift
//  MyPokedex
//
//  Created by Adrià Ros on 12/3/22.
//

import UIKit

class HomeItemTableViewCell: UITableViewCell {
    
    @IBOutlet weak var containerShape: DSShape!
    @IBOutlet weak var titleLabel: DSLabel!
    @IBOutlet weak var descriptionLabel: DSLabel!
    @IBOutlet weak var containerImageView: UIImageView!
    
    static var cellType: String {
        String(describing: self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        backgroundColor = .clear
        containerImageView.contentMode = .scaleAspectFit
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        containerShape.style = .rounded
        containerShape.alpha = 0.7
    }
    
    func configure(title: String, description: String, image: UIImage?) {
        titleLabel.style = .title(title, .black, .left, true, 1)
        descriptionLabel.style = .paragraph(description, .black.withAlphaComponent(0.8), .left, true, 1)
        containerImageView.image = image
    }
}
