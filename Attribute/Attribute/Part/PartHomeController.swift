
//
//  UIViewController.swift
//  Attribute
//
//  Created by Fairy on 2018/11/6.
//  Copyright © 2018 fairyios. All rights reserved.
//

import UIKit
import SnapKit



extension PartHomeCourseCellDataSource {
    // MARK: - section
    internal static let section1 = "UITableView"
    internal static let section2 = "UITabBar"
    internal static let section3 = "导航栏"
    internal static let section4 = "手势"
    internal static let section5 = "Dialog"
    internal static let section6 = "动画"
    internal static let section7 = "虚拟特效"
    internal static let section8 = "加载网页"
    internal static let section9 = "section9"
    internal static let section10 = "section10"
    
    //--section1--
    internal static let row1_1: String = "Table View Home"
    internal static let row1_2: String = "row1_2"
    
    //--section2--
    internal static let row2_1: String = "Tab Bar Home"
    internal static let row2_2: String = "row2_2"
    
    //--section3--
    internal static let row3_1: String = "导航栏 Home"
    internal static let row3_2: String = "row3_2"
    
    //--section4--
    internal static let row4_1: String = "手势 Home"
    internal static let row4_2: String = "row4_2"
    
    //--section5--
    internal static let row5_1: String = "Dialog Home"
    internal static let row5_2: String = "row5_2"
    
    //--section6--
    internal static let row6_1: String = "Animation Home"
    internal static let row6_2: String = "row6_2"
    
    //--section7--
    internal static let row7_1: String = "Visual Effect Home"
    internal static let row7_2: String = "UIBlurEffect"
    
    //--section8--
    internal static let row8_1: String = "Web Kit Home"
    internal static let row8_2: String = "row8_2"
    
    //--section9--
    internal static let row9_1: String = "row9_1"
    internal static let row9_2: String = "row9_2"
    
    //--section10--
    internal static let row10_1: String = "row10_1"
    internal static let row10_2: String = "row10_2"
    
}
// MARK: - ICourseCellDataSource
internal final class PartHomeCourseCellDataSource: IFtableView {
    
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
            let homeTable = TableHomeController()
            target.show(homeTable, sender: nil)
        },
        row1_2: {(target, indexPath) -> Void in
            
            
        },
        //--section2--
        row2_1: {(target, indexPath) -> Void in
            
            
        },
        row2_2: {(target, indexPath) -> Void in
            
        },
        //--section3--
        row3_1: {(target, indexPath) -> Void in
            let homeNavigation = NavigationHomeController()
            target.show(homeNavigation, sender: nil)
        },
        row3_2: {(target, indexPath) -> Void in
            
        },
        //--section4--
        row4_1: {(target, indexPath) -> Void in
            let gesture = GestureHomeController()
            target.show(gesture, sender: nil)
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

protocol IPartHomeController {
    /// row1_1:
    func row1_1_action(con: UIViewController, indexPath: IndexPath)
    
    /// row1_2:
    func row1_2_action(con: UIViewController, indexPath: IndexPath)
    
    /// row2_1:
    func row2_1_action(con: UIViewController, indexPath: IndexPath)
}

extension PartHomeController: IPartHomeController {
    /// row1_1:
    public func row1_1_action(con: UIViewController, indexPath: IndexPath) {
        
    }
    
    /// row1_2:
    public func row1_2_action(con: UIViewController, indexPath: IndexPath) {
        
    }
    
    /// row2_1:
    public func row2_1_action(con: UIViewController, indexPath: IndexPath) {
        
    }
    
    
}
internal final class PartHomeController: UIViewController {
    
    
    private lazy var myTable: FtableView! = {
        let data = PartHomeCourseCellDataSource()
        let table = FtableView(target: self, data: data)
        return table
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = HomeCourseCellDataSource.rowUIPart
        self.view.backgroundColor = UIColor.orange
        
        
        self.view.addSubview(self.myTable)
        self.myTable.snp.remakeConstraints { maker in maker.edges.equalTo(self.view) }
    }
    
    
}


