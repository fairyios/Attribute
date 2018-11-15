
//
//  UnitHomeController.swift
//  Attribute
//
//  Created by Fairy on 2018/11/6.
//  Copyright © 2018 fairyios. All rights reserved.
//

import UIKit
import SnapKit
internal final class UnitHomeCourseCellDataSource: IFtableView {
     
    var source: [Dictionary<String, ((UIViewController, IndexPath, String) -> Void)?>] = [
        [
            "UIView": {(target, indexPath, rowKey) -> Void in
                
            }
        ],
        [
            "UILabel": {(target, indexPath, rowKey) -> Void in
                let con = UnitLabelHomeController()
                target.show(con, sender: nil)
            }
        ],
        [
            "UIButton": {(target, indexPath, rowKey) -> Void in
                
            }
        ],
        [
            "UISlider": {(target, indexPath, rowKey) -> Void in
                
            }
        ],
        [
            "UIImage": {(target, indexPath, rowKey) -> Void in
                
            }
        ],
        [
            "UIImageView": {(target, indexPath, rowKey) -> Void in
                
            }
        ],
        [
            "UIBarButtonItem": {(target, indexPath, rowKey) -> Void in
                
            }
        ],
        [
            "UIFont": {(target, indexPath, rowKey) -> Void in
                
            }
        ],
        [
            "UIColor": {(target, indexPath, rowKey) -> Void in
                
            }
        ],
        [
            "UIScreen": {(target, indexPath, rowKey) -> Void in
                
            }
        ],
        [
            "UIDevice": {(target, indexPath, rowKey) -> Void in
                
            }
        ],
        [
            "UITouch": {(target, indexPath, rowKey) -> Void in
                
            }
        ],
        [
            "键盘": {(target, indexPath, rowKey) -> Void in
                
            }
        ],
        [
            "AppDelegate": {(target, indexPath, rowKey) -> Void in
                
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

/// 小部件：UILabel,UIButton,UIImage...
internal final class UnitHomeController: UIViewController, IController {
    var navigationTitle: String? = nil
    
    convenience init(title: String) {
        self.init()
        self.navigationTitle = title
    }
    
    
    private lazy var myTable: FtableView! = {
        let data = UnitHomeCourseCellDataSource()
        let table = FtableView(target: self, data: data)
        return table
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = navigationTitle
        self.view.backgroundColor = UIColor.orange
        
        
        self.view.addSubview(self.myTable)
        self.myTable.snp.remakeConstraints { maker in maker.edges.equalTo(self.view) }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}


