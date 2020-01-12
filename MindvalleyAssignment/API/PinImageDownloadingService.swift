//
//  PinImageDownloadingService.swift
//  MindValleyBoard
//
//  Created by Rahim Khalid on 02/06/2019.
//  Copyright © 2019 Rahim. All rights reserved.
//

import Foundation
import MindvalleyFramework

typealias ImageResponseResult = (APIResponseResult<Data>, String) -> Void


protocol PinImageDownloadingServiceProtocol {
    func downloadPinImage(for identifier: String, from url: String, completion: @escaping ImageResponseResult)
}

class PinImageDownloadingService : PinImageDownloadingServiceProtocol {
    
    public var network: NetworkManagerProtocol = NetworkManager()
    
    func downloadPinImage(for identifier: String, from url: String, completion: @escaping ImageResponseResult) {
        let request = PinImageDownloadingRequest(from: url, uniqueIdentifier: identifier)
        
        network.download(request) { (result) in
            completion(result, url)
        }
        
    }
}
