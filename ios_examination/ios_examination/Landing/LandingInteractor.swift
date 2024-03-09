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
    func changeTheme()
}

class LandingInteractor: LandingInteractorBusinessLogic {
    var presenter: LandingPresenterPresentationLogic!
    let worker: LandingWorker = LandingWorker()
    var currentTheme: LandingModels.Theme = .light
    var contentShelfs: [ContentShelf] = []
    
    func getContent() {
        presenter.presentLoading(loading: true)
        worker.getContent { [weak self] response in
            guard let self = self else {
                return
            }
            self.presenter.presentLoading(loading: false)
            switch response {
            case .success(let content):
                contentShelfs = content.responseObject?.contentShelfs ?? []
                self.presentContent()
            case .failure(let error):
                let response = LandingModels.Error.Response(message: error.message)
                self.presenter.presentError(response: response)
            }
        }
    }
    
    func changeTheme() {
        switch currentTheme {
        case .light:
            currentTheme = .dark
        case .dark:
            currentTheme = .light
        }
        presentContent()
        
        let response = LandingModels.ChangeTheme.Response(currentTheme: currentTheme)
        presenter.presentTheme(response: response)
    }
    
    private func presentContent() {
        let response = LandingModels.Content.Response(contents: contentShelfs, currentTheme: currentTheme)
        self.presenter.presentContent(response: response)
    }
}
