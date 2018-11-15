
//
//  UIViewController.swift
//  Attribute
//
//  Created by Fairy on 2018/11/6.
//  Copyright © 2018 fairyios. All rights reserved.
//

import UIKit
import SnapKit


// MARK: - 数据源
internal final class DemoFtableView: IFtableView {
    
    var sections: [String] = [ ]
    var rows: [[String]] = []
    var actions: Dictionary<String, ((UIViewController, IndexPath) -> Void)?> = [:]
    
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



// MARK: - 定义Controller
internal final class DemoController: UIViewController, IController {
    
    
    /// 页面标题
    var navigationTitle: String? = nil
    
    /// 初始化
    ///
    /// - Parameter title: 标题
    convenience init(title: String) {
        self.init()
        self.navigationTitle = title
    }
    
    
    /// F TableView
    private lazy var myTable: FtableView! = {
        let data = DemoFtableView()
        let table = FtableView(target: self, data: data)
        return table
    }()
    
    
    /// 页面加载完成
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = self.navigationTitle
        self.view.backgroundColor = UIColor.orange
        
        
        self.view.addSubview(self.myTable)
        self.myTable.snp.remakeConstraints { maker in maker.edges.equalTo(self.view) }
    }
    
    
}


