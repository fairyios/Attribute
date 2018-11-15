
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
internal final class PartHomeCourseCellDataSource: IFtableView {
     
    var source: [Dictionary<String, ((UIViewController, IndexPath, String) -> Void)?>] = [
        
        [
            "Table View": {(target, indexPath, rowKey) -> Void in
                let homeTable = TableHomeController(title: rowKey)
                target.show(homeTable, sender: nil)
            }
        ],
        [
            "Tab Bar": {(target, indexPath, rowKey) -> Void in
                
            }
        ],
        [
            "导航栏": {(target, indexPath, rowKey) -> Void in
                let homeNavigation = NavigationHomeController(title: rowKey)
                target.show(homeNavigation, sender: nil)
            }
        ],
        [
            "手势": {(target, indexPath, rowKey) -> Void in
                let gesture = GestureHomeController(title: rowKey)
                target.show(gesture, sender: nil)
            }
        ],
        [
            "Web Kit": {(target, indexPath, rowKey) -> Void in
                
            }
        ],
        [
            "Visual Effect": {(target, indexPath, rowKey) -> Void in
                
            }
        ],
        [
            "Animation": {(target, indexPath, rowKey) -> Void in
                
            }
        ],
        [
            "Dialog": {(target, indexPath, rowKey) -> Void in
                
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

internal final class PartHomeController: UIViewController, IController {
    
    var navigationTitle: String? = nil
    
    convenience init(title: String) {
        self.init()
        self.navigationTitle = title
    }
    
    
    private lazy var myTable: FtableView! = {
        let data = PartHomeCourseCellDataSource()
        let table = FtableView(target: self, data: data)
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


