//
//  IFtableView.swift
//  Attribute
//
//  Created by Fairy on 2018/11/15.
//  Copyright © 2018 fairyios. All rights reserved.
//

import UIKit

// MARK: - 数据源
protocol IFtableViewDataSouce {
    // 每一行对应的闭包action
    var source: [Dictionary<String, ((UIViewController, IndexPath, String) -> Void)?>] { get set }
}



// MARK: - 数据源
internal final class FtableViewDataSouce: IFtableViewDataSouce {
    
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
