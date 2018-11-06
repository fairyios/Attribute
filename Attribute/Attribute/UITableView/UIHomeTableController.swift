//
//  TableHomeController.swift
//  Attribute
//
//  Created by Fairy on 2018/11/6.
//  Copyright © 2018 fairyios. All rights reserved.
//

import UIKit

internal final class UIHomeTableController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = HomeController.secondUITableView
        self.view.backgroundColor = UIColor.orange
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
