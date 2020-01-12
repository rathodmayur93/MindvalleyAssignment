//
//  UserLinks.swift
//  MindvalleyDownloadLib
//
//  Created by ds-mayur on 1/9/20.
//  Copyright © 2020 Mayur Rathod. All rights reserved.
//

// MARK: - UserLinks
struct UserLinks: Codable {
    let linksSelf: String?
    let html: String?
    let photos, likes: String?

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case html, photos, likes
    }
}
