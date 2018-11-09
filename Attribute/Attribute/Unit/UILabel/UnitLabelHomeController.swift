
//
//  UIViewController.swift
//  Attribute
//
//  Created by Fairy on 2018/11/6.
//  Copyright © 2018 fairyios. All rights reserved.
//

import UIKit
import SnapKit


// MARK: - extension DemoCourseCellDataSource
extension UnitLabelHomeCourseCellDataSource {
    // MARK: - section
    internal static let section1 = "section1"
    internal static let section2 = "section2"
    internal static let section3 = "section3"
    internal static let section4 = "section4"
    internal static let section5 = "section5"
    internal static let section6 = "section6"
    internal static let section7 = "section7"
    internal static let section8 = "section8"
    internal static let section9 = "section9"
    internal static let section10 = "section10"
    
    //--section1--
    internal static let row1_1: String = "row1_1"
    internal static let row1_2: String = "row1_2"
    
    //--section2--
    internal static let row2_1: String = "row2_1"
    internal static let row2_2: String = "row2_2"
    
    //--section3--
    internal static let row3_1: String = "row3_1"
    internal static let row3_2: String = "row3_2"
    
    //--section4--
    internal static let row4_1: String = "row4_1"
    internal static let row4_2: String = "row4_2"
    
    //--section5--
    internal static let row5_1: String = "row5_1"
    internal static let row5_2: String = "row5_2"
    
    //--section6--
    internal static let row6_1: String = "row6_1"
    internal static let row6_2: String = "row6_2"
    
    //--section7--
    internal static let row7_1: String = "row7_1"
    internal static let row7_2: String = "row7_2"
    
    //--section8--
    internal static let row8_1: String = "row8_1"
    internal static let row8_2: String = "row8_2"
    
    //--section9--
    internal static let row9_1: String = "row9_1"
    internal static let row9_2: String = "row9_2"
    
    //--section10--
    internal static let row10_1: String = "row10_1"
    internal static let row10_2: String = "row10_2"
    
}
// MARK: - ICourseCellDataSource
internal final class UnitLabelHomeCourseCellDataSource: ICourseCellDataSource {
    
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
            let con = UIViewController()
            target.show(con, sender: nil)
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
            
        },
        row3_2: {(target, indexPath) -> Void in
            
        },
        //--section4--
        row4_1: {(target, indexPath) -> Void in
            
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

// MARK: - UIViewController
internal final class UnitLabelHomeController: UIViewController {
    
    // MARK: - myTable
    private lazy var myTable: CourseTableView! = {
        let data = UnitLabelHomeCourseCellDataSource()
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


