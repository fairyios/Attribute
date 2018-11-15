//
//  ViewController.swift
//  Attribute
//
//  Created by Fairy on 2018/11/6.
//  Copyright © 2018 fairyios. All rights reserved.
//

import UIKit
import SnapKit

internal final class HomeDataSouce: IFtableViewDataSouce {
      
    var source: [Dictionary<String, ((UIViewController, IndexPath, String) -> Void)?>] = [
        [
            "小部件": {(target, indexPath, rowKey) -> Void in
                let unitController = UnitHomeController(title: rowKey, source: UnitHomeDataSource())
                target.show(unitController, sender: nil)
            }
        ],
        [
            "大部件": {(target, indexPath, rowKey) -> Void in
                let part = PartController(title: rowKey, source: PartDataSource())
                target.show(part, sender: nil)
            }
        ],
        [
            "第三方": {(target, indexPath, rowKey) -> Void in
                
            }
        ],
        [
            "Swift": {(target, indexPath, rowKey) -> Void in
                let homeTable = SwiftHomeController(title: rowKey)
                target.show(homeTable, sender: nil)
            }
        ],
        [
            "线程": {(target, indexPath, rowKey) -> Void in
                let homeTable = ThreadHomeController()
                target.show(homeTable, sender: nil)
            }
        ],
        [
            "数据库+缓存": {(target, indexPath, rowKey) -> Void in
                
            }
        ],
        [
            "网络": {(target, indexPath, rowKey) -> Void in
                //http,mqtt
            }
        ],
        [
            "系统资源": {(target, indexPath, rowKey) -> Void in
                //文件操作,相机,文件操作//蓝牙//打印
            }
        ],
        [
            "IOS版本": {(target, indexPath, rowKey) -> Void in
                //IOS系统版本差异//踩坑 1//性能+CPU...//
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

// MARK: - 定义控制器
internal final class HomeController: FtableViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
}
