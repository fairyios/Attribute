
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
internal final class TableSectionHeaderCourseCellDataSource: ITableSectionHeaderTableView {
    
    var sections: [String] = ["section 1", "section 2"]
    
    var rows: [[String]] = [
        ["row 1", "row 2"],
        ["row 1", "row 2"],
    ]
    
    var actions: Dictionary<String, ((UIViewController, IndexPath) -> Void)?> = [:]
}


internal final class TableSectionHeaderController: UIViewController, IController {
    
    var navigationTitle: String? = nil
    
    convenience init(title: String) {
        self.init()
        self.navigationTitle = title
    }
    
    
    private lazy var myTable: TableSectionHeaderTableView! = {
        let data = TableSectionHeaderCourseCellDataSource()
        let table = TableSectionHeaderTableView(target: self, data: data)
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


