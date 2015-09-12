//
//  Question.swift
//  AMGReactiveAPI
//
//  Created by Alberto Moral on 6/9/15.
//  Copyright (c) 2015 Moral. All rights reserved.
//

import Foundation
import ObjectMapper

class Question: Mappable {
    var has_more: Int?
    var quota_max: Int?
    var quota_remaining: Int?
    var items: [Items]?
    
    class func newInstance(map: Map) -> Mappable? {
        return Question()
    }
    
    //  Mappable
    func mapping(map: Map) {
        has_more <- map["has_more"]
        quota_max <- map["quota_max"]
        quota_remaining <- map["quota_remaining"]
        items <- map["items"]
    }
}