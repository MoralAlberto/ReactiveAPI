//
//  QuestionManager.swift
//  AMGReactiveAPI
//
//  Created by Alberto Moral on 10/9/15.
//  Copyright (c) 2015 Moral. All rights reserved.
//

import Foundation
import ReactiveCocoa
import ObjectMapper

class QuestionManager {
    
    static func questions() -> Signal<[Items]?, NSError> {
        return Signal {
            sink in
            
            let url = NSURL(string:"\(APIConstants.APIEndPoint()+APIConstants.APIPathQuestion())")
            let request = NSURLRequest(URL: url!)
            
            NetworkManager.dataWithRequest(request)
                .start(next: { data in

                    let questions: Question? = ParserManager.parse(data, toClass: Question.self)
                    
                    if let questions = questions {
                        sendNext(sink, questions.items)
                        sendCompleted(sink)
                    } else {
                        sendError(sink, NSError())
                    }
            })
            return nil
        }
    }
}