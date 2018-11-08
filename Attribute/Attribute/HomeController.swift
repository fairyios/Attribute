//
//  ViewController.swift
//  Attribute
//
//  Created by Fairy on 2018/11/6.
//  Copyright © 2018 fairyios. All rights reserved.
//

import UIKit
import SnapKit

internal extension HomeController {
    internal static let _ui = "UI"
    internal static let _dialog = "Dialog"
    internal static let _animation = "动画"
    internal static let _kit = "Kit"
    internal static let _swift = "Swift"
    internal static let _thread = "线程"
    
    //--UI--
    internal static let _uiUnit: String = "小部件"
    internal static let _uiUITableView: String = "UITableView"
    internal static let _uiUITabBar: String = "UITabBar"
    internal static let _uiNavigation: String = "Navigation"
    //--Dialog--
    internal static let _dialogDialog1: String = "Dialog1"
    //--动画--
    internal static let _animationAnimation1: String = "Animation1"
    //--Kit--
    internal static let _kitSnapKit: String = "SnapKit"
    //--Swift--
    internal static let _swiftSwift1: String = "Swift1"
    //--Thread--
    internal static let _threadThread1: String = "Thread1"
    
    
    /// 数据源
    internal static let _array: [Dictionary<String, Array<String>>] = [
        [_ui : [_uiUnit, _uiUITableView, _uiUITabBar, _uiNavigation]],
        [_dialog : [_dialogDialog1]],
        [_animation : [_animationAnimation1]],
        [_kit : [_kitSnapKit]],
        [_swift : [_swiftSwift1]],
        [_thread : [_threadThread1]]
    ]
    
    /// 节点数
    internal static func getDictionaryCount() -> Int {
        let count = _array.count
        return count
    }
    
    /// 每一行的key
    internal static func getDictionaryKey(index: Int) -> String {
        let node =  _array[index] as Dictionary<String, Array<String>>
        let first = node.first
        let key = first?.key
        return key!
    }
    
    /// 每个节点的values
    internal static func getDictionaryValues(index: Int) -> [String] {
        let node = _array[index] as Dictionary<String, Array<String>>
        let first = node.first
        let values = first?.value
        return values!
    }
}

/// HomeController
internal final class HomeController: UIViewController {
    
    
    
    
    
    
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
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.title = "Attribute"
        
        self.view.addSubview(self.myTable)
        self.myTable.snp.remakeConstraints { maker in maker.edges.equalTo(self.view) }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}


// MARK: - UITableViewDataSourcew
extension HomeController: UITableViewDataSource {
    
    
    /// Asks the data source to return the number of sections in the table view.
    /// 要求数据源返回表视图中的节数。
    /// - Parameter tableView: tableView description
    /// - Returns: return value description
    func numberOfSections(in tableView: UITableView) -> Int {
        return HomeController.getDictionaryCount()
    }
    
    
    /// Tells the data source to return the number of rows in a given section of a table view.
    /// 告诉数据源返回表视图的给定部分中的行数。
    /// - Parameters:
    ///   - tableView: tableView description
    ///   - section: section description
    /// - Returns: return value description
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let values = HomeController.getDictionaryValues(index: section)
        return values.count
    }
    
    
    /// Asks the data source for the title of the header of the specified section of the table view.
    /// 向数据源询问表视图的指定部分的标题的标题。
    /// - Parameters:
    ///   - tableView: tableView description
    ///   - section: section description
    /// - Returns: return value description
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let nodeKey = HomeController.getDictionaryKey(index: section)
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
        let values = HomeController.getDictionaryValues(index: indexPath.section)
      
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.accessoryType = .disclosureIndicator // disclosureIndicator:显示">"图标
        cell.textLabel?.text = values[indexPath.row]
        return cell
    }
    
    
}


// MARK: - UITableViewDelegate
extension HomeController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        
        let title = HomeController.getDictionaryKey(index: indexPath.section)
        let values = HomeController.getDictionaryValues(index: indexPath.section)
        let selectedRow = values[indexPath.row]
        switch title {
        case HomeController._ui:
            switch selectedRow {
                case HomeController._uiUnit:
                    let unitController = UnitHomeController()
                    self.show(unitController, sender: nil)
                    break
                case HomeController._uiUITableView:
                    let homeTable = TableHomeController()
                    self.show(homeTable, sender: nil)
                    break
                case HomeController._uiUITabBar:
                    break
                case HomeController._uiNavigation:
                    let homeNavigation = NavigationHomeController()
                    self.show(homeNavigation, sender: nil)
                    break
                default:
                    break
            }
            break
        case HomeController._dialog:
            
            break
        case HomeController._kit:
            
            break
        case HomeController._swift:
            switch selectedRow {
            case HomeController._swiftSwift1:
                let homeTable = SwiftHomeController()
                self.show(homeTable, sender: nil)
                break
            default:
                break
            }
            break
        case HomeController._thread:
            switch selectedRow {
            case HomeController._threadThread1:
                let homeTable = ThreadHomeController()
                self.show(homeTable, sender: nil)
                break
            default:
                break
            }
            break
        default:
            break
        }
        
       
        //取消选中的行
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
