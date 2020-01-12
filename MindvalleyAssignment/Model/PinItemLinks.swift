//
//  PinItemLinks.swift
//  MindvalleyDownloadLib
//
//  Created by ds-mayur on 1/9/20.
//  Copyright © 2020 Mayur Rathod. All rights reserved.
//

// MARK: - PinItemLinks
struct PinItemLinks: Codable {
    let linksSelf: String?
    let html, download: String?

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case html, download
    }
}
