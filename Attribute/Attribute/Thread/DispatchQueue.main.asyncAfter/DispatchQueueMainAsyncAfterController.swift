

//
//  ViewController.swift
//  Attribute
//
//  Created by Fairy on 2018/11/6.
//  Copyright © 2018 fairyios. All rights reserved.
//

import UIKit
import SnapKit

internal final class DispatchQueueMainAsyncAfterCourseCellDataSource: IFtableView {
    var source: [Dictionary<String, ((UIViewController, IndexPath, String) -> Void)?>] = []
    
    
    internal static let sectionAsyncAfter = "DispatchQueue.main.asyncAfter"
    
    //--DispatchQueue.main.asyncAfter--
    internal static let rowAsyncAfter1: String = "Thread.sleep(: 1.0)"
    internal static let rowAsyncAfter2: String = "(DispatchTime.now() + 1.0)"
    
    var sections: [String] = [
        sectionAsyncAfter
    ]
    
    var rows: [[String]] = [
        [
            rowAsyncAfter1, rowAsyncAfter2
        ]
    ]
    
    var actions: Dictionary<String, ((UIViewController, IndexPath) -> Void)?> = [
        rowAsyncAfter1: {(target, indexPath) -> Void in
            let tar = target as! DispatchQueueMainAsyncAfterController
            tar.afterSleep1()
        },
        rowAsyncAfter2: {(target, indexPath) -> Void in
            let tar = target as! DispatchQueueMainAsyncAfterController
            tar.afterSleep2()
        },
        ]
    
}

/// ThreadHomeController
internal final class DispatchQueueMainAsyncAfterController: UIViewController {
    
    private lazy var myTable: FtableView! = {
        let data = DispatchQueueMainAsyncAfterCourseCellDataSource()
        let table = FtableView(target: self, data: data)
        return table
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = ThreadHomeCourseCellDataSource.rowDispatchQueueMainAsyncAfter
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



