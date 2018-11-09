 
//
//  ViewController.swift
//  Attribute
//
//  Created by Fairy on 2018/11/6.
//  Copyright © 2018 fairyios. All rights reserved.
//

import UIKit
import SnapKit

 
 internal final class TableHomeCourseCellDataSource: ICourseCellDataSource {
    
    internal static let sectionCell = "UITableViewCell"
    
    //--sectionCell--
    internal static let rowDefineCell: String = "自定义TableViewCell"
    
    
    var sections: [String] = [sectionCell]
    
    var rows: [[String]] = [
        [rowDefineCell]
    ]
    
    var actions: Dictionary<String, ((UIViewController,IndexPath) -> Void)?> = [
        rowDefineCell: {(target, indexPath) -> Void in
            let defineTableViewCell = DefineTableViewCellController()
            target.show(defineTableViewCell, sender: nil)
        }
    ]
    
    
 }

/// TableHomeController
internal final class TableHomeController: UIViewController {
    
    private lazy var myTable: CourseTableView! = {
        let data = TableHomeCourseCellDataSource()
        let table = CourseTableView(target: self, data: data)
        return table
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = HomeCourseCellDataSource._uiUITableView
        self.view.backgroundColor = UIColor.orange
        
        
        self.view.addSubview(self.myTable)
        self.myTable.snp.remakeConstraints { maker in maker.edges.equalTo(self.view) }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}


 
