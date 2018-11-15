
//
//  UIViewController.swift
//  Attribute
//
//  Created by Fairy on 2018/11/6.
//  Copyright © 2018 fairyios. All rights reserved.
//

import UIKit
import SnapKit

 
// MARK: - 定义控制器
internal final class FtableViewController: UIViewController {
    
    
    /// 页面标题
    var fnavigationTitle: String? = nil
    
    /// 数据源
    var fsource: IFtableView! = nil
    
    
    /// 初始化
    ///
    /// - Parameters:
    ///   - title: 标题
    ///   - source: 数据源
    convenience init(title: String, source: IFtableView) {
        self.init()
        self.fnavigationTitle = title
        self.fsource = source
    }
    
    
    /// F TableView
    private lazy var myTable: FtableView! = {
        let table = FtableView(target: self, data: self.fsource)
        return table
    }()
    
    
// MARK: - 页面加载完成
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //设置标题
        self.navigationItem.title = self.fnavigationTitle
        self.view.backgroundColor = UIColor.gray
        
        //添加view的子视图
        self.view.addSubview(self.myTable)
        self.myTable.snp.remakeConstraints { maker in
            maker.edges.equalTo(self.view)
        }
    }
    
    
}


