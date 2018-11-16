//
//  TabBarController.swift
//  Attribute
//
//  Created by Fairy on 2018/11/15.
//  Copyright © 2018 fairyios. All rights reserved.
//



import UIKit
import SnapKit

fileprivate final class ChildViewController : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.purple
        self.navigationItem.title = "子视图22"
        //self.tabBarItem.title = "子视图222"
        self.title = "子视图2222"
    }
}

final class TabBarDataSource : IFtableViewDataSouce {
    var source: [Dictionary<String, ((UIViewController, IndexPath, String) -> Void)?>] = [
        [
            "自定义UITabBarController": {(target, indexPath, rowKey) -> Void in
                let view = DefineTabBarController()
                target.present(view, animated: true, completion: nil)
            }
        ],
        [
            "使用UITabBarController(不含导航栏)": {(target, indexPath, rowKey) -> Void in
                
                let child1 = UIViewController()
                child1.view.backgroundColor = UIColor.brown
                child1.navigationItem.title = "子视图1"
                child1.tabBarItem.title = "子视图11"
                child1.title = "子视图111"
                
                let child2 = ChildViewController()
                child2.title = "子视图2"
                
                //包含导航栏的子视图
                let child3Root = UIViewController()
                child3Root.view.backgroundColor = UIColor.orange
                child3Root.navigationItem.title = "子视图3"
                
                let child3 = UINavigationController(rootViewController: child3Root)
                child3.tabBarItem.title = "子视图33"
                child3.title = "子视图333"
                child3.navigationBar.barTintColor = UIColor.purple
                child3.navigationBar.barStyle = .black
                child3.navigationBar.isTranslucent = true
                child3.navigationBar.titleTextAttributes = [
                    NSAttributedString.Key.foregroundColor : UIColor.magenta.cgColor
                ]
                
                
                let tabBarController = UITabBarController()
                //设置当前Tab的字体颜色
                tabBarController.tabBar.tintColor = UIColor.magenta
                tabBarController.addChild(child1)
                tabBarController.addChild(child2)
                tabBarController.addChild(child3)
                
                target.present(tabBarController, animated: true, completion: nil)
            }
        ],
        [
            "使用UITabBarController(包含导航栏)": {(target, indexPath, rowKey) -> Void in
                
            }
        ],
        [
            "使用UITabBar": {(target, indexPath, rowKey) -> Void in
                let view = UseTabBarController()
                target.show(view, sender: nil)
            }
        ],
        [
            "": {(target, indexPath, rowKey) -> Void in
                
            }
        ],
    ]
    
    
}

final class TabBarController: FtableViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
}
