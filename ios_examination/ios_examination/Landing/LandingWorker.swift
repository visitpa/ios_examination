//
//  LandingWorker.swift
//  ios_examination
//
//  Created by Visit Patcharapanyapong on 9/3/2567 BE.
//

import Foundation

class LandingWorker {
    let landingUseCase: LandingUseCase
    init(landingUseCase: LandingUseCase = LandingUseCase()) {
        self.landingUseCase = landingUseCase
    }
    
    func getContent(completion: @escaping (Result<Content, CommonError>) -> Void) {
        landingUseCase.getContent(completion: completion)
    }
}
