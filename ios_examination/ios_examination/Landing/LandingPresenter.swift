//
//  LandingPresenter.swift
//  ios_examination
//
//  Created by Visit Patcharapanyapong on 9/3/2567 BE.
//

import UIKit

protocol LandingPresenterPresentationLogic {
    func presentContent(response: LandingModels.Content.Response)
    func presentLoading(loading: Bool)
    func presentError(response: LandingModels.Error.Response)
    func presentTheme(response: LandingModels.ChangeTheme.Response)
}

class LandingPresenter: LandingPresenterPresentationLogic {
    var vc: LandingViewControllerDisplayLogic!
    
    func presentContent(response: LandingModels.Content.Response) {
        var bannersImage: [String] = []
        var detail: ContentShelf?
        var firstList: [String] = []
        var secondList: [String] = []
        
        for value in response.contents {
            switch value.type {
            case .banner:
                bannersImage = value.items?.compactMap { $0.coverURL } ?? []
            case .carousel:
                if firstList.isEmpty {
                    firstList = value.items?.compactMap { $0.coverURL } ?? []
                } else {
                    secondList = value.items?.compactMap { $0.coverURL } ?? []
                }
            case .eventSingleCard:
                detail = value
            default: break
            }
        }
        
        let backgroundColor: UIColor
        let detailColor: UIColor
        let fontColor: UIColor
        let detailTitleColor: UIColor
        let detailSubTitleColor: UIColor
        let detailBorderColor: UIColor
        switch response.currentTheme {
        case .light:
            backgroundColor = .white
            detailColor = .white
            fontColor = .black
            detailTitleColor = .black
            detailSubTitleColor = .lightGray
            detailBorderColor = .lightGray.withAlphaComponent(0.3)
        case .dark:
            backgroundColor = .black
            detailColor = .darkGray
            fontColor = .white
            detailTitleColor = .white
            detailSubTitleColor = .lightGray
            detailBorderColor = .darkGray
        }
        
        let bannerModel = BannerTableViewCellModel(images: bannersImage)
        let headerModel = HeaderTableViewCellModel(header: "Header", backgroundColor: backgroundColor, fontColor: fontColor)
        let firsListModel = ListTableViewCellModel(images: firstList, color: backgroundColor)
        let secontListModel = ListTableViewCellModel(images: secondList, color: backgroundColor)
        let detailModel = DetailTableViewCellModel(image: detail?.coverURL ?? "", title: detail?.title ?? "", description: detail?.subTitle ?? "", borderColor: detailBorderColor, titleColor: detailTitleColor, subTitleColor: detailSubTitleColor, backgroundColor: backgroundColor, contentColor: detailColor)
        let datas: [LandingModels.CellType] = [
            .banner(bannerModel),
            .header(headerModel),
            .list(firsListModel),
            .header(headerModel),
            .detail(detailModel),
            .header(headerModel),
            .list(secontListModel),
        ]
        
        let viewModel = LandingModels.Content.ViewModel(datas: datas)
        vc.displayContent(viewModel: viewModel)
    }
    
    func presentLoading(loading: Bool) {
        vc.displayLoading(loading: loading)
    }
    
    func presentError(response: LandingModels.Error.Response) {
        let viewModel = LandingModels.Error.ViewModel(message: response.message)
        vc.displayError(viewModel: viewModel)
    }
    
    func presentTheme(response: LandingModels.ChangeTheme.Response) {
        let backgroundColor: UIColor
        let tintColor: UIColor
        let themeViewBackgroundColor: UIColor
        switch response.currentTheme {
        case .light:
            backgroundColor = .white
            tintColor = .black
            themeViewBackgroundColor = .white
        case .dark:
            backgroundColor = .black
            tintColor = .white
            themeViewBackgroundColor = .lightGray
        }
        let viewModel = LandingModels.ChangeTheme.ViewModel(backgroundColor: backgroundColor, tintColor: tintColor, themeViewBackgroundColor: themeViewBackgroundColor)
        vc.displayTheme(viewModel: viewModel)
    }
}
