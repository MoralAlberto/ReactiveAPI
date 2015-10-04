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
            .observe({ items in
                if let items = items.value {
                    for item in items {
                        print("\(item.title!)")
                    }
                }
        })
    }
}

