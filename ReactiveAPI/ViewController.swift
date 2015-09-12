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
        
        API.questions()
            .observe(next: { items in 

                if let items = items {
                    for item in items {
                        println("\(item.title)")
                    }
                }
        })
    }
}

