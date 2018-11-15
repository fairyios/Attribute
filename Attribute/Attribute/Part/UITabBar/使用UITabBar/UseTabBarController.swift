//
//  UseTabBarController.swift
//  Attribute
//
//  Created by Fairy on 2018/11/15.
//  Copyright © 2018 fairyios. All rights reserved.
//

import UIKit


/// 使用UITabBarController
final class UseTabBarController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.gray
        self.navigationItem.title = "使用UITabBar"
        
        
        let childView1 = UIView()
        childView1.backgroundColor = UIColor.orange
        
        let tabBar = UITabBar()
        tabBar.addSubview(childView1)
        
        self.view.addSubview(tabBar)
        
    }
}
