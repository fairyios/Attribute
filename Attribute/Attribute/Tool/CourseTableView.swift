//
//  ViewController.swift
//  Attribute
//
//  Created by Fairy on 2018/11/6.
//  Copyright © 2018 fairyios. All rights reserved.
//

import UIKit
import SnapKit

protocol ICourseTableView {
    var source: [Dictionary<String, Array<String>>] { get set }
    
    var titleSections: [String] { get set }
    var cellRows:Dictionary<String, String> { get set }
}

extension CourseTableView {
    
    /// 节点数
    private func getDictionaryCount() -> Int {
        let count = self.source.count
        return count
    }
    
    /// 每一行的key
    private func getDictionaryKey(index: Int) -> String {
        let node =  self.source[index] as Dictionary<String, Array<String>>
        let first = node.first
        let key = first?.key
        return key!
    }
    
    /// 每个节点的values
    private func getDictionaryValues(index: Int) -> [String] {
        let node = self.source[index] as Dictionary<String, Array<String>>
        let first = node.first
        let values = first?.value
        return values!
    }
}

/// CourseTableController
internal final class CourseTableView: UITableView, ICourseTableView {
    
    
    var titleSections: [String] = []
    var cellRows: Dictionary<String, String> = [:]
    
    public var source: [Dictionary<String, Array<String>>] = []
    
    convenience init(data: [Dictionary<String, Array<String>>]) {
        self.init()
        
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
extension CourseTableView: UITableViewDataSource {
    
    
    /// Asks the data source to return the number of sections in the table view.
    /// 要求数据源返回表视图中的节数。
    /// - Parameter tableView: tableView description
    /// - Returns: return value description
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.getDictionaryCount()
    }
    
    
    /// Tells the data source to return the number of rows in a given section of a table view.
    /// 告诉数据源返回表视图的给定部分中的行数。
    /// - Parameters:
    ///   - tableView: tableView description
    ///   - section: section description
    /// - Returns: return value description
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let values = self.getDictionaryValues(index: section)
        return values.count
    }
    
    
    /// Asks the data source for the title of the header of the specified section of the table view.
    /// 向数据源询问表视图的指定部分的标题的标题。
    /// - Parameters:
    ///   - tableView: tableView description
    ///   - section: section description
    /// - Returns: return value description
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let nodeKey = self.getDictionaryKey(index: section)
        return nodeKey
    }
    
    
    /// Asks the data source for the title of the footer of the specified section of the table view.
    /// 向数据源询问表视图的指定部分的页脚标题。
    /// - Parameters:
    ///   - tableView: tableView description
    ///   - section: section description
    /// - Returns: return value description
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        
        return ""// return 页脚标题"
    }
    
    /// Asks the data source for a cell to insert in a particular location of the table view
    /// 要求数据源插入表视图的特定位置
    /// - Parameters:
    ///   - tableView: tableView description
    ///   - indexPath: indexPath description
    /// - Returns: return value description
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let values = self.getDictionaryValues(index: indexPath.section)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.accessoryType = .disclosureIndicator // disclosureIndicator:显示">"图标
        cell.textLabel?.text = values[indexPath.row]
        return cell
    }
    
    
}


// MARK: - UITableViewDelegate
extension CourseTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        //let title = CourseTableController.getDictionaryKey(index: indexPath.section)
        //let values = CourseTableController.getDictionaryValues(index: indexPath.section)
        //let selectedRow = values[indexPath.row]
        
        
        //取消选中的行
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
