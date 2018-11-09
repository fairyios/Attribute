
//
//  CourseTableViewController.swift
//  Attribute
//
//  Created by Fairy on 2018/11/6.
//  Copyright © 2018 fairyios. All rights reserved.
//

import UIKit
import SnapKit


// MARK: - extension DemoCourseCellDataSource
extension DemoCourseCellDataSource {
    // MARK: - section
    internal static let section1 = "section1"
    internal static let section2 = "section2"
    
    //--section1--
    internal static let row11: String = "row11"
    internal static let row12: String = "row12"
    
    //--section2--
    internal static let row21: String = "row21"
    internal static let row22: String = "row22"
    
}
// MARK: - ICourseCellDataSource
internal final class DemoCourseCellDataSource: ICourseCellDataSource {
    
    var sections: [String] = [section1, section2]
    
    var rows: [[String]] = [
        [
            row11, row12
        ],
        [
            row21, row22
        ]
    ]
    
    var actions: Dictionary<String, ((UIViewController, IndexPath) -> Void)?> = [
        row11: {(target, indexPath) -> Void in
            
        },
        row12: {(target, indexPath) -> Void in
            
        },
        row21: {(target, indexPath) -> Void in
            
        },
        row22: {(target, indexPath) -> Void in
            
        },
    ]
}

// MARK: - UIViewController
internal final class CourseTableViewDemoController: UIViewController {
    
    // MARK: - myTable
    private lazy var myTable: CourseTableView! = {
        let data = DemoCourseCellDataSource()
        let table = CourseTableView(target: self, data: data)
        return table
    }()
    
    
    
    // MARK: - override func viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Demo"
        self.view.backgroundColor = UIColor.orange
        
        
        self.view.addSubview(self.myTable)
        self.myTable.snp.remakeConstraints { maker in maker.edges.equalTo(self.view) }
    }
    
    
}


