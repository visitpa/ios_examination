//
//  LandingRepository.swift
//  ios_examination
//
//  Created by Visit Patcharapanyapong on 9/3/2567 BE.
//

import Foundation

protocol LandingRepository {
    func getContent(completion: @escaping (Result<Content, CommonError>) -> Void)
}
