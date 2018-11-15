
//
//  UIViewController.swift
//  Attribute
//
//  Created by Fairy on 2018/11/6.
//  Copyright © 2018 fairyios. All rights reserved.
//

import UIKit
import SnapKit



// MARK: - ICourseCellDataSource
internal final class UnitLabelHomeCourseCellDataSource: IFtableView {
    
    
    var sections: [String] = [ ]
    
    var rows: [[String]] = [  ]
    
    var actions: Dictionary<String, ((UIViewController, IndexPath) -> Void)?> = [:]
    
    var source: [Dictionary<String, ((UIViewController, IndexPath, String) -> Void)?>] = [
        
        [
            "自定义Label": {(target, indexPath, rowKey) -> Void in
                //https://cloud.tencent.com/developer/ask/150777
            }
        ],
        [
            "自动换行": {(target, indexPath, rowKey) -> Void in
                //自动换行
                let tar = target as! UnitLabelHomeController
                tar.row1_1_action()
            }
        ],
        [
            "文字添加阴影": {(target, indexPath, rowKey) -> Void in
                //文字添加阴影
                let tar = target as! UnitLabelHomeController
                tar.row1_2_action()
            }
        ],
        [
            "文本周围的阴影轮廓(实心)": {(target, indexPath, rowKey) -> Void in
                /// 文本周围的阴影轮廓(实心)
                let tar = target as! UnitLabelHomeController
                tar.row2_1_action()
            }
        ],
        [
            "": {(target, indexPath, rowKey) -> Void in
                
            }
        ],
        [
            "": {(target, indexPath, rowKey) -> Void in
                
            }
        ],
        [
            "": {(target, indexPath, rowKey) -> Void in
                
            }
        ],
    ]
}

// MARK: - 初始化
internal final class UnitLabelHomeController: UIViewController, IController {
    
    var navigationTitle: String? = nil
    
    convenience init(title: String) {
        self.init()
        self.navigationTitle = title
    }
    
    // MARK: - myTable
    private lazy var myTable: FtableView! = {
        let data = UnitLabelHomeCourseCellDataSource()
        let table = FtableView(target: self, data: data)
        return table
    }()
    
    
    
    // MARK: - override func viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = self.navigationTitle
        self.view.backgroundColor = UIColor.orange
        
        
        self.view.addSubview(self.myTable)
        self.myTable.snp.remakeConstraints { maker in maker.edges.equalTo(self.view) }
    }
    
    
    // MARK: - 自定义Label
    /// 文本周围的阴影轮廓(实心)
    public func row2_1_action() {
        let con = UIViewController()
        con.view.backgroundColor = UIColor.gray
        
        let define = DefineUILabel()
        define.backgroundColor = UIColor.orange
        define.text = "文本周围的阴影轮廓(实心)"
        define.numberOfLines = 0
//        define.layer.shadowColor = UIColor.red.cgColor
//        define.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
//        define.layer.shadowOpacity = 1.0
//        define.layer.shadowRadius = 0.0
        
        con.view.addSubview(define)
        define.snp.makeConstraints { (make) in
            make.width.equalTo(con.view)
            make.height.equalTo(100)
            make.centerX.equalTo(con.view)
            make.top.equalTo(con.view).offset(70)
        }
        
        self.show(con, sender: nil)
    }
    
    
    // MARK: - 基本属性
    /// 文字添加阴影
    public func row1_2_action() {
        let con = UIViewController()
        con.view.backgroundColor = UIColor.gray
        
        let label1 = UILabel()
        label1.backgroundColor = UIColor.orange
        label1.text = "文字添加阴影"
        label1.numberOfLines = 0
        label1.font = UIFont.systemFont(ofSize: 30) //调整文字大小
        label1.shadowColor = UIColor.red//设置阴影颜色
        label1.shadowOffset = CGSize(width: 5.0, height: 5.0)//设置阴影大小
        
        con.view.addSubview(label1)
        label1.snp.makeConstraints { (make) in
            make.width.equalTo(con.view)
            make.height.equalTo(50)
            make.centerX.equalTo(con.view)
            make.top.equalTo(con.view).offset(70)
        }
        
        let label2 = UILabel()
        label2.backgroundColor = UIColor.orange
        label2.text = "文字添加阴影+不透明度"
        label2.numberOfLines = 0
        label2.font = UIFont.systemFont(ofSize: 30) //调整文字大小
        label2.shadowColor = UIColor.red//设置阴影颜色
        label2.shadowOffset = CGSize(width: 5.0, height: 5.0)//设置阴影大小
        label2.layer.shadowOpacity = 0.1 //图层阴影的不透明度
        
        con.view.addSubview(label2)
        label2.snp.makeConstraints { (make) in
            make.width.equalTo(con.view)
            make.height.equalTo(50)
            make.centerX.equalTo(con.view)
            make.top.equalTo(label1.snp.bottom).offset(10)
        }
        
        self.show(con, sender: nil)
    }
    
    /// row1_1:自动换行
    public func row1_1_action() {
        let con = UIViewController()
        con.view.backgroundColor = UIColor.gray
        
        let label1 = UILabel()
        label1.backgroundColor = UIColor.orange
        label1.text = "自动换行label1.numberOfLines = 0自动换行label1.numberOfLines = 0自动换行label1.numberOfLines = 0自动换行label1.numberOfLines = 0"
        label1.numberOfLines = 0
        
        con.view.addSubview(label1)
        label1.snp.makeConstraints { (make) in
            make.width.equalTo(con.view)
            make.height.equalTo(100)
            make.centerX.equalTo(con.view)
            make.top.equalTo(con.view).offset(70)
        }
        
        
        let label2 = UILabel()
        label2.backgroundColor = UIColor.orange
        label2.text = "高度太小不会自动换行高度太小不会自动换行高度太小不会自动换行"
        label2.numberOfLines = 0
        
        con.view.addSubview(label2)
        label2.snp.makeConstraints { (make) in
            make.width.equalTo(con.view)
            make.height.equalTo(40)
            make.centerX.equalTo(con.view)
            make.top.equalTo(label1.snp.bottom).offset(10)
        }
        
        self.show(con, sender: nil)
        
    }
}


