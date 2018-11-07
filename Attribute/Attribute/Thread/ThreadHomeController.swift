 
 //
 //  ViewController.swift
 //  Attribute
 //
 //  Created by Fairy on 2018/11/6.
 //  Copyright © 2018 fairyios. All rights reserved.
 //
 
 import UIKit
 import SnapKit
 
 internal extension ThreadHomeController {
    internal static let firstUI = "关键字"
    
    //--UI--
    internal static let secondUIView: String = "typealias(别名)"
    
 }
 
 /// UIHomeSwiftController
 internal final class ThreadHomeController: UIViewController {
    
    var firstSection: [String] = [firstUI]
    var secondSection: [[String]] = [
        [
            secondUIView
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
        self.navigationItem.title = HomeController.secondNavigation
        self.view.backgroundColor = UIColor.orange
        self.view.addSubview(self.myTable)
        self.myTable.snp.remakeConstraints { maker in maker.edges.equalTo(self.view) }
        
        self.initGroupThread()
    }
    
    
    
    /// 三个任务，分别开辟三个线程，都执行完毕后通知主线程（group）
    private func initGroupThread() {
        //https://blog.csdn.net/cewei711/article/details/80476602
        
        //let group = DispatchGroup()
        let queue1 = DispatchQueue(label: "queue1", attributes: .concurrent, target: DispatchQueue.main)
//        queue1.asyncAfter(deadline: DispatchTime(uptimeNanoseconds: 1), execute: DispatchWorkItem.init(block: {
//            self.navigationItem.title = "queue1.asyncAfter"
//            print("queue1.asyncAfter")
//        }))
//        queue1.asyncAfter(deadline: DispatchTime(uptimeNanoseconds: 2), execute: DispatchWorkItem.init(block: {
//             print("queue1.asyncAfter")
//
//            self.navigationController?.navigationBar.titleTextAttributes = [
//                NSAttributedString.Key.foregroundColor : UIColor.white.cgColor
//            ]
//        }))
        
        queue1.async {
            sleep(1)//秒
            self.navigationItem.title = "queue1.asyncsleep(1)//秒"
            print("queue1.asyncsleep(1)//秒")

        }
        queue1.async {
            sleep(3)//秒
            //self.navigationItem.title = "queue1.asyncsleep(3)//秒"
            print("queue1.asyncsleep(3)//秒")
            self.navigationController?.navigationBar.titleTextAttributes = [
                NSAttributedString.Key.foregroundColor : UIColor.white.cgColor
            ]
        }
        
        let queue2 = DispatchQueue(label: "queue2", attributes: .concurrent, target: DispatchQueue.main)
        queue2.async {
            sleep(2)//秒
//            self.navigationController?.navigationBar.titleTextAttributes = [
//                NSAttributedString.Key.foregroundColor : UIColor.white.cgColor
//            ]
            //self.navigationItem.title = "queue2.async"
            print("queue2.async")
        }
//
//        group.notify(queue: DispatchQueue.main) {
//            //self.navigationItem.title = "group.notify(queue: DispatchQueue.main) 完成"
//        }
    }
    
 }
 
 
 // MARK: - UITableViewDataSourcew
 extension ThreadHomeController: UITableViewDataSource {
    
    
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
 extension ThreadHomeController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let first = firstSection[indexPath.section]
        let second = secondSection[indexPath.section][indexPath.row]
        switch first {
        case ThreadHomeController.firstUI:
            switch second {
            case ThreadHomeController.secondUIView:
                //https://www.jianshu.com/p/5a3fd872257e
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
