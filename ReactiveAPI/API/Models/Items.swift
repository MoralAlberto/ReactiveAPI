//
//  Items.swift
//  AMGReactiveAPI
//
//  Created by Alberto Moral on 6/9/15.
//  Copyright (c) 2015 Moral. All rights reserved.
//

import Foundation
import ObjectMapper

class Items: Mappable {
    var is_answered: Bool?
    var view_count: Int?
    var answer_count: Int?
    var score: Int?
    var title: String?
    
    required init?(_ map: Map) {}
    
    //  Mappable
    func mapping(map: Map) {
        is_answered <- map["is_answered"]
        view_count <- map["view_count"]
        answer_count <- map["answer_count"]
        score <- map["score"]
        title <- map["title"]
    }
}