//
//  HeaderTableViewCell.swift
//  ios_examination
//
//  Created by Visit Patcharapanyapong on 9/3/2567 BE.
//

import UIKit

struct HeaderTableViewCellModel {
    let header: String
    let backgroundColor: UIColor
    let fontColor: UIColor
}

class HeaderTableViewCell: UITableViewCell {
    @IBOutlet weak var headerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func setCell(model: HeaderTableViewCellModel) {
        headerLabel.text = model.header
        headerLabel.textColor = model.fontColor
        contentView.backgroundColor = model.backgroundColor
    }
}
