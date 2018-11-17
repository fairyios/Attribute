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
                let tabBarCon = target as! TabBarController
                
                let childView1 = tabBarCon.getChildView1(text: "这个View也是TabBar的一部分")
                let childView2 = tabBarCon.getChildView2()
                let childView3 = tabBarCon.getChildView3()
                
                let tabBarController = UITabBarController()
                //设置当前Tab的字体颜色
                tabBarController.tabBar.tintColor = UIColor.magenta//图片文字一起变色
                tabBarController.tabBar.barStyle = UIBarStyle.black
                tabBarController.tabBar.isTranslucent = true //毛玻璃特效
                //设置backgroundColor需要isTranslucent=true
                tabBarController.tabBar.backgroundColor = UIColor.white
                //tabBarController.tabBar.backgroundImage = nil
                //tabBarController.tabBar.shadowImage = nil
                tabBarController.addChild(childView1)
                tabBarController.addChild(childView2)
                tabBarController.addChild(childView3)
                tabBarController.selectedIndex = 1 //选中第二张视图
                
                tabBarCon.present(tabBarController, animated: true, completion: nil)
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
            "设置背景颜色": {(target, indexPath, rowKey) -> Void in
                let tabCon = target as! TabBarController
                
                let childText1 = """
                设置背景颜色:\r\n
                //设置当前Tab的字体颜色
                tabBarController.tabBar.tintColor = UIColor.magenta\r\n
                tabBarController.tabBar.barStyle = UIBarStyle.black\r\n
                //毛玻璃特效
                tabBarController.tabBar.isTranslucent = true\r\n
                //设置backgroundColor需要isTranslucent=true\r\n
                tabBarController.tabBar.backgroundColor = UIColor.red\r\n
                """
                let childView1 = tabCon.getChildView1(text: childText1)
                
                let tabBarController = UITabBarController()
                //设置当前Tab的字体颜色
                tabBarController.tabBar.tintColor = UIColor.magenta//图片文字一起变色
                tabBarController.tabBar.barStyle = UIBarStyle.black
                tabBarController.tabBar.isTranslucent = true //毛玻璃特效
                //设置backgroundColor需要isTranslucent=true
                tabBarController.tabBar.backgroundColor = UIColor.red
                //tabBarController.tabBar.backgroundImage = nil
                //tabBarController.tabBar.shadowImage = nil
                tabBarController.addChild(childView1)
                
                tabCon.present(tabBarController, animated: true, completion: nil)
            }
        ],
        [
            "": {(target, indexPath, rowKey) -> Void in
                
            }
        ],
        [
            "": {(target, indexPath, rowKey) -> Void in
                
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
    
    
    /// 添加退场按钮
    ///
    /// - Parameter container: UIViewController
    /// - Returns: UIButton
    public func addDismissButton(container: UIViewController) {
        let button = UIButton()
        button.backgroundColor = UIColor.brown
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.layer.borderWidth = 1.0
        button.setTitle("退场", for: UIControl.State.normal)
        button.addTarget(self, action: #selector(self.useUITabBarController1Dismiss), for: .touchUpInside)
        
        container.view.addSubview(button)
        button.snp.makeConstraints({ (make) in
            make.width.equalTo(300)
            make.height.equalTo(100)
            make.centerX.equalTo(container.view)
            
            let bottom = container.tabBarController?.tabBar.frame.height ?? -70.0
            debugPrint("child1.tabBarController?.tabBar.frame.height = \(bottom)")
            make.bottom.equalTo(container.view).offset(bottom)
        })
    }
    
    
    /// 使用UITabBarController 退场
    @objc public func useUITabBarController1Dismiss () {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    /// 子视图1
    ///
    /// - Returns: UIViewController
    public func getChildView1(text: String? = nil) -> UIViewController {
        
        let child1 = UIViewController()
        child1.view.backgroundColor = UIColor.brown
        child1.navigationItem.title = "子视图1"
        child1.tabBarItem.title = "子视图11"
        child1.title = "子视图111"
        
        if text != nil {
            let label1 = UILabel()
            label1.numberOfLines = 0
            label1.backgroundColor = nil
            label1.textAlignment = .left
            label1.text = text
            
            child1.view.addSubview(label1)
            label1.snp.makeConstraints({ (make) in
                make.top.equalTo(30)
                make.left.equalTo(child1.view).offset(10)
                make.right.equalTo(child1.view).offset(10)
            })
        }
        
        self.addDismissButton(container: child1)
        
        return child1
    }
    
    
    /// 子视图2
    ///
    /// - Returns: UIViewController
    public func getChildView2() -> UIViewController {
        let image = #imageLiteral(resourceName: "zhinanzhen")
        let child2 = ChildViewController()
        child2.view.backgroundColor = UIColor.purple
        child2.navigationItem.title = "子视图2"
        child2.title = "子视图222"
        child2.tabBarItem.title = "子视图22"
        child2.tabBarItem.image = image
        child2.tabBarItem.selectedImage = image
        //child2.tabBarItem.imageInsets = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
        
        self.addDismissButton(container: child2)
        
        return child2
    }
    
    
    /// 子视图3
    ///
    /// - Returns: UIViewController
    public func getChildView3() -> UIViewController {
    
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
        
        self.addDismissButton(container: child3)
        
        return child3
    }
    
    
    
    
    
    
}
