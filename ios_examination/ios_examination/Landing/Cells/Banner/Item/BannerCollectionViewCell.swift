//
//  BannerCollectionViewCell.swift
//  ios_examination
//
//  Created by Visit Patcharapanyapong on 9/3/2567 BE.
//

import UIKit

class BannerCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var bannerImage: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        bannerImage.image = nil
    }
    
    func setCell(image: String) {
        bannerImage.loadImage(from: image)
    }
}
