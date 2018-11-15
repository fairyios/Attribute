//
//  UINavigationControllerSelf.swift
//  Attribute
//
//  Created by Fairy on 2018/11/7.
//  Copyright © 2018 fairyios. All rights reserved.
//

import UIKit



/// 自定义导航h栏
final class NavigationSelfController : UINavigationController, IController, UINavigationControllerDelegate {
    
    var navigationTitle: String? = nil
    
    convenience init(title: String) {
        self.init()
        self.navigationTitle = title
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        
        debugPrint("self.navigationBar")
        debugPrint(self.navigationBar)
        
        debugPrint("navigationItem")
        debugPrint(self.navigationItem)
        
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.0) {
            //设置导航栏标题的字体颜色
            self.navigationBar.titleTextAttributes = [
                NSAttributedString.Key.foregroundColor : UIColor.red.cgColor
            ]
        }
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.0) {
            //设置导航栏的返回按钮颜色
            self.navigationBar.barStyle = .black
            self.navigationBar.barTintColor = UIColor.orange
        }
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.0) {
            //将导航栏设置成透明
            self.navigationBar.setBackgroundImage(UIImage(), for: .default)
            self.navigationBar.shadowImage = UIImage()
            self.navigationBar.isTranslucent = true
        }
    }
    
    convenience init() {
        let root = NavigationSelfViewController()
        
        //设置导航栏:返回按钮
        //let backTitle = rootViewController.navigationItem.title
        let backBarButton = UIBarButtonItem()//(title: "自定义UINavigationController", style: .plain, target: nil, action: nil)
        backBarButton.tintColor = UIColor.white
        backBarButton.title = "自定义UINavigationController"
        root.navigationItem.backBarButtonItem = backBarButton
        
        self.init(rootViewController: root)
    }
    
    /// 重载了此方法，同时需要重载“override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)”
    /// 才不会异常
    /// - Parameter rootViewController: 根节点Controller
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        
        
       
        
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
