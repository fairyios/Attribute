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
    
    /// 节点
    var sections: [String] { get set }
    /// 所有行的集合
    var rows: [[String]] { get set }
    /// 每一行对应的闭包action
    var actions: Dictionary<String, ((IndexPath) -> Void)?> { get set }
}

protocol CellDataSource {
    var title: String { get }
}
final class CourceView : UITableView {
    private var temDataSource: [CellDataSource]
    init(dataSource: [CellDataSource]) {
        self.temDataSource = dataSource
        super.init(frame: CGRect.zero, style: UITableView.Style.plain)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
/// CourseTableController
internal final class CourseTableView: UITableView, ICourseTableView {
    
    /// 节点
    var sections: [String] = []
    
    /// 所有行的集合
    var rows: [[String]] = []
    
    /// 每一行对应的闭包action
    var actions: Dictionary<String, ((IndexPath) -> Void)?> = [:]
    
    
    convenience init(sections: [String], rows: [[String]], actions: Dictionary<String, ((IndexPath) -> Void)?>) {
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
        return self.sections.count
    }
    
    
    /// Tells the data source to return the number of rows in a given section of a table view.
    /// 告诉数据源返回表视图的给定部分中的行数。
    /// - Parameters:
    ///   - tableView: tableView description
    ///   - section: section description
    /// - Returns: return value description
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let values = self.rows[section]
        return values.count
    }
    
    
    /// Asks the data source for the title of the header of the specified section of the table view.
    /// 向数据源询问表视图的指定部分的标题的标题。
    /// - Parameters:
    ///   - tableView: tableView description
    ///   - section: section description
    /// - Returns: return value description
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sections[section]
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
        let model = (self.rows[indexPath.section])[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.accessoryType = .disclosureIndicator // disclosureIndicator:显示">"图标
        cell.textLabel?.text = model
        return cell
    }
    
    
}


// MARK: - UITableViewDelegate
extension CourseTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        //let section = self.sections[indexPath.section]
        let row = self.rows[indexPath.section][indexPath.row]
        let action = self.actions[row]
        
        if action != nil && (action!) != nil {
            let a = action!!
            a(indexPath)
        }
        
        //取消选中的行
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
