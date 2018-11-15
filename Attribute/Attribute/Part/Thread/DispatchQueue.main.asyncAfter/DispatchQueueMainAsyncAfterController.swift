

//
//  ViewController.swift
//  Attribute
//
//  Created by Fairy on 2018/11/6.
//  Copyright © 2018 fairyios. All rights reserved.
//

import UIKit
import SnapKit

internal final class DispatchQueueMainAsyncAfterCourseCellDataSource: IFtableViewDataSouce {
     
    var source: [Dictionary<String, ((UIViewController, IndexPath, String) -> Void)?>] = [
        [
            "Thread.sleep(: 1.0)会卡UI": {(target, indexPath, rowKey) -> Void in
                let tar = target as! DispatchQueueMainAsyncAfterController
                tar.afterSleep1()
            }
        ],
        [
            "(DispatchTime.now() + 1.0)不卡UI": {(target, indexPath, rowKey) -> Void in
                let tar = target as! DispatchQueueMainAsyncAfterController
                tar.afterSleep2()
            }
        ],
        [
            "": {(target, indexPath, rowKey) -> Void in
                
            }
        ],
        ]
}

/// ThreadHomeController
internal final class DispatchQueueMainAsyncAfterController: UIViewController {
    
    var navigationTitle: String? = nil
    
    convenience init(title: String) {
        self.init()
        self.navigationTitle = title
    }
    
    private lazy var myTable: FtableView! = {
        let data = DispatchQueueMainAsyncAfterCourseCellDataSource()
        let table = FtableView(target: self, data: data)
        return table
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = self.navigationTitle
        self.view.backgroundColor = UIColor.orange
        self.view.addSubview(self.myTable)
        self.myTable.snp.remakeConstraints { maker in maker.edges.equalTo(self.view) }
        
    }
    
    /// DispatchQueue.main 异步提交时Sleep -> 结果：会导致uipo不能及时更新
    public func afterSleep1() {
        debugPrint("[mainQueue.asyncAfter][main][1]")
        
        //主队列异步任务,结果为有序
        let mainQueue = DispatchQueue.main
        mainQueue.asyncAfter(deadline: DispatchTime.now() + 0.0) {
            debugPrint("[mainQueue.asyncAfter][-1]")
            Thread.sleep(forTimeInterval: 1.0)
        }
        mainQueue.asyncAfter(deadline: DispatchTime.now() + 0.0) {
            debugPrint("[mainQueue.asyncAfter][0]")
            Thread.sleep(forTimeInterval: 1.0)
        }
        mainQueue.asyncAfter(deadline: DispatchTime.now() + 0.0) {
            debugPrint("[mainQueue.asyncAfter][1]")
            Thread.sleep(forTimeInterval: 2.0)
        }
        debugPrint("[mainQueue.asyncAfter][main][2]")
    }
    
    /// DispatchQueue.main 异步提交时Sleep -> 结果：不会导致ui不能及时更新
    public func afterSleep2() {
        debugPrint("[mainQueue.asyncAfter][main][1]")
        
        //主队列异步任务,结果为有序
        let mainQueue = DispatchQueue.main
        mainQueue.asyncAfter(deadline: DispatchTime.now() + 1.0) {
            debugPrint("[mainQueue.asyncAfter][-1]")
        }
        mainQueue.asyncAfter(deadline: DispatchTime.now() + 2.0) {
            debugPrint("[mainQueue.asyncAfter][0]")
        }
        mainQueue.asyncAfter(deadline: DispatchTime.now() + 3.0) {
            debugPrint("[mainQueue.asyncAfter][1]")
        }
        debugPrint("[mainQueue.asyncAfter][main][2]")
    }
    
    
}



