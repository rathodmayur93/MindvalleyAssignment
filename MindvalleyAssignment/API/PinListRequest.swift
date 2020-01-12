//
//  PinListRequest.swift
//  MindvalleyDownloadLib
//
//  Created by ds-mayur on 1/10/20.
//  Copyright © 2020 Mayur Rathod. All rights reserved.
//

import MindvalleyFramework

final class PinListRequest : JsonProvider{
    
    typealias Response = [PinItems]
    
    var endpoint: APIRequestConvertible {
        return APIRequestConverter.init(method: .get,
                                        path: Constants.loadPinItemsURL,
                                        name: Constants.loadPinItemsURL.self)
    }
}
