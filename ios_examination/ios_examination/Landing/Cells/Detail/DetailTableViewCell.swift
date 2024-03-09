//
//  DetailTableViewCell.swift
//  ios_examination
//
//  Created by Visit Patcharapanyapong on 9/3/2567 BE.
//

import UIKit

struct DetailTableViewCellModel {
    let image: String
    let title: String
    let description: String
    let borderColor: UIColor
    let titleColor: UIColor
    let subTitleColor: UIColor
    let backgroundColor: UIColor
    let contentColor: UIColor
}

class DetailTableViewCell: UITableViewCell {
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var imageDetail: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    private func setup() {
        selectionStyle = .none
        stackView.layer.borderWidth = 1
        stackView.layer.borderColor = UIColor.gray.cgColor
        stackView.layer.cornerRadius = 16
        stackView.clipsToBounds = true
    }
    
    func setCell(model: DetailTableViewCellModel) {
        imageDetail.loadImage(from: model.image)
        titleLabel.text = model.title
        descriptionLabel.text = model.description
        
        contentView.backgroundColor = model.backgroundColor
        stackView.backgroundColor = model.contentColor
        stackView.layer.borderColor = model.borderColor.cgColor
        titleLabel.textColor = model.titleColor
        descriptionLabel.textColor = model.subTitleColor
    }
}
