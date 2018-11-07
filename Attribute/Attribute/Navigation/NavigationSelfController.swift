//
//  NavigationViewController.swift
//  Attribute
//
//  Created by Fairy on 2018/11/7.
//  Copyright © 2018 fairyios. All rights reserved.
//

import UIKit
import SnapKit

final class NavigationSelfController : UIViewController {
    
    
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
//            make.width.height.equalTo(200)
//            make.height.height.equalTo(200)
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
            self.show(next, sender: nil)
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.purple
        
        self.navigationItem.title = "根节点"
        
        self.view.addSubview(self.nextViewButton)
        self.nextViewButton.snp.makeConstraints { make in
            make.width.height.equalTo(200)
            make.height.height.equalTo(200)
            make.centerX.equalTo(self.view.snp.centerX)
            make.centerY.equalTo(self.view.snp.centerY)
        }
        
    }
}
