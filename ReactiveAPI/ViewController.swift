//
//  ViewController.swift
//  AMGReactiveAPI
//
//  Created by Alberto Moral on 6/9/15.
//  Copyright (c) 2015 Moral. All rights reserved.
//

import UIKit
import ReactiveCocoa

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSURL(string: "https://api.stackexchange.com/2.2/questions?order=desc&sort=activity&site=stackoverflow")
        let request = NSURLRequest(URL: url!)
        
        API.questions(request)
            .observe(next: { items in 

                if let items = items {
                    for item in items {
                        println("\(item.title)")
                    }
                }
        })
    }
}

