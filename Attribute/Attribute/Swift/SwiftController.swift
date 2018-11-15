 
 //
 //  SwiftHomeController.swift
 //  Attribute
 //
 //  Created by Fairy on 2018/11/6.
 //  Copyright © 2018 fairyios. All rights reserved.
 //
 
 import UIKit
 import SnapKit
 
 
 // MARK: - 数据源
 internal final class SwiftDataSouce: IFtableViewDataSouce {
    
    var source: [Dictionary<String, ((UIViewController, IndexPath, String) -> Void)?>] = [
        [
            "typealias(别名)": {(target, indexPath, rowKey) -> Void in
                //https://www.jianshu.com/p/5a3fd872257e
            }
        ],
        [
            "Init": {(target, indexPath, rowKey) -> Void in
                
            }
        ],
        [
            "Dictionary": {(target, indexPath, rowKey) -> Void in
                
                let dataSource = SwiftCollectionDataSouce()
                let view = SwiftCollectionController(title: rowKey, source: dataSource)
                
                target.show(view, sender: nil)
            }
        ],
        [
            "Set": {(target, indexPath, rowKey) -> Void in
                
            }
        ],
        [
            "Array": {(target, indexPath, rowKey) -> Void in
                
            }
        ],
        [
            "排序": {(target, indexPath, rowKey) -> Void in
                
            }
        ],
    ]
 }

 
 
 
 /// SwiftController
 internal final class SwiftController: FtableViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
 }
 
