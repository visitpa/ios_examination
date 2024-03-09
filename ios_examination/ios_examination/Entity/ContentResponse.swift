//
//  ContentResponse.swift
//  ios_examination
//
//  Created by Visit Patcharapanyapong on 9/3/2567 BE.
//

import Foundation

// MARK: - Content
struct Content: Codable {
    let code: Int?
    let message: String?
    let responseObject: ResponseObject?
}

// MARK: - ResponseObject
struct ResponseObject: Codable {
    let contentShelfs: [ContentShelf]?
}

// MARK: - ContentShelf
struct ContentShelf: Codable {
    let items: [Item]?
    let type: ItemType?
    let subTitle, title: String?
    let viewMore: ViewMore?
    let coverURL: String?

    enum ItemType: String, Codable, Equatable {
        case banner = "banner_1"
        case carousel
        case eventSingleCard
    }
    
    enum CodingKeys: String, CodingKey {
        case items, subTitle, title, type, viewMore
        case coverURL = "coverUrl"
    }
}

// MARK: - Item
struct Item: Codable {
    let coverURL: String?
    let id: Int?
    let subTitle, title, type, album: String?
    let artist: String?
    let conditions: Int?
    let contentURL, numOfListener: String?
    let numOfSong, statusTag: Int?

    enum CodingKeys: String, CodingKey {
        case coverURL = "coverUrl"
        case id, subTitle, title, type, album, artist, conditions
        case contentURL = "contentUrl"
        case numOfListener, numOfSong, statusTag
    }
}

// MARK: - ViewMore
struct ViewMore: Codable {
    let contentURL: String?
    let enabled: Bool?

    enum CodingKeys: String, CodingKey {
        case contentURL = "contentUrl"
        case enabled
    }
}
