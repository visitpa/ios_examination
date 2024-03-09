//
//  LandingUseCase.swift
//  ios_examination
//
//  Created by Visit Patcharapanyapong on 9/3/2567 BE.
//

import Foundation

protocol LandingUseCaseDomain {
    func getContent(completion: @escaping (Result<Content, CommonError>) -> Void)
}

final class LandingUseCase: LandingUseCaseDomain {
    private let remoteRepository: LandingRemoteRepository
    init(remoteRepository: LandingRemoteRepository = LandingRemoteRepository()) {
        self.remoteRepository = remoteRepository
    }
    
    func getContent(completion: @escaping (Result<Content, CommonError>) -> Void) {
        remoteRepository.getContent(completion: completion)
    }
}
