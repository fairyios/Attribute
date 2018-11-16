
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
internal final class PartDataSource: IFtableViewDataSouce {
    
    var source: [Dictionary<String, ((UIViewController, IndexPath, String) -> Void)?>] = [
        
        [
            "Table View": {(target, indexPath, rowKey) -> Void in
                let dataSource = TableDataSource()
                let homeTable = TableController(title: rowKey, source: dataSource)
                target.show(homeTable, sender: nil)
            }
        ],
        [
            "Tab Bar": {(target, indexPath, rowKey) -> Void in
                let gesture = TabBarController(title: rowKey, source: TabBarDataSource())
                target.show(gesture, sender: nil)
            }
        ],
        [
            "导航栏": {(target, indexPath, rowKey) -> Void in
                let dataSource = NavigationDataSource()
                let view = NavigationController(title: rowKey, source: dataSource)
                target.show(view, sender: nil)
            }
        ],
        [
            "手势": {(target, indexPath, rowKey) -> Void in
                let gesture = GestureController(title: rowKey, source: GestureDataSource())
                target.show(gesture, sender: nil)
            }
        ],
        [
            "Web Kit": {(target, indexPath, rowKey) -> Void in
                
            }
        ],
        [
            "Visual Effect": {(target, indexPath, rowKey) -> Void in
                
            }
        ],
        [
            "Animation": {(target, indexPath, rowKey) -> Void in
                
            }
        ],
        [
            "Dialog": {(target, indexPath, rowKey) -> Void in
                
            }
        ],
        [
            "UIScrollView": {(target, indexPath, rowKey) -> Void in
                
            }
        ],
        [
            "": {(target, indexPath, rowKey) -> Void in
                
            }
        ],
    ]
}

internal final class PartController: FtableViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
}


