 
 //
 //  ViewController.swift
 //  Attribute
 //
 //  Created by Fairy on 2018/11/6.
 //  Copyright © 2018 fairyios. All rights reserved.
 //
 
 import UIKit
 import SnapKit
 
  
 
 /// NavigationSystemController
 internal final class NavigationSystemController: UIViewController, IController, UINavigationControllerDelegate {
    
    
    /// 返回按钮
    private lazy var leftBarButtonItem: UIBarButtonItem = {
//        let imageView = UIImageView(image: UIImage(named: "home_back_white_24x24"))
//        imageView.transform = .identity
//        imageView.contentMode = .scaleAspectFit
//        imageView.alpha = 0.9
        
        let leftButton =  UIButton()//(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        leftButton.translatesAutoresizingMaskIntoConstraints = false
        leftButton.addTarget(self, action: #selector(self.leftBarButtonItemTouchUpInside), for: .touchUpInside)
        leftButton.clipsToBounds = true
        leftButton.layer.borderWidth = 0.9
        leftButton.layer.borderColor = UIColor.white.cgColor
        leftButton.clipsToBounds = true
        leftButton.layer.cornerRadius = 15
        leftButton.backgroundColor = UIColor.clear
        leftButton.setBackgroundImage(UIImage(named: "home_back_white_24x24"), for: UIControl.State.normal)
        
        let leftBarButtonItem = UIBarButtonItem(customView: leftButton)
        //let leftBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: #selector(self.leftBarButtonItemTouchUpInside))
        
        return leftBarButtonItem
    }()
    
    /// 返回按钮的TouchUpInside
    @objc private func leftBarButtonItemTouchUpInside() {
        print("@objc func back()")
    }
    
    /// 退场按钮
    private lazy var dismissButton: UIButton = {
        let button =  UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(self.dismissButtonTouchUpInside), for: .touchUpInside)
        button.clipsToBounds = true
        button.layer.borderWidth = 0.9
        button.layer.cornerRadius = 0
        button.layer.borderColor = UIColor.purple.cgColor
        button.backgroundColor = UIColor.purple
        button.setTitle("退场", for: UIControl.State.normal)
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0) //使用此属性可以调整按钮内容的有效绘图矩形并重新定位。
//        button.snp.makeConstraints { (make) -> Void in
//            make.width.equalTo(40)
//            make.height.equalTo(40)
//        }
        return button
    }()
    
    /// 退场按钮的TouchUpInside
    @objc private func dismissButtonTouchUpInside() {
        print("@objc func nextViewButtonTouchUpInside()")
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    var navigationTitle: String? = nil
    
    convenience init(title: String) {
        self.init()
        self.navigationTitle = title
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.orange
        
        //设置导航栏的统一的背景色
        //UINavigationBar.appearance().tintColor = UIColor.red
        
        //设置导航栏的样式
        self.navigationController?.navigationBar.barStyle = .black
        
        //主队列异步任务,结果为有序
        let mainQueue = DispatchQueue.main
        mainQueue.asyncAfter(deadline: DispatchTime.now() + 0.0) {
            self.navigationItem.prompt = "打印默认值"
            
            debugPrint("self.navigationController?.navigationBar.shadowImage ?? Any.self")
            debugPrint(self.navigationController?.navigationBar.shadowImage ?? Any.self)
            
            //获取控制器中最顶端的视图
            debugPrint("self.navigationController?.topViewController ?? Any.self 获取控制器中最顶端的视图")
            debugPrint(self.navigationController?.topViewController ?? Any.self)
            //获取控制器当前显示的视图
            debugPrint("self.navigationController?.visibleViewController ?? Any.self 获取控制器当前显示的视图")
            debugPrint(self.navigationController?.visibleViewController ?? Any.self)
            //获取当前控制器所有的子视图
            debugPrint("self.navigationController?.viewControllers ?? Any.self 获取当前控制器所有的子视图")
            debugPrint(self.navigationController?.viewControllers ?? Any.self)
            
            debugPrint("self.navigationItem.titleView ?? Any.self")
            debugPrint(self.navigationItem.titleView ?? Any.self)
        }
        mainQueue.asyncAfter(deadline: DispatchTime.now() + 1.0) {
            //self.title = "title" // 没有效果
            //self.navigationController?.navigationItem.title = "title"// 没有效果
            self.navigationItem.prompt = self.navigationTitle
            self.navigationItem.title = self.navigationTitle
            
        }
        mainQueue.asyncAfter(deadline: DispatchTime.now() + 2.0) {
            //将导航栏设置成透明
            self.navigationItem.prompt = "将导航栏设置成透明"
            self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
            self.navigationController?.navigationBar.shadowImage = UIImage()
            self.navigationController?.navigationBar.isTranslucent = true
        }
        mainQueue.asyncAfter(deadline: DispatchTime.now() + 3.0) {
            //设置导航栏的背景图
            self.navigationItem.prompt = "设置导航栏的背景图"
            let image = UIImage(named: "icon-40")
            self.navigationController?.navigationBar.setBackgroundImage(image, for: UIBarMetrics.default)
            //self.navigationController?.navigationBar.backIndicatorImage //后退按钮旁边显示的图像。
            self.navigationController?.navigationBar.contentMode = .scaleAspectFill
            self.navigationController?.navigationBar.isTranslucent = false
            self.navigationController?.navigationBar.shadowImage = nil
        }
        mainQueue.asyncAfter(deadline: DispatchTime.now() + 4.0) {
            self.navigationItem.prompt = "设置导航栏的背景颜色 清空"
            self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: ""), for: UIBarMetrics.default)
            self.navigationController?.navigationBar.isTranslucent = false
            self.navigationController?.navigationBar.shadowImage = nil
        }
        mainQueue.asyncAfter(deadline: DispatchTime.now() + 5.0) {
            self.navigationItem.prompt = "设置导航栏的背景色"
            self.navigationController?.navigationBar.isTranslucent = true
            self.navigationController?.navigationBar.shadowImage = nil
            self.navigationController?.navigationBar.backIndicatorImage = nil
            self.navigationController?.navigationBar.shadowImage = nil
            //self.navigationController?.navigationBar.backgroundColor = UIColor.orange // 没有效果
            self.navigationController?.navigationBar.barTintColor = UIColor.orange // 设置导航栏的背景色// 有效果,是正确的颜色
            //self.navigationController?.navigationBar.tintColor = UIColor.orange  // 没有效果
        }
        mainQueue.asyncAfter(deadline: DispatchTime.now() + 6.0) {
            self.navigationItem.prompt = "设置导航栏标题的字体颜色"
            self.navigationController?.navigationBar.titleTextAttributes = [
                NSAttributedString.Key.foregroundColor : UIColor.red.cgColor
            ]
        }
        mainQueue.asyncAfter(deadline: DispatchTime.now() + 7.0) {
            self.navigationItem.prompt = "设置导航栏的leftBarButtonItem"
            
            let customView = UIView()
            customView.snp.makeConstraints { (make) -> Void in
                make.width.equalTo(40)
                make.height.equalTo(30)
            }
            customView.addSubview(self.dismissButton)
            self.dismissButton.snp.makeConstraints { (make) -> Void in
                make.edges.equalTo(customView)
            }
            
            self.navigationItem.hidesBackButton = true
            self.navigationItem.leftBarButtonItem = UIBarButtonItem()
            self.navigationItem.leftBarButtonItem?.customView = customView
            //如果此属性值为正，则组合图像和标题的宽度是固定的。 如果值为0.0或负数，则项目将组合图像和标题的宽度设置为适合。 如果样式使用无线电模式，则忽略此属性。 默认值为0.0。
            //self.navigationItem.leftBarButtonItem?.width = -15
            
        }
        
        
        
        //        let thread:Thread = Thread {
        //            //设置prompt属性,主要是用来做一些提醒，比如网络请求，数据加载等等
        //            self.navigationItem.prompt = "正在加载数据";
        //            Thread.sleep(forTimeInterval: 3.0)
        //            //不用时，将prompt属性置为nil即可,自带动画效果哦
        //            //self.navigationItem.prompt = nil;
        //        }
        //        thread.start()
        
        
        
    }
 }
 
 
 
