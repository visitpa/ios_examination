//
//  LandingModels.swift
//  ios_examination
//
//  Created by Visit Patcharapanyapong on 9/3/2567 BE.
//

import UIKit

enum LandingModels {
    enum Content {
        struct Response {
            let contents: [ContentShelf]
            let currentTheme: LandingModels.Theme
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
    enum Error {
        struct Response {
            let message: String
        }
        typealias ViewModel = Response
    }
    enum ChangeTheme {
        struct Response {
            let currentTheme: LandingModels.Theme
        }
        struct ViewModel {
            let backgroundColor: UIColor
            let tintColor: UIColor
            let themeViewBackgroundColor: UIColor
        }
    }
    enum Theme {
        case light
        case dark
    }
}
