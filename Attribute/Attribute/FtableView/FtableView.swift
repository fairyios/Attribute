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
protocol IFtableView {
    // 每一行对应的闭包action
    var source: [Dictionary<String, ((UIViewController, IndexPath, String) -> Void)?>] { get set }
}

/// 定义 TableView
internal final class FtableView: UITableView {
    
    var data: IFtableView! = nil
    weak var target: UIViewController! = nil
    
    
    /// 指定构造器
    /// 「」
    /// - Parameters:
    ///   - target: target description
    ///   - data: data description
    init(target: UIViewController, data: IFtableView) {
        super.init(frame: CGRect.zero, style: UITableView.Style.plain)
        self.data = data
        self.target = target
        //self.data|self.target 赋值应该在“self.initSelf()”之前，否则会报错
        self.initSelf()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    /// 便利构造器
//    /// 「能正确执行」
//    /// - Parameters:
//    ///   - target: target description
//    ///   - data: data description
//    convenience init(target: UIViewController, data: ICourseCellDataSource) {
//        self.init()
//        self.data = data
//        self.target = target
//        //self.data|self.target 赋值应该在“self.initSelf()”之前，否则会报错
//        self.initSelf()
//    }
    
    private func initSelf() {
        self.backgroundView = nil
        self.backgroundColor = UIColor.orange
        self.delegate = self
        self.dataSource = self
        self.rowHeight = 30.0
        self.tableHeaderView = UIView()
        self.tableFooterView = nil
        self.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
    }
    
}


// MARK: - UITableViewDataSourcew
extension FtableView: UITableViewDataSource {
    
    
    /// Asks the data source to return the number of sections in the table view.
    /// 要求数据源返回表视图中的节数。
    /// - Parameter tableView: tableView description
    /// - Returns: return value description
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    /// Asks the data source for the title of the header of the specified section of the table view.
    /// 向数据源询问表视图的指定部分的标题的标题。
    /// - Parameters:
    ///   - tableView: tableView description
    ///   - section: section description
    /// - Returns: return value description
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return nil
    }
    
    
    /// Tells the data source to return the number of rows in a given section of a table view.
    /// 告诉数据源返回表视图的给定部分中的行数。
    /// - Parameters:
    ///   - tableView: tableView description
    ///   - section: section description
    /// - Returns: return value description
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.data.source.count
    }
    
    
    
    
    
    /// Asks the data source for the title of the footer of the specified section of the table view.
    /// 向数据源询问表视图的指定部分的页脚标题。
    /// - Parameters:
    ///   - tableView: tableView description
    ///   - section: section description
    /// - Returns: return value description
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        
        return nil// return 页脚标题"
    }
    
    /// Asks the data source for a cell to insert in a particular location of the table view
    /// 要求数据源插入表视图的特定位置
    /// - Parameters:
    ///   - tableView: tableView description
    ///   - indexPath: indexPath description
    /// - Returns: return value description
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = self.data.source[indexPath.row]
        let rowKey = row.keys.first
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.accessoryType = .disclosureIndicator // disclosureIndicator:显示">"图标
        cell.textLabel?.text = rowKey
        return cell
    }
    
    
}


// MARK: - UITableViewDelegate
extension FtableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let row = self.data.source[indexPath.row]
        let rowKey = row.keys.first
        let rowValue = row.values.first
        
        if rowValue != nil && (rowValue!) != nil {
            let a = rowValue!!
            a(self.target, indexPath, rowKey!)
        }
        
        //取消选中的行
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
