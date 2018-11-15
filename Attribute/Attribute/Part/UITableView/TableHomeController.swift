 
//
//  ViewController.swift
//  Attribute
//
//  Created by Fairy on 2018/11/6.
//  Copyright © 2018 fairyios. All rights reserved.
//

import UIKit
import SnapKit

 
 internal final class TableHomeCourseCellDataSource: IFtableViewDataSouce {
     
    var source: [Dictionary<String, ((UIViewController, IndexPath, String) -> Void)?>] = [
        [
            "自定义TableViewCell": {(target, indexPath, rowKey) -> Void in
                let defineTableViewCell = DefineTableViewCellController(title: rowKey)
                target.show(defineTableViewCell, sender: nil)
            }
        ],
        [
            "Header In Section": {(target, indexPath, rowKey) -> Void in
                let sectionHeader = TableSectionHeaderController(title: rowKey)
                target.show(sectionHeader, sender: nil)
            }
        ],
        [
            "": {(target, indexPath, rowKey) -> Void in
                
            }
        ],
        ]
 }

/// TableHomeController
internal final class TableHomeController: UIViewController, IController {
    
    var navigationTitle: String? = nil
    
    convenience init(title: String) {
        self.init()
        self.navigationTitle = title
    }
    
    
    private lazy var myTable: FtableView! = {
        let data = TableHomeCourseCellDataSource()
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}


 
