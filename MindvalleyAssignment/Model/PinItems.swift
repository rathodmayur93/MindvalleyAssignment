//
//  PinItems.swift
//  MindvalleyDownloadLib
//
//  Created by ds-mayur on 1/9/20.
//  Copyright © 2020 Mayur Rathod. All rights reserved.
//


// MARK: - PinItemElement
struct PinItems: Codable {
    
    let id: String?
    let createdAt: String?
    let width, height: Int?
    let color: String?
    let likes: Int?
    let likedByUser: Bool?
    let user: User?
    let urls: PinUrls?
    let categories: [Category]?
    let links: PinItemLinks?

    enum CodingKeys: String, CodingKey {
        case id
        case createdAt = "created_at"
        case width, height, color, likes
        case likedByUser = "liked_by_user"
        case user
        case urls, categories, links
    }
}
