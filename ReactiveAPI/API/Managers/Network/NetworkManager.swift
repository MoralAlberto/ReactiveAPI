//
//  RequestManager.swift
//  AMGReactiveAPI
//
//  Created by Alberto Moral on 6/9/15.
//  Copyright (c) 2015 Moral. All rights reserved.
//

import Foundation
import ReactiveCocoa

class NetworkManager {
    
    class func dataWithRequest(request: NSURLRequest) -> SignalProducer<NSData, NSError> {
        return NSURLSession.sharedSession().rac_dataWithRequest(request)
            .retry(2)
            .map { data, URLResponse in
                return data
            }
//            .catch { error in
//                print("Network error ocurred \(error)", terminator: "")
//                return SignalProducer.empty
//        }
    }
}