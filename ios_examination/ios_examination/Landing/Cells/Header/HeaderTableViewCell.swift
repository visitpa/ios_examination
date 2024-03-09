//
//  HeaderTableViewCell.swift
//  ios_examination
//
//  Created by Visit Patcharapanyapong on 9/3/2567 BE.
//

import UIKit

struct HeaderTableViewCellModel {
    let header: String
}

class HeaderTableViewCell: UITableViewCell {
    @IBOutlet weak var headerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func setCell(model: HeaderTableViewCellModel) {
        headerLabel.text = model.header
    }
}
