//
//  PinImageDownloadingRequest.swift
//  MindValleyBoard
//
//  Created by Rahim Khalid on 02/06/2019.
//  Copyright © 2019 Rahim. All rights reserved.
//

import Foundation
import MindvalleyFramework

final class PinImageDownloadingRequest: Downloadable {
    
    typealias Response = Data
    private var url: String
    private var identifier: String

    var endpoint: APIRequestConvertible {
        
        return APIRequestConverter.init( method: .get, path: url, name: "PIN Image Downloading", requestUniqueIdentifier: identifier)
    }

    init(from url: String, uniqueIdentifier: String) {
        self.url = url
        self.identifier = uniqueIdentifier
    }
}
