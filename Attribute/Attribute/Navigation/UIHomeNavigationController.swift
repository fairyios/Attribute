 
 //
 //  ViewController.swift
 //  Attribute
 //
 //  Created by Fairy on 2018/11/6.
 //  Copyright © 2018 fairyios. All rights reserved.
 //
 
 import UIKit
 import SnapKit
 
 internal extension UIHomeNavigationController {
    internal static let firstUI = "UI"
    internal static let firstDialog = "Dialog"
    internal static let firstKit = "Kit"
    
    //--UI--
    internal static let secondUIView: String = "UIView"
    internal static let secondUITableView: String = "UITableView"
    internal static let secondUITabBar: String = "UITabBar"
    internal static let secondNavigation: String = "Navigation"
    //--Kit--
    internal static let secondSnapKit: String = "SnapKit"
    //--Dialog--
    internal static let secondDialogDialog1: String = "Dialog1"
 }
 
 /// UIHomeNavigationController
 internal final class UIHomeNavigationController: UIViewController {
    
    var firstSection: [String] = [firstUI, firstDialog, firstKit]
    var secondSection: [[String]] = [
        [
            secondUIView, secondUITableView, secondUITabBar, secondNavigation
        ],
        [
            secondDialogDialog1
        ],
        [secondSnapKit]
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
        self.navigationItem.title = HomeController.secondNavigation
        self.view.backgroundColor = UIColor.orange
        
        
        self.view.addSubview(self.myTable)
        self.myTable.snp.remakeConstraints { maker in maker.edges.equalTo(self.view) }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
 }
 
 
 // MARK: - UITableViewDataSourcew
 extension UIHomeNavigationController: UITableViewDataSource {
    
    
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
 extension UIHomeNavigationController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let first = firstSection[indexPath.section]
        let second = secondSection[indexPath.section][indexPath.row]
        switch first {
        case UIHomeNavigationController.firstUI:
            switch second {
            case UIHomeNavigationController.secondUIView:
                
                break
            case UIHomeNavigationController.secondUITableView:
                let homeTable = UIHomeNavigationController()
                self.show(homeTable, sender: nil)
                break
            case UIHomeNavigationController.secondUITabBar:
                break
            case UIHomeNavigationController.secondNavigation:
                let homeNavigation = UIHomeNavigationController()
                self.show(homeNavigation, sender: nil)
                break
            default:
                break
            }
            break
        case UIHomeNavigationController.firstDialog:
            
            break
        case UIHomeNavigationController.firstKit:
            
            break
        default:
            break
        }
        
        
        //取消选中的行
        tableView.deselectRow(at: indexPath, animated: true)
    }
 }
