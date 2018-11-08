 
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
    
    
    /// 返回按钮
    private lazy var leftBarButtonItem: UIBarButtonItem = {
//        let imageView = UIImageView(image: UIImage(named: "home_back_white_24x24"))
//        imageView.transform = .identity
//        imageView.contentMode = .scaleAspectFit
//        imageView.alpha = 0.9
        
        let leftButton =  UIButton()//(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        leftButton.translatesAutoresizingMaskIntoConstraints = false
        leftButton.addTarget(self, action: #selector(self.leftBarButtonItemTouchUpInside), for: .touchUpInside)
        leftButton.clipsToBounds = true
        leftButton.layer.borderWidth = 0.9
        leftButton.layer.borderColor = UIColor.white.cgColor
        leftButton.clipsToBounds = true
        leftButton.layer.cornerRadius = 15
        leftButton.backgroundColor = UIColor.clear
        leftButton.setBackgroundImage(UIImage(named: "home_back_white_24x24"), for: UIControl.State.normal)
        
        let leftBarButtonItem = UIBarButtonItem(customView: leftButton)
        //let leftBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: #selector(self.leftBarButtonItemTouchUpInside))
        
        return leftBarButtonItem
    }()
    
    /// 返回按钮的TouchUpInside
    @objc private func leftBarButtonItemTouchUpInside() {
        print("@objc func back()")
    }
    
    /// 退场按钮
    private lazy var dismissButton: UIButton = {
        let button =  UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(self.dismissButtonTouchUpInside), for: .touchUpInside)
        button.clipsToBounds = true
        button.layer.borderWidth = 0.9
        button.layer.cornerRadius = 0
        button.layer.borderColor = UIColor.purple.cgColor
        button.backgroundColor = UIColor.purple
        button.setTitle("退场", for: UIControl.State.normal)
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0) //使用此属性可以调整按钮内容的有效绘图矩形并重新定位。
//        button.snp.makeConstraints { (make) -> Void in
//            make.width.equalTo(40)
//            make.height.equalTo(40)
//        }
        return button
    }()
    
    /// 退场按钮的TouchUpInside
    @objc private func dismissButtonTouchUpInside() {
        print("@objc func nextViewButtonTouchUpInside()")
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = NavigationHomeController.secondSystem
        self.view.backgroundColor = UIColor.orange
        
        //self.view.addSubview(self.myTable)
        //self.myTable.snp.remakeConstraints { maker in maker.edges.equalTo(self.view) }
        
        self.initNavigation()
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    /// 设置导航栏
    private func initNavigation() {
        
        //设置导航栏的统一的背景色
        //UINavigationBar.appearance().tintColor = UIColor.red
        
        //设置导航栏的样式
        self.navigationController?.navigationBar.barStyle = .black
        
        debugPrint("[mainQueue.asyncAfter][main][1]")
        
        //主队列异步任务,结果为有序
        let mainQueue = DispatchQueue.main
        mainQueue.asyncAfter(deadline: DispatchTime.now() + 1.0) {
            debugPrint("[mainQueue.asyncAfter][-1]")
            
            debugPrint("self.navigationController?.navigationBar.shadowImage ?? Any.self")
            debugPrint(self.navigationController?.navigationBar.shadowImage ?? Any.self)
        }
        mainQueue.asyncAfter(deadline: DispatchTime.now() + 2.0) {
            debugPrint("[mainQueue.asyncAfter][0]")

            //将导航栏设置成透明
            self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
            self.navigationController?.navigationBar.shadowImage = UIImage()
            self.navigationController?.navigationBar.isTranslucent = true
        }
        mainQueue.asyncAfter(deadline: DispatchTime.now() + 3.0) {
            debugPrint("[mainQueue.asyncAfter][1]")

            //self.navigationItem.prompt = "设置导航栏的背景图"
            //设置导航栏的背景图
            let image = UIImage(named: "icon-40")
            self.navigationController?.navigationBar.setBackgroundImage(image, for: UIBarMetrics.default)
            //self.navigationController?.navigationBar.backIndicatorImage //后退按钮旁边显示的图像。
            self.navigationController?.navigationBar.contentMode = .scaleAspectFill
            self.navigationController?.navigationBar.isTranslucent = false
            self.navigationController?.navigationBar.shadowImage = nil
        }
        debugPrint("[mainQueue.asyncAfter][main][2]")
        return
        return
        mainQueue.asyncAfter(deadline: DispatchTime.now() + 0.0) {
            debugPrint("[mainQueue.asyncAfter][2]")
            Thread.sleep(forTimeInterval: 1.0)
            self.navigationItem.prompt = "设置导航栏的背景颜色 清空"
            self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: ""), for: UIBarMetrics.default)
            
            
        }
        mainQueue.asyncAfter(deadline: DispatchTime.now() + 0.0) {
            debugPrint("[mainQueue.asyncAfter][3]")
            Thread.sleep(forTimeInterval: 1.0)
            self.navigationItem.prompt = "设置导航栏的背景色"
            self.navigationController?.navigationBar.backIndicatorImage = nil
            self.navigationController?.navigationBar.shadowImage = nil
            //self.title = "title" // 没有效果
            //self.navigationController?.navigationItem.title = "title"// 没有效果
            //self.navigationController?.navigationBar.backgroundColor = UIColor.orange // 没有效果
            self.navigationController?.navigationBar.barTintColor = UIColor.orange // 设置导航栏的背景色// 有效果,是正确的颜色
            //self.navigationController?.navigationBar.tintColor = UIColor.orange  // 没有效果
        }
        
        mainQueue.asyncAfter(deadline: DispatchTime.now() + 0.0) {
            debugPrint("[mainQueue.asyncAfter][4]")
            Thread.sleep(forTimeInterval: 1.0)
            //self.navigationItem.prompt = "设置导航栏标题的字体颜色"
            self.navigationController?.navigationBar.titleTextAttributes = [
                NSAttributedString.Key.foregroundColor : UIColor.red.cgColor
            ]
        }
        mainQueue.asyncAfter(deadline: DispatchTime.now() + 0.0) {
            debugPrint("[mainQueue.asyncAfter][5]")
            Thread.sleep(forTimeInterval: 1.0)
            //self.navigationItem.prompt = "设置导航栏的leftBarButtonItem"
          
            let customView = UIView()
            customView.snp.makeConstraints { (make) -> Void in
                make.width.equalTo(40)
                make.height.equalTo(40)
            }
            customView.addSubview(self.dismissButton)
            self.dismissButton.snp.makeConstraints { (make) -> Void in
                make.edges.equalTo(customView)
            }
            
            self.navigationItem.hidesBackButton = true
            self.navigationItem.leftBarButtonItem = UIBarButtonItem()
            self.navigationItem.leftBarButtonItem?.customView = customView
            //如果此属性值为正，则组合图像和标题的宽度是固定的。 如果值为0.0或负数，则项目将组合图像和标题的宽度设置为适合。 如果样式使用无线电模式，则忽略此属性。 默认值为0.0。
            //self.navigationItem.leftBarButtonItem?.width = -15
            
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
