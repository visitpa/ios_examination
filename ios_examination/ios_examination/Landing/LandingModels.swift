//
//  LandingModels.swift
//  ios_examination
//
//  Created by Visit Patcharapanyapong on 9/3/2567 BE.
//

import Foundation

enum LandingModels {
    enum Content {
        struct Response {
            let contents: [ContentShelf]
        }
        struct ViewModel {
            let datas: [LandingModels.CellType]
        }
    }
    enum CellType {
        case banner(BannerTableViewCellModel)
        case header(HeaderTableViewCellModel)
        case detail(DetailTableViewCellModel)
        case list(ListTableViewCellModel)
    }
}
