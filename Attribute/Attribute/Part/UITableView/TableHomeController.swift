 
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
    internal static let sectionHeaderInSection: String = "Header In Section"
    
    //--sectionCell--
    internal static let rowDefineCell: String = "自定义TableViewCell"
    internal static let rowHeaderInSection: String = "Header In Section"
    
    
    var sections: [String] = [sectionCell, sectionHeaderInSection]
    
    var rows: [[String]] = [
        [rowDefineCell],
        [rowHeaderInSection]
    ]
    
    var actions: Dictionary<String, ((UIViewController,IndexPath) -> Void)?> = [
        rowDefineCell: {(target, indexPath) -> Void in
            let defineTableViewCell = DefineTableViewCellController()
            target.show(defineTableViewCell, sender: nil)
        },
        rowHeaderInSection:{(target, indexPath) -> Void in
            let sectionHeader = TableSectionHeaderController()
            target.show(sectionHeader, sender: nil)
        },
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
        self.navigationItem.title = PartHomeCourseCellDataSource.row1_1
        self.view.backgroundColor = UIColor.orange
        
        
        self.view.addSubview(self.myTable)
        self.myTable.snp.remakeConstraints { maker in maker.edges.equalTo(self.view) }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}


 
