//
//  LandingRemoteRepository.swift
//  ios_examination
//
//  Created by Visit Patcharapanyapong on 9/3/2567 BE.
//

import Foundation

final class LandingRemoteRepository: LandingRepository {
    func getContent(completion: @escaping (Result<Content, CommonError>) -> Void) {
        guard let fullUrl = URL(string: Constants.shared.baseUrl + LandingAPIProvider.getContent.path) else {
            completion(.failure(.init(message: Constants.shared.commonErrorMessage)))
            return
        }
        URLSession.shared.dataTask(with: fullUrl) { data, response, error 
            in
            if let error = error as? URLError {
                switch error.code {
                case .notConnectedToInternet:
                    completion(.failure(.init(message: Constants.shared.errorNoInternetMessage)))
                default:
                    completion(.failure(.init(message: Constants.shared.commonErrorMessage)))
                }
            }
            
            guard let data = data else {
                completion(.failure(.init(message: Constants.shared.commonErrorMessage)))
                return
            }
            
            do {
                let content = try JSONDecoder().decode(Content.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(content))
                }
            } catch {
                completion(.failure(.init(message: Constants.shared.commonErrorMessage)))
            }
        }.resume()
    }
}
