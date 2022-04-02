//
//  UIImageView.swift
//  MyPokedex
//
//  Created by Adrià Ros on 2/4/22.
//

import UIKit

extension UIImageView {
    
    func load(url: URL?, fallback: UIImage?) {
        guard let url = url else {
            self.image = fallback
            return
        }

        DispatchQueue.global().async { [weak self] in
            guard let data = try? Data(contentsOf: url), let image = UIImage(data: data) else {
                self?.image = fallback
                return
            }
            
            guaranteeMainThread {
                self?.image = image
            }
        }
    }
}
