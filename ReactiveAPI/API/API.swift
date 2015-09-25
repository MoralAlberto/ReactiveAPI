//
//  API.swift
//  AMGReactiveAPI
//
//  Created by Alberto Moral on 10/9/15.
//  Copyright (c) 2015 Moral. All rights reserved.
//

import Foundation
import ReactiveCocoa

class API {
    
    static func questions() -> Signal<[Items], NoError> {
        return QuestionManager.questions()
    }
}