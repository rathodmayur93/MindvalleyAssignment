//
//  User.swift
//  MindvalleyDownloadLib
//
//  Created by ds-mayur on 1/9/20.
//  Copyright © 2020 Mayur Rathod. All rights reserved.
//

// MARK: - User
struct User: Codable {
    let id, username, name: String?
    let profileImage: ProfileImage?
    let links: UserLinks?

    enum CodingKeys: String, CodingKey {
        case id, username, name
        case profileImage = "profile_image"
        case links
    }
}
