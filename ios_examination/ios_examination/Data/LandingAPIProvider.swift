//
//  LandingAPIProvider.swift
//  ios_examination
//
//  Created by Visit Patcharapanyapong on 9/3/2567 BE.
//

import Foundation

enum LandingAPIProvider {
    case getContent
    
    var path: String {
        switch self {
        case .getContent:
            return "/resource/data.json"
        }
    }
}
