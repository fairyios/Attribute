//
//  UINavigationControllerSelf.swift
//  Attribute
//
//  Created by Fairy on 2018/11/7.
//  Copyright © 2018 fairyios. All rights reserved.
//

import UIKit



/// 自定义导航h栏
final class UINavigationControllerSelf : UINavigationController, UINavigationControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        
        debugPrint("self.navigationBar")
        debugPrint(self.navigationBar)
        
        debugPrint("navigationItem")
        debugPrint(self.navigationItem)
         
        
    }
}
