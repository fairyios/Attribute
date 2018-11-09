
//
//  UIViewController.swift
//  Attribute
//
//  Created by Fairy on 2018/11/6.
//  Copyright © 2018 fairyios. All rights reserved.
//

import UIKit
import SnapKit


// MARK: - extension DemoCourseCellDataSource
extension UnitLabelHomeCourseCellDataSource {
    // MARK: - section
    internal static let section1 = "基本属性"
    internal static let section2 = "section2"
    internal static let section3 = "section3"
    internal static let section4 = "section4"
    internal static let section5 = "section5"
    internal static let section6 = "section6"
    internal static let section7 = "section7"
    internal static let section8 = "section8"
    internal static let section9 = "section9"
    internal static let section10 = "section10"
    
    //--section1--
    internal static let row1_1: String = "自动换行"
    internal static let row1_2: String = "文字添加阴影"
    
    //--section2--
    internal static let row2_1: String = "row2_1"
    internal static let row2_2: String = "row2_2"
    
    //--section3--
    internal static let row3_1: String = "row3_1"
    internal static let row3_2: String = "row3_2"
    
    //--section4--
    internal static let row4_1: String = "row4_1"
    internal static let row4_2: String = "row4_2"
    
    //--section5--
    internal static let row5_1: String = "row5_1"
    internal static let row5_2: String = "row5_2"
    
    //--section6--
    internal static let row6_1: String = "row6_1"
    internal static let row6_2: String = "row6_2"
    
    //--section7--
    internal static let row7_1: String = "row7_1"
    internal static let row7_2: String = "row7_2"
    
    //--section8--
    internal static let row8_1: String = "row8_1"
    internal static let row8_2: String = "row8_2"
    
    //--section9--
    internal static let row9_1: String = "row9_1"
    internal static let row9_2: String = "row9_2"
    
    //--section10--
    internal static let row10_1: String = "row10_1"
    internal static let row10_2: String = "row10_2"
    
}
// MARK: - ICourseCellDataSource
internal final class UnitLabelHomeCourseCellDataSource: ICourseCellDataSource {
    
    var sections: [String] = [
        section1, section2, section3, section4, section5,
        section6, section7, section8, section9, section10
    ]
    
    var rows: [[String]] = [
        //--section1--
        [
            row1_1, row1_2
        ],
        //--section2--
        [
            row2_1, row2_2
        ],
        //--section3--
        [
            row3_1, row3_2
        ],
        //--section4--
        [
            row4_1, row4_2
        ],
        //--section5--
        [
            row5_1, row5_2
        ],
        //--section6--
        [
            row6_1, row6_2
        ],
        //--section7--
        [
            row7_1, row7_2
        ],
        //--section8--
        [
            row8_1, row8_2
        ],
        //--section9--
        [
            row9_1, row9_2
        ],
        //--section10--
        [
            row10_1, row10_2
        ],
    ]
    
    var actions: Dictionary<String, ((UIViewController, IndexPath) -> Void)?> = [
        //--section1--
        row1_1: {(target, indexPath) -> Void in
            //自动换行
            let tar = target as! IUnitLabelHomeController
            tar.row1_1_action()
        },
        row1_2: {(target, indexPath) -> Void in
            //文字添加阴影
            let tar = target as! IUnitLabelHomeController
            tar.row1_2_action()
        },
        //--section2--
        row2_1: {(target, indexPath) -> Void in
            
        },
        row2_2: {(target, indexPath) -> Void in
            
        },
        //--section3--
        row3_1: {(target, indexPath) -> Void in
            
        },
        row3_2: {(target, indexPath) -> Void in
            
        },
        //--section4--
        row4_1: {(target, indexPath) -> Void in
            
        },
        row4_2: {(target, indexPath) -> Void in
            
        },
        //--section5--
        row5_1: {(target, indexPath) -> Void in
            
        },
        row5_2: {(target, indexPath) -> Void in
            
        },
        //--section6--
        row6_1: {(target, indexPath) -> Void in
            
        },
        row6_2: {(target, indexPath) -> Void in
            
        },
        //--section7--
        row7_1: {(target, indexPath) -> Void in
            
        },
        row7_2: {(target, indexPath) -> Void in
            
        },
        //--section8--
        row8_1: {(target, indexPath) -> Void in
            
        },
        row8_2: {(target, indexPath) -> Void in
            
        },
        //--section9--
        row9_1: {(target, indexPath) -> Void in
            
        },
        row9_2: {(target, indexPath) -> Void in
            
        },
        //--section10--
        row10_1: {(target, indexPath) -> Void in
            
        },
        row10_2: {(target, indexPath) -> Void in
            
        },
    ]
}

protocol IUnitLabelHomeController {
    /// row1_1:自动换行
    func row1_1_action()
    
    /// 文字添加阴影
    func row1_2_action()
}

// MARK: - UIViewController
internal final class UnitLabelHomeController: UIViewController, IUnitLabelHomeController {
    
    // MARK: - myTable
    private lazy var myTable: CourseTableView! = {
        let data = UnitLabelHomeCourseCellDataSource()
        let table = CourseTableView(target: self, data: data)
        return table
    }()
    
    
    
    // MARK: - override func viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = UnitHomeCourseCellDataSource.rowUILabel
        self.view.backgroundColor = UIColor.orange
        
        
        self.view.addSubview(self.myTable)
        self.myTable.snp.remakeConstraints { maker in maker.edges.equalTo(self.view) }
    }
    
    
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


