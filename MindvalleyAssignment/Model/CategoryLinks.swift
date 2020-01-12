//
//  CategoryLinks.swift
//  MindvalleyDownloadLib
//
//  Created by ds-mayur on 1/9/20.
//  Copyright © 2020 Mayur Rathod. All rights reserved.
//

// MARK: - CategoryLinks
struct CategoryLinks: Codable {
    let linksSelf, photos: String?

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case photos
    }
}
