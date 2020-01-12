//
//  Category.swift
//  MindvalleyDownloadLib
//
//  Created by ds-mayur on 1/9/20.
//  Copyright © 2020 Mayur Rathod. All rights reserved.
//

// MARK: - Category
struct Category: Codable {
    let id: Int?
    let title: Title?
    let photoCount: Int?
    let links: CategoryLinks?
    
    enum CodingKeys: String, CodingKey {
        case id, title
        case photoCount = "photo_count"
        case links
    }
}
