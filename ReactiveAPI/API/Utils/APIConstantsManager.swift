//
//  APIConstantsManager.swift
//  ReactiveAPI
//
//  Created by Diana on 12/9/15.
//  Copyright (c) 2015 Moral. All rights reserved.
//

import Foundation

class APIConstantsManager {
    
    static var ApiConstants = "APIConstants"
    
    static func setupPlist() -> NSDictionary {
        let path = NSBundle.mainBundle().pathForResource(ApiConstants, ofType: "plist")
        let dict = NSDictionary(contentsOfFile: path!)
        
        return dict!
    }
}

class APIConstants {
    
    static var ApiEndPoint = "APIEndPoint"
    static var ApiPathQuestions = "APIPaths.APIPathQuestions"
    static var valueDict: NSDictionary = APIConstantsManager.setupPlist() as NSDictionary
    
    static func APIEndPoint() -> String? {
        return valueDict[ApiEndPoint] as? String
    }
    
    static func APIPathQuestion() -> String? {
        return valueDict.valueForKeyPath(ApiPathQuestions) as? String
    }
}