//
//  SwiftKeywordController.swift
//  Attribute
//
//  Created by Fairy on 2018/11/9.
//  Copyright © 2018 fairyios. All rights reserved.
//

import UIKit

// MARK: - 数据源
internal final class SwiftKeywordDataSouce: IFtableViewDataSouce {
    
    var source: [Dictionary<String, ((UIViewController, IndexPath, String) -> Void)?>] = [
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



final class SwiftKeywordController: FtableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}



