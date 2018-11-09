
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
    
    internal static let firstUI = "UI"
    internal static let firstSource = "Source"
    
    //--UI--
    internal static let secondUIUIView: String = "UIView"
    internal static let secondUIUILabel: String = "UILabel"
    internal static let secondUIUIButton: String = "UIButton"
    internal static let secondUIUISlider: String = "UISlider"
    internal static let secondUIUIImage: String = "UIImage"
    internal static let secondUIUIImageView: String = "UIImageView"
    internal static let secondUIUIBarButtonItem: String = "UIBarButtonItem"
    
    //--Source--
    internal static let secondSourceUIFont: String = "UIFont"
    internal static let secondSourceUIColor: String = "UIColor"
    internal static let secondSourceUIScreen: String = "UIScreen"
    internal static let secondSourceUIDevice: String = "UIDevice"
    //internal static let secondSource: String = ""
    
    var sections: [String] = [firstUI, firstSource]
    
    var rows: [[String]] = [
        [
            secondUIUIView, secondUIUILabel, secondUIUIButton, secondUIUISlider, secondUIUIImage,
            secondUIUIImageView, secondUIUIBarButtonItem
        ],
        [secondSourceUIFont, secondSourceUIColor, secondSourceUIScreen, secondSourceUIDevice
        ]
    ]
    
    var actions: Dictionary<String, ((UIViewController, IndexPath) -> Void)?> = [:]
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


