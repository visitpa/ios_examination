//
//  Extension+UIView.swift
//  ios_examination
//
//  Created by Visit Patcharapanyapong on 10/3/2567 BE.
//

import UIKit

extension UIView {
    func makeCircular() {
        self.layer.cornerRadius = min(self.frame.size.width, self.frame.size.height) / 2.0
        self.clipsToBounds = true
    }
    
    func addShadow(radius: CGFloat = 2, opacity: Float = 0.1, color: UIColor = .black, offset: CGSize = CGSize(width: 0, height: 2)) {
        layer.masksToBounds = false
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        layer.shadowColor = color.cgColor
        layer.shadowOffset = offset
    }
}
