//
//  Constants.swift
//  ios_examination
//
//  Created by Visit Patcharapanyapong on 9/3/2567 BE.
//

import Foundation

class Constants {
    static let shared = Constants()
    
    var baseUrl: String {
        return "https://wv-interview.web.app"
    }
    
    var errorNoInternetMessage: String {
        return "No Internet Connection, please check your internet"
    }
    
    var commonErrorMessage: String {
        return "Something went wrong, please try again"
    }
}
