
//
//  ViewController.swift
//  Attribute
//
//  Created by Fairy on 2018/11/6.
//  Copyright © 2018 fairyios. All rights reserved.
//

import UIKit
import SnapKit

internal extension UnitHomeController {
    internal static let firstUI = "UI"
    internal static let firstSource = "Source"
    
    //--UI--
    internal static let secondUIUIView: String = "UIView"
    internal static let secondUIUILabel: String = "UILabel"
    internal static let secondUIUIButton: String = "UIButton"
    internal static let secondUIUISlider: String = "UISlider"
    internal static let secondUIUIImage: String = "UIImage"
    internal static let secondUIUIImageView: String = "UIImageView"
    internal static let secondUIUIBarButtonItem: String = "UIBarButtonItem"
    
    //--Source--
    internal static let secondSourceUIFont: String = "UIFont"
    internal static let secondSourceUIColor: String = "UIColor"
    internal static let secondSourceUIScreen: String = "UIScreen"
    internal static let secondSourceUIDevice: String = "UIDevice"
    //internal static let secondSource: String = ""
    
}

/// 小部件：UILabel,UIButton,UIImage...
internal final class UnitHomeController: UIViewController {
    
    var firstSection: [String] = [firstUI, firstSource]
    var secondSection: [[String]] = [
        [
            secondUIUIView, secondUIUILabel, secondUIUIButton, secondUIUISlider, secondUIUIImage,
            secondUIUIImageView, secondUIUIBarButtonItem
        ],
        [secondSourceUIFont, secondSourceUIColor, secondSourceUIScreen, secondSourceUIDevice
        ]
    ]
    
    
    private lazy var myTable: UITableView! = {
        let table = UITableView()
        table.backgroundView = nil
        table.backgroundColor = UIColor.orange
        table.delegate = self
        table.dataSource = self
        table.rowHeight = 30.0
        table.tableHeaderView = UIView()
        table.tableFooterView = nil
        table.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        
        return table
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = HomeCourseCellDataSource.rowUIUnit
        self.view.backgroundColor = UIColor.orange
        
        
        self.view.addSubview(self.myTable)
        self.myTable.snp.remakeConstraints { maker in maker.edges.equalTo(self.view) }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}


// MARK: - UITableViewDataSourcew
extension UnitHomeController: UITableViewDataSource {
    
    
    /// Asks the data source to return the number of sections in the table view.
    /// 要求数据源返回表视图中的节数。
    /// - Parameter tableView: tableView description
    /// - Returns: return value description
    func numberOfSections(in tableView: UITableView) -> Int {
        return firstSection.count
    }
    
    
    /// Tells the data source to return the number of rows in a given section of a table view.
    /// 告诉数据源返回表视图的给定部分中的行数。
    /// - Parameters:
    ///   - tableView: tableView description
    ///   - section: section description
    /// - Returns: return value description
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return secondSection[section].count
    }
    
    
    /// Asks the data source for the title of the header of the specified section of the table view.
    /// 向数据源询问表视图的指定部分的标题的标题。
    /// - Parameters:
    ///   - tableView: tableView description
    ///   - section: section description
    /// - Returns: return value description
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return firstSection[section]
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
        let second = secondSection[indexPath.section]
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.accessoryType = .disclosureIndicator // disclosureIndicator:显示">"图标
        cell.textLabel?.text = second[indexPath.row]
        return cell
    }
    
    
}


// MARK: - UITableViewDelegate
extension UnitHomeController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
        //取消选中的行
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
