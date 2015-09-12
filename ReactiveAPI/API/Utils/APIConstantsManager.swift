//
//  APIConstantsManager.swift
//  ReactiveAPI
//
//  Created by Diana on 12/9/15.
//  Copyright (c) 2015 Moral. All rights reserved.
//

import Foundation

class APIConstantsManager {
    
    static func setupPlist() -> NSDictionary {
        var myDict: NSDictionary?
        let path = NSBundle.mainBundle().pathForResource("APIConstants", ofType: "plist")
        let dict = NSDictionary(contentsOfFile: path!)
        
        return dict!
    }
}

class APIConstants {
    
    static func APIEndPoint() -> String {
        let valueDict: NSDictionary = APIConstantsManager.setupPlist() as NSDictionary
        
        if let key = valueDict["APIEndPoint"] as? String {
            return key
        } else {
            return ""
        }
    }
    
    static func APIPathQuestion() -> String {
        let valueDict: NSDictionary = APIConstantsManager.setupPlist() as NSDictionary
        
        if let key = valueDict.valueForKeyPath("APIPaths.APIPathQuestions") as? String {
            return key
        } else {
            return ""
        }
    }
}