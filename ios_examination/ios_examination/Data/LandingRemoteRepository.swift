//
//  LandingRemoteRepository.swift
//  ios_examination
//
//  Created by Visit Patcharapanyapong on 9/3/2567 BE.
//

import Foundation

final class LandingRemoteRepository: LandingRepository {
    func getContent(completion: @escaping (Content) -> Void) {
        guard let fullUrl = URL(string: Constants.shared.baseUrl + LandingAPIProvider.getContent.path) else {
            return
        }
        URLSession.shared.dataTask(with: fullUrl) { data, response, error 
            in
            guard let data = data else {
                return
            }
            do {
                let content = try JSONDecoder().decode(Content.self, from: data)
                DispatchQueue.main.async {
                    completion(content)
                }
            } catch {
                
            }
        }.resume()
    }
}
