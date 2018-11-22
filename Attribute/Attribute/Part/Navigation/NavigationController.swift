 
 //
 //  ViewController.swift
 //  Attribute
 //
 //  Created by Fairy on 2018/11/6.
 //  Copyright © 2018 fairyios. All rights reserved.
 //
 
 import UIKit
 import SnapKit
 internal final class NavigationDataSource: IFtableViewDataSouce {
     
    var source: [Dictionary<String, ((UIViewController, IndexPath, String) -> Void)?>] = [
        [
            "系统导航栏": {(target, indexPath, rowKey) -> Void in
                let system = NavigationSystemController(title: rowKey)
                let systemNavigation = UINavigationController(rootViewController: system)
                target.present(systemNavigation, animated: true, completion: nil)
            }
        ],
        [
            "自定义导航栏": {(target, indexPath, rowKey) -> Void in
                //let define = NavigationSelfViewController()
                //let defineNavigation = DefineNavigationController(rootViewController: define)
                let defineNavigation = DefineNavigationController(title: rowKey)
                target.present(defineNavigation, animated: true, completion: nil)
            }
        ],
        [
            "": {(target, indexPath, rowKey) -> Void in
                
            }
        ],
    ]
 }
 
 /// NavigationController
 internal final class NavigationController: FtableViewController,
    UINavigationControllerDelegate  {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
 }
  
