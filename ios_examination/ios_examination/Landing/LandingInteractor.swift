//
//  LandingInteractor.swift
//  ios_examination
//
//  Created by Visit Patcharapanyapong on 9/3/2567 BE.
//

import Foundation

protocol LandingInteractorBusinessLogic {
    var presenter: LandingPresenterPresentationLogic! { get set }
    func getContent()
}

class LandingInteractor: LandingInteractorBusinessLogic {
    var presenter: LandingPresenterPresentationLogic!
    let worker: LandingWorker = LandingWorker()
    
    func getContent() {
        presenter.presentLoading(loading: true)
        worker.getContent { [weak self] content in
            guard let self = self else {
                return
            }
            self.presenter.presentLoading(loading: false)
            let response = LandingModels.Content.Response(contents: content.responseObject?.contentShelfs ?? [])
            self.presenter.presentContent(response: response)
        }
    }
}
