
//
//  UnitHomeController.swift
//  Attribute
//
//  Created by Fairy on 2018/11/6.
//  Copyright © 2018 fairyios. All rights reserved.
//

import UIKit
import SnapKit
internal final class UnitHomeCourseCellDataSource: ICourseCellDataSource {
    
    internal static let sectionUI = "UI"
    internal static let sectionSource = "Source"
    
    
    //--section1--
    internal static let rowUIView: String = "UIView"
    internal static let rowUILabel: String = "UILabel"
    internal static let rowUIButton: String = "UIButton"
    internal static let rowUISlider: String = "UISlider"
    internal static let rowUIImage: String = "UIImage"
    internal static let rowUIImageView: String = "UIImageView"
    internal static let rowUIBarButtonItem: String = "UIBarButtonItem"
    
    //--section2--
    internal static let rowUIFont: String = "UIFont"
    internal static let rowUIColor: String = "UIColor"
    internal static let rowUIScreen: String = "UIScreen"
    internal static let rowUIDevice: String = "UIDevice"
    
    var sections: [String] = [sectionUI, sectionSource]
    
    var rows: [[String]] = [
            //--section1--
        [
            rowUIView, rowUILabel, rowUIButton, rowUISlider, rowUIImage,
            rowUIImageView, rowUIBarButtonItem
        ],
            //--section2--
        [
            rowUIFont, rowUIColor, rowUIScreen, rowUIDevice
        ]
    ]
    
    var actions: Dictionary<String, ((UIViewController, IndexPath) -> Void)?> = [
            //--section2--
        rowUIView: {(target, indexPath) -> Void in
            
        },
        rowUILabel: {(target, indexPath) -> Void in
            let con = UnitLabelHomeController()
            target.show(con, sender: nil)
        },
        rowUIButton: {(target, indexPath) -> Void in
            
        },
        rowUISlider: {(target, indexPath) -> Void in
            
        },
        rowUIImage: {(target, indexPath) -> Void in
            
        },
        rowUIImageView: {(target, indexPath) -> Void in
            
        },
        rowUIBarButtonItem: {(target, indexPath) -> Void in
            
        },
            //--section2--
        rowUIFont: {(target, indexPath) -> Void in
            
        },
        rowUIColor: {(target, indexPath) -> Void in
            
        },
        rowUIScreen: {(target, indexPath) -> Void in
            
        },
        rowUIDevice: {(target, indexPath) -> Void in
            
        },
            //--section3--
    ]
}

/// 小部件：UILabel,UIButton,UIImage...
internal final class UnitHomeController: UIViewController {
    
    
    
    private lazy var myTable: CourseTableView! = {
        let data = UnitHomeCourseCellDataSource()
        let table = CourseTableView(target: self, data: data)
        return table
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = HomeCourseCellDataSource.rowUIUnit
        self.view.backgroundColor = UIColor.orange
        
        
        self.view.addSubview(self.myTable)
        self.myTable.snp.remakeConstraints { maker in maker.edges.equalTo(self.view) }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}


