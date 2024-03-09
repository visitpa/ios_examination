//
//  LandingPresenter.swift
//  ios_examination
//
//  Created by Visit Patcharapanyapong on 9/3/2567 BE.
//

import Foundation

protocol LandingPresenterPresentationLogic {
    func presentContent(response: LandingModels.Content.Response)
    func presentLoading(loading: Bool)
}

class LandingPresenter: LandingPresenterPresentationLogic {
    var vc: LandingViewControllerDisplayLogic!
    
    func presentContent(response: LandingModels.Content.Response) {
        let bannerImages: [String] = response.contents.compactMap { $0.items }
            .flatMap { $0.compactMap { $0.coverURL } }
        let contentImages: [String] = response.contents.compactMap { $0.items }
            .flatMap { $0.compactMap { $0.coverURL } }
        let bannerModel = BannerTableViewCellModel(images: bannerImages)
        let headerModel = HeaderTableViewCellModel(header: "Header")
        let listModel = ListTableViewCellModel(images: contentImages)
        let detailModel = DetailTableViewCellModel(image: response.contents, title: <#T##String#>, description: <#T##String#>)
        let datas: [LandingModels.CellType] = [
            .banner(bannerModel),
            .header(headerModel),
            .list(listModel),
            .detail(detailModel)
        ]
        
        let viewModel = LandingModels.Content.ViewModel(datas: datas)
        vc.displayContent(viewModel: viewModel)
    }
    
    func presentLoading(loading: Bool) {
        vc.displayLoading(loading: loading)
    }
}
