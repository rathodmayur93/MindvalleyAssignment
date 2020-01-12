//
//  PinListService.swift
//  MindvalleyDownloadLib
//
//  Created by ds-mayur on 1/10/20.
//  Copyright © 2020 Mayur Rathod. All rights reserved.
//

import MindvalleyFramework

protocol PinListingServiceProtocol{
    func getPins(completion: @escaping(APIResponseResult<[PinItems]>) -> Void)
}

class PinListService : PinListingServiceProtocol{
    
    public var network : NetworkManagerProtocol = NetworkManager()
    
    func getPins(completion: @escaping (APIResponseResult<[PinItems]>) -> Void) {
        let request = PinListRequest()
        network.request(request) { (response) in
            completion(response)
        }
    }
    
    func cancelAllPendingRequest(){
        network.cancelAllPendingRequest()
    }
}
