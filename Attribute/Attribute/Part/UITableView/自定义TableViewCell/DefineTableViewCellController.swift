

//
//  ViewController.swift
//  Attribute
//
//  Created by Fairy on 2018/11/6.
//  Copyright © 2018 fairyios. All rights reserved.
//

import UIKit
import SnapKit


/// DefineTableViewCellController
internal final class DefineTableViewCellController: UIViewController, IController {
    //"Attribute.DefineTableViewCell" 获取类名
    private let reuseIdentifier2: String = NSStringFromClass(DefineTableViewCell.self)
    //"DefineTableViewCell" 获取类名
    private let reuseIdentifier: String = String(describing: DefineTableViewCell.self)
    
    var navigationTitle: String? = nil
    
    convenience init(title: String) {
        self.init()
        self.navigationTitle = title
    }
    
    
    
    private lazy var myTable: UITableView! = {
        let table = UITableView()
        // 设置预估行高 --> 先让 tableView 能滚动，在滚动的时候再去计算显示的 cell 的真正的行高，并且调整 tabelView 的滚动范围
        //3：设置estimatedRowHeight或者是实现预估高度代理方法，该值非0即可，或者设置为cell的一半
        //可以说estimatedRowHeight的正确设置，不仅影响了table的绘制效率，同时还能避免出现很多莫名其妙的诡异问题，希望后面的同学在使用中多加注意
        table.estimatedRowHeight = DefineTableViewCell.defineRowHeight
        table.rowHeight = DefineTableViewCell.defineRowHeight
        //table.rowHeight = UITableView.automaticDimension //设置为自动行高
        table.backgroundView = nil
        table.backgroundColor = UIColor.magenta
        table.separatorColor = UIColor.red
        table.delegate = self
        table.dataSource = self
        table.tableHeaderView = UIView()
        table.tableFooterView = nil
        //【DefineTableViewCell.self 能正常运行】
        //table.register(DefineTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        //【DefineTableViewCell.classForCoder() 能正常运行】
        table.register(DefineTableViewCell.classForCoder(), forCellReuseIdentifier: reuseIdentifier)
        return table
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = self.navigationTitle
        self.view.backgroundColor = UIColor.orange
        self.view.addSubview(self.myTable)
        self.myTable.snp.remakeConstraints { maker in maker.edges.equalTo(self.view) }
        
    }
}


// MARK: - UITableViewDataSourcew
extension DefineTableViewCellController: UITableViewDataSource {
    
    
//    /// Asks the data source to return the number of sections in the table view.
//    /// 要求数据源返回表视图中的节数。
//    /// - Parameter tableView: tableView description
//    /// - Returns: return value description
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 11
//    }
//
    
    /// Tells the data source to return the number of rows in a given section of a table view.
    /// 告诉数据源返回表视图的给定部分中的行数。
    /// - Parameters:
    ///   - tableView: tableView description
    ///   - section: section description
    /// - Returns: return value description
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 11
    }
    
    
//    /// Asks the data source for the title of the header of the specified section of the table view.
//    /// 向数据源询问表视图的指定部分的标题的标题。
//    /// - Parameters:
//    ///   - tableView: tableView description
//    ///   - section: section description
//    /// - Returns: return value description
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return ""
//    }
    
    
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: self.reuseIdentifier, for: indexPath)
        return cell
    }
    
    
}


// MARK: - UITableViewDelegate
extension DefineTableViewCellController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //取消选中的行
        tableView.deselectRow(at: indexPath, animated: true)
    }
}



