//
//  NavigationViewController.swift
//  Attribute
//
//  Created by Fairy on 2018/11/7.
//  Copyright © 2018 fairyios. All rights reserved.
//

import UIKit
import SnapKit

final class DefineNavigationRootViewController : UIViewController {
    
    /// 退场按钮
    private lazy var dismissButton: UIButton = {
        let button =  UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(self.dismissButtonTouchUpInside), for: .touchUpInside)
        button.clipsToBounds = true
        button.layer.borderWidth = 0.9
        button.layer.borderColor = UIColor.white.cgColor
        button.clipsToBounds = true
        button.layer.cornerRadius = 15
        button.backgroundColor = UIColor.orange
        button.setTitle("退场", for: UIControl.State.normal)
        //        button.snp.makeConstraints { (make) -> Void in
        //            make.width.equalTo(200)
        //            make.height.equalTo(200)
        //        }
        return button
    }()
    
    /// 退场按钮的TouchUpInside
    @objc private func dismissButtonTouchUpInside() {
        print("@objc func nextViewButtonTouchUpInside()")
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    /// 下一页按钮
    private lazy var nextViewButton: UIButton = {
        let leftButton =  UIButton()
        leftButton.translatesAutoresizingMaskIntoConstraints = false
        leftButton.addTarget(self, action: #selector(self.nextViewButtonTouchUpInside), for: .touchUpInside)
        leftButton.clipsToBounds = true
        leftButton.layer.borderWidth = 0.9
        leftButton.layer.borderColor = UIColor.white.cgColor
        leftButton.clipsToBounds = true
        leftButton.layer.cornerRadius = 15
        leftButton.backgroundColor = UIColor.orange
        leftButton.setTitle("下一页", for: UIControl.State.normal)
//        leftButton.snp.makeConstraints { (make) -> Void in
//            make.width.equalTo(200)
//            make.height.equalTo(200)
//        }
        return leftButton
    }()
    
    /// 下一页按钮的TouchUpInside
    @objc private func nextViewButtonTouchUpInside() {
        print("@objc func nextViewButtonTouchUpInside()")
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.0) {
            
            let next = UIViewController()
            next.navigationItem.title = "子视图"
            next.view.backgroundColor = UIColor.gray
//            next.view.addSubview(self.dismissButton)
//            self.dismissButton.snp.makeConstraints { make in
//                make.width.equalTo(200)
//                make.height.equalTo(200)
//                make.centerX.equalTo(next.view.snp.centerX)
//                make.centerY.equalTo(next.view.snp.centerY).offset(100 + 10)
//            }
            
            self.show(next, sender: nil)
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.purple
        
        self.navigationItem.title = "自定义UINavigationController"
        
        self.view.addSubview(self.nextViewButton)
        self.nextViewButton.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(200)
            make.centerX.equalTo(self.view.snp.centerX)
            make.centerY.equalTo(self.view.snp.centerY).offset(-100)
        }
        
        self.view.addSubview(self.dismissButton)
        self.dismissButton.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(200)
            make.centerX.equalTo(self.view.snp.centerX)
            make.centerY.equalTo(self.view.snp.centerY).offset(100 + 10)
        }
        
    }
}
