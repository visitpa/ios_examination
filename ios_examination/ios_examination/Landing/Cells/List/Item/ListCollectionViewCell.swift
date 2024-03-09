//
//  ListCollectionViewCell.swift
//  ios_examination
//
//  Created by Visit Patcharapanyapong on 9/3/2567 BE.
//

import UIKit

class ListCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var contentImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setCell(image: String) {
        contentImage.loadImage(from: image)
    }
}
