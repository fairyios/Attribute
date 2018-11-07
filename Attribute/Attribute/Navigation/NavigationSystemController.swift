 
 //
 //  ViewController.swift
 //  Attribute
 //
 //  Created by Fairy on 2018/11/6.
 //  Copyright © 2018 fairyios. All rights reserved.
 //
 
 import UIKit
 import SnapKit
 
 internal extension NavigationSystemController {
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
 
 /// NavigationSystemController
 internal final class NavigationSystemController: UIViewController, UINavigationControllerDelegate {
    
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
        self.navigationItem.title = NavigationHomeController.secondSystem
        self.view.backgroundColor = UIColor.orange
        
        self.view.addSubview(self.myTable)
        self.myTable.snp.remakeConstraints { maker in maker.edges.equalTo(self.view) }
        
        self.initNavigation()
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    /// 设置导航栏
    private func initNavigation() {
        //UINavigationBar.appearance().tintColor = UIColor.red//设置导航栏的统一的背景色
        
        self.navigationController?.navigationBar.barStyle = .black//设置导航栏的样式
        //设置导航栏透明
        self.navigationController?.navigationBar.isTranslucent = true
        //设置导航栏的背景图
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: ""), for: UIBarMetrics.default)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.0) {
            
            self.navigationItem.prompt = "设置导航栏的背景图"
            //设置导航栏的背景图
            //self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: ""), for: UIBarMetrics.default)
            //Thread.sleep(forTimeInterval: 2.0)
            self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "icon-40"), for: UIBarMetrics.default)
            
            //----------------------------------------------------------------
            Thread.sleep(forTimeInterval: 5.0)
            self.navigationItem.prompt = "设置导航栏的背景颜色"
            self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: ""), for: UIBarMetrics.default)
            
            self.navigationController?.navigationBar.backIndicatorImage = nil
            self.navigationController?.navigationBar.shadowImage = nil
            //self.title = "title" // 没有效果
            //self.navigationController?.navigationItem.title = "title"// 没有效果
            //self.navigationController?.navigationBar.backgroundColor = UIColor.orange // 没有效果
            self.navigationController?.navigationBar.barTintColor = UIColor.orange // 设置导航栏的背景色// 有效果,是正确的颜色
            //self.navigationController?.navigationBar.tintColor = UIColor.orange  // 没有效果
            
            //----------------------------------------------------------------
            Thread.sleep(forTimeInterval: 1.0)
            self.navigationItem.prompt = "设置导航栏标题的字体颜色"
            self.navigationController?.navigationBar.titleTextAttributes = [
                NSAttributedString.Key.foregroundColor : UIColor.white.cgColor
            ]
            
            
            
            
            
        }
        
        
        
        
        
        
        //获取控制器中最顶端的视图
        let topViewC = self.navigationController?.topViewController;
        print(topViewC ?? Any.self)
        //获取控制器当前显示的视图
        let currentViewC = self.navigationController?.visibleViewController;
        print(currentViewC ?? Any.self)
        //获取当前控制器所有的子视图
        let viewAarray = self.navigationController?.viewControllers;
        print(viewAarray ?? Any.self)
        
        //        let thread:Thread = Thread {
        //            //设置prompt属性,主要是用来做一些提醒，比如网络请求，数据加载等等
        //            self.navigationItem.prompt = "正在加载数据";
        //            Thread.sleep(forTimeInterval: 3.0)
        //            //不用时，将prompt属性置为nil即可,自带动画效果哦
        //            //self.navigationItem.prompt = nil;
        //        }
        //        thread.start()
    }
 }
 
 
 // MARK: - UITableViewDataSourcew
 extension NavigationSystemController: UITableViewDataSource {
    
    
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
 extension NavigationSystemController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let first = firstSection[indexPath.section]
        let second = secondSection[indexPath.section][indexPath.row]
        switch first {
        case NavigationSystemController.firstUI:
            switch second {
            case NavigationSystemController.secondUIView:
                
                break
            case NavigationSystemController.secondUITableView:
                let homeTable = NavigationSystemController()
                self.show(homeTable, sender: nil)
                break
            case NavigationSystemController.secondUITabBar:
                break
            case NavigationSystemController.secondNavigation:
                let homeNavigation = NavigationSystemController()
                self.show(homeNavigation, sender: nil)
                break
            default:
                break
            }
            break
        case NavigationSystemController.firstDialog:
            
            break
        case NavigationSystemController.firstKit:
            
            break
        default:
            break
        }
        
        
        //取消选中的行
        tableView.deselectRow(at: indexPath, animated: true)
    }
 }
