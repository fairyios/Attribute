
//
//  UIViewController.swift
//  Attribute
//
//  Created by Fairy on 2018/11/6.
//  Copyright © 2018 fairyios. All rights reserved.
//

import UIKit
import SnapKit



// MARK: - ICourseCellDataSource
internal final class UnitColorDataSource: IFtableViewDataSouce {
    
    var source: [Dictionary<String, ((UIViewController, IndexPath, String) -> Void)?>] = [
        
        [
            "预定义颜色": {(target, indexPath, rowKey) -> Void in
                let view = UnitColorSystemController()
                target.show(view, sender: nil)
            }
        ],
        [
            "颜色空间": {(target, indexPath, rowKey) -> Void in
//                // 一个device-dependent 灰度颜色空间
//                @available(iOS 2.0, *)
//                public func CGColorSpaceCreateDeviceGray() -> CGColorSpace
//                // 一个device-dependent RGB颜色空间
//                @available(iOS 2.0, *)
//                public func CGColorSpaceCreateDeviceRGB() -> CGColorSpace
//                //  一个device-dependent CMYK颜色空间
//                @available(iOS 2.0, *)
//                public func CGColorSpaceCreateDeviceCMYK() -> CGColorSpace
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
        [
            "": {(target, indexPath, rowKey) -> Void in
                
            }
        ],
    ]
}

// MARK: - 初始化
internal final class UnitColorController: FtableViewController {
    
    
    // MARK: - 页面加载完成
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
}


