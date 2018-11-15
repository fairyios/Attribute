
//
//  ViewController.swift
//  Attribute
//
//  Created by Fairy on 2018/11/6.
//  Copyright © 2018 fairyios. All rights reserved.
//

import UIKit
import SnapKit

// MARK: - 数据源
internal final class SwiftCollectionDataSouce: IFtableViewDataSouce {
    
    var source: [Dictionary<String, ((UIViewController, IndexPath, String) -> Void)?>] = [
        [
            "[Dictionary<String, Array<String>>]": {(target, indexPath, rowKey) -> Void in
                ////https://www.jianshu.com/p/5a3fd872257e
                
                let tar = target as! SwiftCollectionController
                tar.dictionaryForArrayFunction()
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

/// SwiftCollectionController
internal final class SwiftCollectionController: FtableViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    /// [Dictionary<String, Array<String>>]
    public func dictionaryForArrayFunction() {
        
        /// 数据源
        let _array: [Dictionary<String, Array<String>>] = [
            ["1" : ["1-1", "1-2", "1-3", "1-4"]],
            ["2" : ["2-"]],
            ["3" : ["3-"]],
            ["4" : ["4-"]],
            ["5" : ["5-"]],
            ["6" : ["6-"]]
        ]
        
        /// 节点数
        let getDictionaryCount = {() -> Int  in
            let count = _array.count
            return count
        }
        
        /// 每一行的key
        let getDictionaryKey = {(index: Int) -> String in
            let node =  _array[index] as Dictionary<String, Array<String>>
            let first = node.first
            let key = first?.key
            return key!
        }
        
        /// 每个节点的values
        let getDictionaryValues = {(index: Int) -> [String] in
            let node = _array[index] as Dictionary<String, Array<String>>
            let first = node.first
            let values = first?.value
            return values!
        }
        debugPrint(getDictionaryCount)
        debugPrint(getDictionaryKey)
        debugPrint(getDictionaryValues)
    }
    
}
