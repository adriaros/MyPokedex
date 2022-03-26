//
//  DSLabel.swift
//  MyPokedex
//
//  Created by Adrià Ros on 12/3/22.
//

import UIKit

enum DSLabelStyle: Equatable {
    case title(_ text: String?, _ color: UIColor, _ alignment: NSTextAlignment = .left, _ adjustsFontSizeToFitWidth: Bool = true, _ numberOfLines: Int = 0)
    case paragraph(_ text: String?, _ color: UIColor, _ alignment: NSTextAlignment = .left, _ adjustsFontSizeToFitWidth: Bool = true, _ numberOfLines: Int = 0)
    case number(_ text: String?, _ color: UIColor, _ alignment: NSTextAlignment = .left, _ adjustsFontSizeToFitWidth: Bool = true, _ numberOfLines: Int = 0)
    case none
}

class DSLabel: UILabel {
    
    var style: DSLabelStyle = .none {
        didSet {
            switch style {
            case let .title(text, color, alignment, adjustsFontSizeToFitWidth, numberOfLines):
                configure(text: text, color: color, font: "Noteworthy Bold", size: 20, alignment: alignment, adjustsFontSizeToFitWidth: adjustsFontSizeToFitWidth, numberOfLines: numberOfLines)
                
            case let .paragraph(text, color, alignment, adjustsFontSizeToFitWidth, numberOfLines):
                configure(text: text, color: color, font: "Noteworthy Light", size: 16, alignment: alignment, adjustsFontSizeToFitWidth: adjustsFontSizeToFitWidth, numberOfLines: numberOfLines)
                
            case let .number(text, color, alignment, adjustsFontSizeToFitWidth, numberOfLines):
                configure(text: text, color: color, font: "Noteworthy Light", size: 12, alignment: alignment, adjustsFontSizeToFitWidth: adjustsFontSizeToFitWidth, numberOfLines: numberOfLines)
                
            case .none:
                break
            }
        }
    }
    
    private func configure(text: String?, color: UIColor, font: String, size: CGFloat, alignment: NSTextAlignment, adjustsFontSizeToFitWidth: Bool, numberOfLines: Int) {
        self.text = text
        self.textColor = color
        self.font = UIFont(name: font, size: size)
        self.textAlignment = alignment
        self.adjustsFontSizeToFitWidth = adjustsFontSizeToFitWidth
        self.numberOfLines = numberOfLines
    }
}
