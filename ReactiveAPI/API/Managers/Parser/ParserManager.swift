//
//  QuestionParserManager.swift
//  AMGReactiveAPI
//
//  Created by Alberto Moral on 11/9/15.
//  Copyright (c) 2015 Moral. All rights reserved.
//

import Foundation
import ObjectMapper

class ParserManager {
    
    /// Generic function available for every model.
    static func parse<T: Mappable>(data: NSData, toClass: T.Type) -> T {
        let parsedObject: AnyObject?
        do {
            parsedObject = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments)
        } catch _ as NSError {
            parsedObject = nil
        }

        let result = Mapper<T>().map(parsedObject)

        return result!
    }
}