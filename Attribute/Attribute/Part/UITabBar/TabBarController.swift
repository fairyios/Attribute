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
            "使用UITabBarController": {(target, indexPath, rowKey) -> Void in
                let tar = target as! TabBarController
                tar.useUITabBarController1(tar)
            }
        ],
        [
            "": {(target, indexPath, rowKey) -> Void in
                
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
    
    
    /// 使用UITabBarController
    ///
    /// - Parameter target: <#target description#>
    public func useUITabBarController1(_ target: TabBarController) {
        
        
        let closureChild1 = {() -> UIViewController in
            let label1 = UILabel()
            label1.backgroundColor = nil
            label1.textAlignment = .center
            label1.text = "这个view也是Tab Bar 的一部分"
            
            let child1 = UIViewController()
            child1.view.backgroundColor = UIColor.brown
            child1.navigationItem.title = "子视图1"
            child1.tabBarItem.title = "子视图11"
            child1.title = "子视图111"
            child1.view.addSubview(label1)
            label1.snp.makeConstraints({ (make) in
                make.edges.equalTo(child1.view)
            })
            
            return child1
        }
        
        
        let closureChild2 = {() -> UIViewController  in
            let child2 = ChildViewController()
            child2.view.backgroundColor = UIColor.purple
            child2.navigationItem.title = "子视图2"
            child2.title = "子视图222"
            child2.tabBarItem.title = "子视图22"
            
            let button = UIButton()
            button.backgroundColor = UIColor.brown
            button.setTitle("退场", for: UIControl.State.normal)
            button.addTarget(target, action: #selector(target.useUITabBarController1Dismiss), for: .touchUpInside)
            child2.view.addSubview(button)
            button.snp.makeConstraints({ (make) in
                make.width.equalTo(300)
                make.height.equalTo(100)
                make.centerX.equalTo(child2.view)
                make.centerY.equalTo(child2.view)
            })
            
            return child2
        }
        
        
        let closureChild3 = {() -> UIViewController in
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
            
            return child3
        }
        
        let tabBarController = UITabBarController()
        //设置当前Tab的字体颜色
        tabBarController.tabBar.tintColor = UIColor.magenta
        tabBarController.tabBar.barStyle = UIBarStyle.black
        tabBarController.tabBar.isTranslucent = true //毛玻璃特效
        //设置backgroundColor需要isTranslucent=true
        tabBarController.tabBar.backgroundColor = UIColor.red
        //tabBarController.tabBar.backgroundImage = nil
        //tabBarController.tabBar.shadowImage = nil
        tabBarController.addChild(closureChild1())
        tabBarController.addChild(closureChild2())
        tabBarController.addChild(closureChild3())
        
        
        target.present(tabBarController, animated: true, completion: nil)
    }
    
    
    /// 使用UITabBarController 退场
    @objc private func useUITabBarController1Dismiss () {
        self.dismiss(animated: true, completion: nil)
    }
}
