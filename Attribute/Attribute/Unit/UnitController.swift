
//
//  UnitHomeController.swift
//  Attribute
//
//  Created by Fairy on 2018/11/6.
//  Copyright © 2018 fairyios. All rights reserved.
//

import UIKit
import SnapKit
internal final class UnitDataSource: IFtableViewDataSouce {
     
    var source: [Dictionary<String, ((UIViewController, IndexPath, String) -> Void)?>] = [
        [
            "UIView": {(target, indexPath, rowKey) -> Void in
                
            }
        ],
        [
            "UILabel": {(target, indexPath, rowKey) -> Void in
                let con = UnitLabelController()
                target.show(con, sender: nil)
            }
        ],
        [
            "UIButton": {(target, indexPath, rowKey) -> Void in
                
            }
        ],
        [
            "UISlider": {(target, indexPath, rowKey) -> Void in
                
            }
        ],
        [
            "UIImage": {(target, indexPath, rowKey) -> Void in
                
            }
        ],
        [
            "UIImageView": {(target, indexPath, rowKey) -> Void in
                
            }
        ],
        [
            "UIBarButtonItem": {(target, indexPath, rowKey) -> Void in
                
            }
        ],
        [
            "UIFont": {(target, indexPath, rowKey) -> Void in
                
            }
        ],
        [
            "UIColor": {(target, indexPath, rowKey) -> Void in
                
            }
        ],
        [
            "UIScreen": {(target, indexPath, rowKey) -> Void in
                
            }
        ],
        [
            "UIDevice": {(target, indexPath, rowKey) -> Void in
                
            }
        ],
        [
            "UITouch": {(target, indexPath, rowKey) -> Void in
                
            }
        ],
        [
            "键盘": {(target, indexPath, rowKey) -> Void in
                
            }
        ],
        [
            "AppDelegate": {(target, indexPath, rowKey) -> Void in
                
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
 

// MARK: - 定义控制器: 小部件
internal final class UnitController: FtableViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
}

