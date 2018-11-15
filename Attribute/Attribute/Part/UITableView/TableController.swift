 
//
//  ViewController.swift
//  Attribute
//
//  Created by Fairy on 2018/11/6.
//  Copyright © 2018 fairyios. All rights reserved.
//

import UIKit
import SnapKit

 
 internal final class TableDataSource: IFtableViewDataSouce {
     
    var source: [Dictionary<String, ((UIViewController, IndexPath, String) -> Void)?>] = [
        [
            "自定义TableViewCell": {(target, indexPath, rowKey) -> Void in
                let defineTableViewCell = DefineTableViewCellController(title: rowKey)
                target.show(defineTableViewCell, sender: nil)
            }
        ],
        [
            "Header In Section": {(target, indexPath, rowKey) -> Void in
                let sectionHeader = TableSectionHeaderController(title: rowKey)
                target.show(sectionHeader, sender: nil)
            }
        ],
        [
            "": {(target, indexPath, rowKey) -> Void in
                
            }
        ],
    ]
 }

/// TableController
internal final class TableController: FtableViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
}


 
